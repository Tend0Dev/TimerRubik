import { useTimesStore } from '../store/timesStore';
import { TrashIcon } from "@radix-ui/react-icons"


export default function Table() {
  const times = useTimesStore((state) => state.times);
  const setTimes = useTimesStore((state) => state.setTimes);

  // Mostrar el más reciente primero
  const timesReversed = [...times].reverse();

  // Eliminar tiempo por índice (del array original)
  const handleDelete = (idx: number) => {
    // idx es el índice en timesReversed, así que calcula el índice real
    const realIdx = (times.length - 1 - idx);
    setTimes(times.filter((_, i) => i !== realIdx));
  };

  return (
    <div className="bg-gray-700 rounded-md p-2 max-w-md mx-auto w-full">
      <h2 className="text-lg font-bold mb-2">solve (s):  <span className='text-green-600'>{times.length}</span></h2>
  <div className="overflow-y-auto overflow-x-auto w-full max-h-[50vh] min-h-[150px]">
        <table className="w-full min-w-[400px] text-white text-sm sm:text-xs">
          <thead>
            <tr>
              <th className="border-b px-2 py-1 whitespace-nowrap">#</th>
              <th className="border-b px-2 py-1 whitespace-nowrap">Tiempo</th>
              <th className="border-b px-2 py-1 whitespace-nowrap">Ao5</th>
              <th className="border-b px-2 py-1 whitespace-nowrap">Ao12</th>
              <th className="border-b px-2 py-1 whitespace-nowrap">Eliminar</th>
            </tr>
          </thead>
          <tbody>
            {timesReversed.map((solve, idx) => (
              <tr key={idx}
              className={idx % 2 === 0 ? 'bg-gray-600' : ''}>
                <td className="text-center px-2 py-1 whitespace-nowrap">{timesReversed.length - idx}</td>
                <td className="text-center px-2 py-1 whitespace-nowrap">{solve.time}</td>
                <td className="text-center px-2 py-1 whitespace-nowrap">{solve.ao5}</td>
                <td className="text-center px-2 py-1 whitespace-nowrap">{solve.ao12}</td>
                <td className="text-center px-2 py-1 whitespace-nowrap">
                  <button
                    className="cursor-pointer hover:animate-bounce px-2 py-0.5 rounded"
                    onClick={() => handleDelete(idx)}
                  >
                    <TrashIcon className='size-4 inline-block' style={{ color: '#e8000c' }} />
                  </button>
                </td>
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
}
