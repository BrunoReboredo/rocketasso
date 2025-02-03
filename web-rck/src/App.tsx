import './App.css'
import { BrowserRouter as Router, Route, Routes } from 'react-router-dom';
import Navbar from './Navbar';
import Home from './pages/Home';
import News from './pages/News';
import MeetUs from './pages/MeetUs';
import GetInTouch from './pages/GetInTouch';
//import Competition from './pages/Competition';

function App() {
  return (
    <Router>
      <Navbar />
      <Routes>
        <Route path="/" element={<Home />} />
        <Route path="/news" element={<News />} />
        <Route path="/meet-us" element={<MeetUs />} />
        <Route path="/contact" element={<GetInTouch />} />
      </Routes>
    </Router>
  );
}

export default App;

