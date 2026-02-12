import { Routes, Route } from "react-router-dom";
import Login from "./pages/Login";
import CandidateDashboard from "./pages/CandidateDashboard";
import EmployeeDashboard from "./pages/EmployeeDashboard";
function App() {
  return (
    <div>
      <h1>Candidate Hiring System</h1>
      <Routes>
        <Route path="/" element={<Login />} />
        <Route path="/candidate-dashboard" element={<CandidateDashboard />} />
        <Route path="/employee-dashboard" element={<EmployeeDashboard />} />
      </Routes>
    </div>
  );
}
export default App;
