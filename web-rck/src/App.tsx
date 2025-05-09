import './App.css';
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Navbar from './nav/Navbar';
import Footer from './footer/Footer';
import Home from './pages/Home';
import News from './pages/News';
import MeetUs from './pages/MeetUs';
import GetInTouch from './pages/GetInTouch';
import Calendar from './pages/Calendar';
import Classification from './pages/Classification';
import HallOfFame from './pages/HallOfFame';
import OverallClassification from './pages/OverallClassification';

function App() {
  return (
    <div className="app-container">
      <Router>
        <Navbar />
        <div className="content">
         <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/news" element={<News />} />
            <Route path="/meet-us" element={<MeetUs />} />
            <Route path="/contact" element={<GetInTouch />} />
            <Route path="/competition/season2/calendar" element={<Calendar />} />
            <Route path="/competition/season2/classification" element={<Classification />} />
            <Route path="/competition/hall-of-fame" element={<HallOfFame />} />
            <Route path="/competition/overall-classification" element={<OverallClassification />} />
          </Routes>
        </div>
        <Footer />
      </Router>
    </div>
  );
}

export default App;


