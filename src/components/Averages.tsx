import { useTimesStore } from "../store/timesStore"
import TimesChart from './TimesChart';


export default function Averages() {
  const times = useTimesStore((state) => state.times);
  const setTimes = useTimesStore((state) => state.setTimes);


  
  
  const pb = times.length > 0 ? Math.min(...times.map(s => parseFloat(s.time))).toFixed(2) : "0.00";

  // Calcular Ao50
  const getAo = (count: number): string => {
    if (times.length < count) return "--";
    const lastSolves = times.slice(-count).map(s => parseFloat(s.time));
    // Remove min and max
    const min = Math.min(...lastSolves);
    const max = Math.max(...lastSolves);
    const filtered = lastSolves.filter(t => t !== min && t !== max);
    const avg = filtered.reduce((acc, t) => acc + t, 0) / (count - 2);
    return avg.toFixed(2);
  };

  return (
    <section className="flex flex-col ">
      
      <div className="hidden xl:flex">
        <TimesChart />
      </div>
      

      <div className=" font-bold">
        <p className="text-center">pb: <span className="text-xl text-green-500">{pb}</span></p>
      
      <div className="flex justify-evenly px-4">
        <p>Ao5: <span>{getAo(5)}</span></p>
        <p>Ao12: <span>{getAo(12)}</span></p>
      </div>
      <div className="flex justify-evenly px-4">
        <p>Ao50: <span>{getAo(50)}</span></p>
        <p>Ao100: <span>{getAo(100)}</span></p>
      </div>
      <div className="flex place-content-center">
        <button
          className="mt-6 bg-gray-600 border-white border  hover:bg-red-500 hover:border-red-600 text-white hover:text-white px-4 py-2 rounded self-center hover:scale-105 ease-linear duration-300 cursor-pointer"
          onClick={() => setTimes([])}
        >
          Clear Times
        </button>
      </div>

      </div>
      
    </section>                                               
  )
}
