import { Line } from 'react-chartjs-2';
import {
  Chart as ChartJS,
  CategoryScale,
  LinearScale,
  PointElement,
  LineElement,
  Title,
  Tooltip,
  Legend,
} from 'chart.js';
import { useTimesStore } from '../store/timesStore';

ChartJS.register(CategoryScale, LinearScale, PointElement, LineElement, Title, Tooltip, Legend);

export default function TimesChart() {
  const times = useTimesStore((state) => state.times);
  const last10 = times.slice(-10);
  const last10Times = last10.map(s => parseFloat(s.time));
  const mean = last10Times.length > 0 ? (last10Times.reduce((a, b) => a + b, 0) / last10Times.length).toFixed(2) : "0.00";

  const chartData = {
    labels: last10.map((_, i) => `#${times.length - last10.length + i + 1}`),
    datasets: [
      {
        label: 'Time',
        data: last10Times,
        borderColor: 'rgb(59,130,246)', // Tailwind blue-500
        backgroundColor: 'rgba(59,130,246,0.2)',
        tension: 0.3,
        pointRadius: 4,
      },
      {
        label: 'average',
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
        title: { display: true, text: 'Time (s)' },
        beginAtZero: true,
      },
      x: {
        title: { display: true, text: 'Solve' },      
      },
    },
  };

  return (
    <div className="mb-5">
      <Line data={chartData} options={chartOptions} />
    </div>
  );
}
