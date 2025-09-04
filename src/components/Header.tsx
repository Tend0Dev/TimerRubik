import Logo from '/images/logo.png'
import { useScrambleStore } from '../store/scrambleStore';
import { IconReload } from '@tabler/icons-react';

export default function Header() {

  const scramble = useScrambleStore((state) => state.scramble);
  const newScramble = useScrambleStore((state) => state.newScramble);


  return (
    <header className='bg-gray-600 flex justify-between h-[75px] px-8 py-2 rounded-[10px] items-center mb-6 mx-4 text-center'>
      <div className='flex items-center '>
        <img className='p-2 size-20' src={Logo} alt="Logo" />
        <h1 className='text-xl font-bold'>TimerRubik</h1>
      </div>

      <div>
        <h2 className='font-bold'>Scramble: </h2>
        <span className='text-xl font-bold'>
          {
            scramble
          }
        </span>
      </div>

      <div className='grid place-items-center cursor-pointer hover:scale-105 ease-linear duration-300 ' onClick={() => {
            newScramble();
          }}
          >
        <p className='font-bold'>New Scramble:</p>
        <div className=" animate-spin ">
          <IconReload stroke={2} />
        </div>

      </div>


    </header>
  )
}

