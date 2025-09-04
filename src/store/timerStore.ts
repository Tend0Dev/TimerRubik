import { create } from 'zustand';

interface TimerState {
  timerRunning: boolean;
  setTimerRunning: (running: boolean) => void;
}

export const useTimerStore = create<TimerState>((set) => ({
  timerRunning: false,
  setTimerRunning: (running) => set({ timerRunning: running }),
}));
