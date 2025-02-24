import './Navbar.css';
import { useState } from 'react';
import { Link } from 'react-router-dom';
import logo from '../assets/RCK_Logo_Cua_RenderNeg.png';
import arrowDown from '../assets/Flecha_abajo.png';
import arrowRight from '../assets/Flecha_derecha.png';
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faXTwitter, faTwitch, faYoutube, faDiscord } from "@fortawesome/free-brands-svg-icons";

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
    <li className="dropdown" onMouseEnter={handleDropdownToggle} onMouseLeave={handleDropdownToggle}>
      <div className="dropdown-item">Competición
        <img src={arrowDown} alt="Flecha abajo" className="dropdown-arrow" />
      </div>
      {isDropdownOpen && (
        <ul className="dropdown-menu">
          <li className="submenu" onMouseEnter={handleSubmenuToggle} onMouseLeave={handleSubmenuToggle}>
            <div className="dropdown-item">RCK Season 2
              <img src={arrowRight} alt="Flecha abajo" className="dropdown-arrow" />
            </div>
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
    <li><Link to="/contact">Contacto</Link></li>
  </ul>

  {/* Mueve los iconos aquí */}
  <div className="social-icons">
    <a href="https://x.com/Rocketasso_" target="_blank" rel="noopener noreferrer">
      <FontAwesomeIcon icon={faXTwitter} size="2x" />
    </a>
    <a href="https://www.twitch.tv/rocketasso" target="_blank" rel="noopener noreferrer">
      <FontAwesomeIcon icon={faTwitch} size="2x" />
    </a>
    <a href="https://www.youtube.com/@RocketAsso" target="_blank" rel="noopener noreferrer">
      <FontAwesomeIcon icon={faYoutube} size="2x" />
    </a>
    <a href="https://discord.com/invite/jK2DfwHDaQ" target="_blank" rel="noopener noreferrer">
      <FontAwesomeIcon icon={faDiscord} size="2x" />
    </a>
  </div>
</nav>
  );
};

export default Navbar;
