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
    <div className="bg-gray-700 rounded-md p-4">
      <h2 className="text-xl font-bold mb-4">solve (s):  <span className='text-green-600'>{times.length}</span></h2>
      <div className="overflow-y-auto" style={{ maxHeight: '500px' }}>
        <table className="w-full text-white">
          <thead>
            <tr>
              <th className="border-b">#</th>
              <th className="border-b">Tiempo</th>
              <th className="border-b">Ao5</th>
              <th className="border-b">Ao12</th>
              <th className="border-b">Eliminar</th>
            </tr>
          </thead>
          <tbody>
            {timesReversed.map((solve, idx) => (
              <tr key={idx}
              className={idx % 2 === 0 ? 'bg-gray-600' : ''}>
                <td className="text-center">{timesReversed.length - idx}</td>
                <td className="text-center">{solve.time}</td>
                <td className="text-center">{solve.ao5}</td>
                <td className="text-center">{solve.ao12}</td>
                <td className="text-center">
                  <button
                    className="cursor-pointer hover:animate-bounce px-4 py-1 rounded"
                    onClick={() => handleDelete(idx)}
                  >
                    <TrashIcon className='size-5 inline-block' style={{ color: '#e8000c' }} />
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
