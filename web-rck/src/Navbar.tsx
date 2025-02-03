import './Navbar.css';
import { Link } from 'react-router-dom';
import logo from './assets/RCK_Logo_Cua_RenderMor.png'; // Asegúrate de que la ruta es correcta

const Navbar = () => {
  return (
    <nav className="navbar">
      <div className="navbar-logo">
      <Link to="/">
          <img src={logo} alt="Logo de RCK" />
        </Link>
      </div>
      <ul className="navbar-links">
        <li><Link to="/">Home</Link></li>
        <li><Link to="/competition">Competición</Link></li>
        <li><Link to="/news">Noticias</Link></li>
        <li><Link to="/meet-us">Conócenos</Link></li>
        <li><Link to="/contact">Contacta con nosotros</Link></li>
      </ul>
    </nav>
  );
};

export default Navbar;
