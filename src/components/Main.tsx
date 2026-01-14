import Averages from "./Averages";
import Table from "./Table";

import Timer from "./Timer";


export function Main() {
  return (
    <div className=" grid xl:grid-cols-3 mx-4 flex-grow xl:min-h-[calc(100vh-var(--header-footer-height))]">

      {/* Timer primero en mobile, segundo en xl */}
      <div className="self-center h-50 order-1  xl:order-2 ">
        <Timer />
      </div>

      {/* Averages segundo en mobile, primero en xl */}
      <div className="self-center mb-10 order-2 xl:order-1">
        <Averages />
      </div>

      {/* List siempre al final */}
      <div className=" self-center order-3 ">
        <Table />
      </div>

    </div>
  )
}
