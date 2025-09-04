import Footer from "./components/Footer"
import Header from "./components/Header"
import { Main } from "./components/Main"

function App() {

  return (
    <main className="min-h-screen bg-gradient-to-b from-gray-800 to-gray-900 flex flex-col items-between text-white">
      <section className=" my-3 xl:w-[1170px]"></section>
        <Header />
        <Main />
        <Footer />
    </main>
  )
}

export default App
