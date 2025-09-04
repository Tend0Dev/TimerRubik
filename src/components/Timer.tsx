import TimerComponent from '../services/TimerComponent';




export default function Timer() {

  return (
    <div className="p-4 rounded-md grid justify-items-center items-center place-content-center">
      <div className="text-9xl font-bold">
        <TimerComponent />
      </div>
    </div>
  );
}
