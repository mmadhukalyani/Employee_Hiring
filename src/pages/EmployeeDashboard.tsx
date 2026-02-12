import { useState } from "react";
function EmployeeDashboard() {
  const [candidateStatus, setCandidateStatus] = useState("applied");
  const updateStatus = (newStatus: string) => {
    setCandidateStatus(newStatus);
  };
  return (
    <div>
      <h2>Employee Dashboard</h2>
      <h3>Candidate: Madhu</h3>
      <p>Current Status: {candidateStatus}</p>
      <h4>Update Candidate Status</h4>
      <button onClick={() => updateStatus("test")}>Schedule Test</button>
      <button onClick={() => updateStatus("l1")}>Move to L1</button>
      <button onClick={() => updateStatus("l2")}>Move to L2</button>
      <button onClick={() => updateStatus("hr")}>Move to HR</button>
      <button onClick={() => updateStatus("selected")}>Select Candidate</button>
      <button onClick={() => updateStatus("rejected")}>Reject Candidate</button>
      {candidateStatus === "selected" && (
        <p>Offer letter will be generated.</p>
      )}
      {candidateStatus === "rejected" && (
        <p>Rejection email will be sent.</p>
      )}
    </div>
  );
}
export default EmployeeDashboard;
