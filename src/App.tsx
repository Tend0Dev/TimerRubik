import Footer from "./components/Footer"
import Header from "./components/Header"
import { Main } from "./components/Main"

function App() {

  return (
    <main className="min-h-screen flex flex-col bg-gradient-to-b from-gray-800 to-gray-900 text-white">
        <Header />
        <div className="mb-10">
          <Main />
        </div>
        <div className="xl:absolute mb-3 bottom-0 w-full">
          <Footer />
        </div>
    </main>
  )
}

export default App
