import Logo from '/images/logo.png'
import { useScrambleStore } from '../store/scrambleStore';
import { IconReload } from '@tabler/icons-react';

export default function Header() {

  const scramble = useScrambleStore((state) => state.scramble);
  const newScramble = useScrambleStore((state) => state.newScramble);


  return (
    <header className='bg-gray-600 flex justify-between py-1 px-8 rounded-[10px] items-center mb-6 mx-4 mt-4 text-center'>
      <div className='items-center hidden lg:flex'>
        <img className='p-2 size-20' src={Logo} alt="Logo" />
        <h1 className='text-xl font-bold'>TimerRubik</h1>
      </div>

      <div>
        <h2 className='font-bold'>Scramble: </h2>
        <span className=' text-sm sm:text-xl font-bold'>
          {
            scramble
          }
        </span>
      </div>

      <div className='grid place-items-center cursor-pointer hover:scale-105' onClick={() => {newScramble();}}
          >
        <p className='font-bold'>New Scramble:</p>
        <IconReload className='animate-spin' stroke={2} />
      </div>


    </header>
  )
}

