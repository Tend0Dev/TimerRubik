import { create } from 'zustand';
import Utils from '../services/Utils';

interface ScrambleState {
  scramble: string;
  newScramble: () => void;
  setScramble: (scramble: string) => void;
}

export const useScrambleStore = create<ScrambleState>((set) => ({
  scramble: new Utils().getScramble(),
  newScramble: () => set({ scramble: new Utils().getScramble() }),
  setScramble: (scramble) => set({ scramble }),
}));
