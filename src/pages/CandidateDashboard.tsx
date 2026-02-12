import { useState } from "react";
function CandidateDashboard() {
  const [status, setStatus] = useState("applied");
  const moveToNextStage = () => {
    if (status === "applied") {
      setStatus("test");
    } else if (status === "test") {
      setStatus("l1");
    } else if (status === "l1") {
      setStatus("l2");
    } else if (status === "l2") {
      setStatus("hr");
    } else if (status === "hr") {
      setStatus("selected");
    } else if (status === "selected") {
      setStatus("onboarding");
    } else if (status === "onboarding") {
      setStatus("assigned");
    }
  };
  return (
    <div>
      <h2>Candidate Dashboard</h2>
      <h3>Current Status: {status}</h3>
      {status === "applied" && <p>You have applied for the role.</p>}
      {status === "test" && <p>Online test is scheduled.</p>}
      {status === "l1" && <p>L1 Interview scheduled.</p>}
      {status === "l2" && <p>L2 Interview scheduled.</p>}
      {status === "hr" && <p>HR Interview scheduled.</p>}
      {status === "selected" && <p>Congratulations! You are selected.</p>}
      {status === "onboarding" && <p>Onboarding process started.</p>}
      {status === "assigned" && (
        <div>
          <p>Assigned to Team WarForge</p>
          <p>Reporting Manager: Amit Luthra</p>
          <p>Office Timing: 10AM - 7PM</p>
        </div>
      )}
      <br />
      <button onClick={moveToNextStage}>
        Move to Next Stage (Simulation)
      </button>
    </div>
  );
}
export default CandidateDashboard;
