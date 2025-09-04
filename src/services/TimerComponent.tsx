import React, { useEffect, useMemo, useState } from "react";
import { useTimesStore } from '../store/timesStore';
import { useScrambleStore } from '../store/scrambleStore';

export interface Solve {
  time: string; // formatted seconds with 2 decimals
  ao5: string | "--";
  ao12: string | "--";
  ao100: string | "--";
}

export interface TimerProps {
  onNewScramble?: () => void;
}

// --- Component --------------------------------------------------------------
const TimerComponent: React.FC<TimerProps> = ({ onNewScramble }) => {
  const [isPrepared, setIsPrepared] = useState(false);
  const [timerRunning, setTimerRunning] = useState(false);
  const [time, setTime] = useState<string>("0.00");
  const [initialTime, setInitialTime] = useState<number | null>(null);
  const [finalTime, setFinalTime] = useState<number | null>(null);
  const [bufferKey, setBufferKey] = useState<string>("");
  const [timesBuffer, setTimesBuffer] = useState<number>(0);
  const times = useTimesStore((state) => state.times);
  const addTime = useTimesStore((state) => state.addTime);


  const newScramble = useScrambleStore((state) => state.newScramble);
  

  // Zustand ya maneja el estado global, puedes eliminar la sincronización localStorage aquí

  // Helper to compute averages of N including current (just-finished) time
  const getAo = (count: number, lastTimeFormatted: string): string => {
    if (times.length < count - 1) return "--";

    // last (count-1) solves from history + current one
    const lastSolves = times
      .slice() // copy
      .reverse()
      .slice(0, count - 1)
      .map((t) => parseFloat(t.time));

    lastSolves.push(parseFloat(lastTimeFormatted));

    // Remove exactly one min and one max
    const min = Math.min(...lastSolves);
    const max = Math.max(...lastSolves);
    const minIndex = lastSolves.indexOf(min);
    if (minIndex !== -1) lastSolves.splice(minIndex, 1);
    const maxIndex = lastSolves.indexOf(max);
    if (maxIndex !== -1) lastSolves.splice(maxIndex, 1);

    const sum = lastSolves.reduce((acc, n) => acc + n, 0);
    const avg = sum / (count - 2);
    return avg.toFixed(2);
  };

  // Key handling + start/stop logic
  useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      // Stop timer on any key while running
      if (timerRunning) {
        const end = Date.now();
        setFinalTime(end);
        newScramble();
        if (initialTime != null) {
          const elapsed = (end - initialTime) / 1000;
          const formatted = elapsed.toFixed(2);
          setTime(formatted);
          setTimerRunning(false);
          

          const newSolve: Solve = {
            time: formatted,
            ao5: getAo(5, formatted),
            ao12: getAo(12, formatted),
            ao100: getAo(100, formatted),
          };
          addTime(newSolve); // Guardar en Zustand
          
        }
        return; // Don't process further when stopping
      }

      // Prevent page scroll on Space
      if (e.code === "Space") e.preventDefault();

      // Arm (prepare) when holding Space until key-repeat triggers 8 times
      if (e.code === "Space" && bufferKey === "Space") {
        setTimesBuffer((prev) => {
          const next = prev + 1;
          if (next === 8) {
            setIsPrepared(true);     
          }
          return next;
        });
      } else {
        setTimesBuffer(0);
      }

      setBufferKey(e.code);
    };

    const handleKeyUp = (e: KeyboardEvent) => {
      if (e.code === "Space") {
        e.preventDefault();
        if (isPrepared) {
          const start = Date.now();
          setInitialTime(start);
          setTimerRunning(true);
          setIsPrepared(false);
        }
      }
      setTimesBuffer(0);
    };

    document.addEventListener("keydown", handleKeyDown);
    document.addEventListener("keyup", handleKeyUp);
    return () => {
      document.removeEventListener("keydown", handleKeyDown);
      document.removeEventListener("keyup", handleKeyUp);
    };
  }, [timerRunning, isPrepared, bufferKey, initialTime, times]);

  // While running, update the displayed time every 10ms
  useEffect(() => {
    if (!timerRunning || initialTime == null) return;
    const id = window.setInterval(() => {
      const now = Date.now();
      setFinalTime(now);
      const elapsed = (now - initialTime) / 1000;
      setTime(elapsed.toFixed(2));
    }, 10);
    return () => window.clearInterval(id);
  }, [timerRunning, initialTime]);


  
  const timerClass = useMemo(() => {
    return timerRunning || isPrepared ? "running" : "";
  }, [timerRunning, isPrepared]);

  return (
    <div className="w-full flex items-center justify-center py-10 select-none">
      <h1
        className={`font-mono text-7xl md:text-8xl tracking-tight text-white${timerClass} ` +
          `${timerRunning ? "text-green-600" : isPrepared ? "text-yellow-500" : "text-gray-900"}`}
      >
        {time}
      </h1>
    </div>
  );
};

export default TimerComponent;
