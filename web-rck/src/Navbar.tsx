import './Navbar.css';
import logo from './assets/RCK_Logo_Cua_RenderMor.png'; // Asegúrate de que la ruta es correcta

const Navbar = () => {
  return (
    <nav className="navbar">
      <div className="navbar-logo">
        <a href="/">
          <img src={logo} alt="Logo de RCK" />
        </a>
      </div>
      <ul className="navbar-links">
        <li><a href="#home">Home</a></li>
        <li><a href="#competition">Competición</a></li>
        <li><a href="#news">Noticias</a></li>
        <li><a href="#meetUs">Conócenos</a></li>
        <li><a href="#getinTouch">Contacta con nosotros</a></li>
      </ul>
    </nav>
  );
};

export default Navbar;
