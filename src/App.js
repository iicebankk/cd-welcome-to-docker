import "./App.css";
import Confetti from "./Confetti";

const shareMessage = "I just ran my first container using Docker";
const shareLink = "https://docker.com/";

const App = () => {
  return (
    <div className="App">
      <Confetti />
      <header className="App-header">
        <h1 style={{ marginBottom: "0px" }}>Congratulations MR.David!!!</h1>
        <p style={{ marginTop: "10px", marginBottom: "50px" }}>
          You ran your first container SHOHOOO.
        </p>
      </header>
    </div>
  );
};

export default App;
