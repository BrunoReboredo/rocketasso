import './Navbar.css';
import { useState } from 'react';
import { Link } from 'react-router-dom';
import logo from './assets/RCK_Logo_Cua_RenderNeg.png'; // Asegúrate de que la ruta es correcta

const Navbar = () => {

  const [isDropdownOpen, setIsDropdownOpen] = useState(false);
  const [isSubmenuOpen, setIsSubmenuOpen] = useState(false); // Estado para el submenú


  const handleDropdownToggle = () => {
    setIsDropdownOpen(!isDropdownOpen); // Alterna el estado del dropdown
  };

  const handleSubmenuToggle = () => {
    setIsSubmenuOpen(!isSubmenuOpen);
  };

  return (
    <nav className="navbar">
      <div className="navbar-logo">
      <Link to="/">
          <img src={logo} alt="Logo de RCK" />
        </Link>
      </div>
      <ul className="navbar-links">
      <li><Link to="/">Inicio</Link></li>
        <li
          className="dropdown"
          onMouseEnter={handleDropdownToggle}
          onMouseLeave={handleDropdownToggle}
        >
          <Link to="/competition">Competición</Link>
          {isDropdownOpen && (
            <ul className="dropdown-menu">
              <li
                className="submenu"
                onMouseEnter={handleSubmenuToggle}
                onMouseLeave={handleSubmenuToggle}
              >
                <Link to="/competition/season2">RCK Season 2</Link>
                {isSubmenuOpen && (
                  <ul className="submenu-menu">
                    <li><Link to="/competition/season2/calendar">Calendario</Link></li>
                    <li><Link to="/competition/season2/classification">Clasificación</Link></li>
                  </ul>
                )}
              </li>
              <li><Link to="/competition/overall-classification">Clasificación histórica</Link></li>
              <li><Link to="/competition/hall-of-fame">Hall of fame</Link></li>
              <li>
                <a href="/reglamento.pdf" download="Reglamento_Rocketasso.pdf" target="_blank" rel="noopener noreferrer">
                Reglamento
                </a>
              </li>
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
