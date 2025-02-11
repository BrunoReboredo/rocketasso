import React from "react";
import Navbar from "../nav/Navbar"; 
import Footer from "../footer/Footer"; 
import "./MeetUs.css";


const MeetUs: React.FC = () => {
  return (
<div className="meet-us-container">
      <Navbar />
      
      <div className="section">
        <div className="question-box">¿QUIÉNES SOMOS?</div>
        <div className="answer-box">EXPLICACIÓN</div>
      </div>

      <div className="section">
        <div className="question-box">¿QUIÉN TRABAJA EN LA RCK?</div>
        <div className="answer-box">LISTA NOMBRES - ROLES</div>
      </div>

      <Footer />
    </div>
  );
};

export default MeetUs;
