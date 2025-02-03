import './Navbar.css';
import { useState } from 'react';
import { Link } from 'react-router-dom';
import logo from './assets/RCK_Logo_Cua_RenderMor.png'; // Asegúrate de que la ruta es correcta

const Navbar = () => {

  const [isDropdownOpen, setIsDropdownOpen] = useState(false);

  const handleDropdownToggle = () => {
    setIsDropdownOpen(!isDropdownOpen); // Alterna el estado del dropdown
  };
  return (
    <nav className="navbar">
      <div className="navbar-logo">
      <Link to="/">
          <img src={logo} alt="Logo de RCK" />
        </Link>
      </div>
      <ul className="navbar-links">
      <li><Link to="/">Home</Link></li>
        <li
          className="dropdown"
          onMouseEnter={handleDropdownToggle}
          onMouseLeave={handleDropdownToggle}
        >
          <Link to="/competition">Competición</Link>
          {isDropdownOpen && (
            <ul className="dropdown-menu">
              <li><Link to="/competition/season1">Season1</Link></li>
              <li><Link to="/competition/season2">Season2</Link></li>
              <li><Link to="/competition/rules">Reglamento</Link></li>
            </ul>
       )}
        </li>
        <li><Link to="/news">Noticias</Link></li>
        <li><Link to="/meet-us">Conócenos</Link></li>
        <li><Link to="/contact">Contacta con nosotros</Link></li>
      </ul>
    </nav>
  );
};

export default Navbar;
