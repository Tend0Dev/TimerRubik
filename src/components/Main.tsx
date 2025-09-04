import Averages from "./Averages";
import List from "./List";
import Timer from "./Timer";


export function Main() {
  return (
    <div className="h-[calc(100vh-280px)] grid grid-cols-3 py-8 px-4 gap-2">
        <Averages />
        <Timer />
        <List />
    </div>
  )
}

