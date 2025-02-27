import "./Home.css";
import videoBg from '../assets/Video_prueba.mp4';

const Home = () => {
  return (
    <div className="hero-section">
      {/* Video de fondo */}
      <video autoPlay loop muted className="hero-video">
        <source src={videoBg} type="video/mp4" />
        Tu navegador no soporta videos.
      </video>

      {/* Contenido por encima */}
      <div className="hero-content">
        <h1>RCK</h1>
        <p>Una breve descripción inspiradora de la RCK.</p>
      </div>
    </div>
  );
};

export default Home;
