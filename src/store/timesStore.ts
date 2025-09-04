import { create } from 'zustand';
import type { Solve } from '../services/TimerComponent';

interface TimesState {
  times: Solve[];
  setTimes: (times: Solve[]) => void;
  addTime: (solve: Solve) => void;
}

export const useTimesStore = create<TimesState>((set) => {
  // Inicializar desde localStorage
  let initialTimes: Solve[] = [];
  try {
    const raw = localStorage.getItem('times');
    if (raw) initialTimes = JSON.parse(raw);
  } catch {}

  return {
    times: initialTimes,
    setTimes: (times) => {
      localStorage.setItem('times', JSON.stringify(times));
      set({ times });
    },
    addTime: (solve) => {
      set((state) => {
        const newTimes = [...state.times, solve];
        localStorage.setItem('times', JSON.stringify(newTimes));
        return { times: newTimes };
      });
    },
  };
});
