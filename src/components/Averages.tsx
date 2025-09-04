import { useTimesStore } from "../store/timesStore"
import TimesChart from './TimesChart';


export default function Averages() {
  const times = useTimesStore((state) => state.times);
  const setTimes = useTimesStore((state) => state.setTimes);

  // Obtener los últimos 10 solves
  const last10 = times.slice(-10);
  const last10Times = last10.map(s => parseFloat(s.time));
  const mean = last10Times.length > 0 ? (last10Times.reduce((a, b) => a + b, 0) / last10Times.length).toFixed(2) : "0.00";

  const chartData = {
    labels: last10.map((_, i) => `#${times.length - last10.length + i + 1}`),
    datasets: [
      {
        label: 'Tiempo',
        data: last10Times,
        borderColor: 'rgb(59,130,246)', // Tailwind blue-500
        backgroundColor: 'rgba(59,130,246,0.2)',
        tension: 0.3,
        pointRadius: 4,
      },
      {
        label: 'Media',
        data: last10Times.length > 0 ? Array(last10Times.length).fill(mean) : [],
        borderColor: 'rgb(34,197,94)', // Tailwind green-500
        borderDash: [8,4],
        pointRadius: 0,
        fill: false,
      },
    ],
  };

  const chartOptions = {
    responsive: true,
    plugins: {
      legend: { display: true },
      title: { display: false },
    },
    scales: {
      y: {
        title: { display: true, text: 'Tiempo (s)' },
        beginAtZero: true,
      },
      x: {
        title: { display: true, text: 'Solve' },
      },
    },
  };
  
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
    <section className="flex flex-col py-4 px-8 rounded-md gap-4">
      <TimesChart />
      <div className=" font-bold">

        
        <p className="text-center">pb: <span className="text-xl text-green-500">{pb}</span></p>
      
      <div className="flex justify-between px-4">
        <p>Ao5: <span>{getAo(5)}</span></p>
        <p>Ao12: <span>{getAo(12)}</span></p>
      </div>
      <div className="flex justify-between px-4">
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
