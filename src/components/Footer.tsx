import { GitHubLogoIcon } from "@radix-ui/react-icons"
import { IconCopyright } from '@tabler/icons-react';

const year = new Date().getFullYear()

export default function Footer() {
  return (

    <footer className="max-w-screen flex flex-col justify-center items-center py-2 border-gray-700 text-white gradient bg-linear-to-r from-gray-500 to-gray-800 rounded-xl mx-4 ">
            
        <a href="https://github.com/Tend0Dev" target="_blank" rel="noopener noreferrer">
                <GitHubLogoIcon className=" size-6 cursor-pointer  " style={{ color: '#080808' }} />
        </a>
        
        <small className=" flex gap-1 items-center mr-3">
            <IconCopyright stroke={2} />

            <span className="font-bold "> {year}</span> 
            <span>RubikTimer is a free ad-free timer for speedcubers!
            Enjoy!  </span>
        </small>

        
        
    </footer>
    

  )
}
