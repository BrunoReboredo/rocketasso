import "./Home.css";
import videoBg from '../assets/Video_prueba.mp4';

const Home = () => {
  return (
    <div className="hero-section">
      {/* Video de fondo */}
      <video autoPlay loop muted playsInline className="hero-video">
        <source src={videoBg} type="video/mp4" />
        Tu navegador no soporta videos.
      </video>

      {/* Contenido por encima */}
      <div className="hero-content">
        <h1>RCK</h1>
        <p>Muchos sueñan con alcanzar la gloria; pocos están dispuestos a forjarla.</p>
      </div>
    </div>
  );
};

export default Home;
