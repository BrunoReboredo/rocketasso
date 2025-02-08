import Navbar from '../nav/Navbar';
import "./News.css";

const News = () => {
  // Array de noticias de prueba con imágenes
  const newsList = [
    { id: 1, title: "Campeón de la RCK Season 1", image: "/images/news1.jpg", link: "/noticia-1" },
    { id: 2, title: "Calendario de la nueva temporada", image: "/images/news2.jpg", link: "/noticia-2" },
    { id: 3, title: "Grandes jugadas de la semana", image: "/images/news3.jpg", link: "/noticia-3" },
    { id: 4, title: "Entrevista con el MVP", image: "/images/news4.jpg", link: "/noticia-4" },
    { id: 5, title: "Arsene si lees esto me debes 20 euros", image: "/images/news5.jpg", link: "/noticia-5" },
    { id: 6, title: "JAJAJAJAJAJAJAJJA", image: "/images/news6.jpg", link: "/noticia-6" },
    { id: 7, title: "Testing", image: "/assets/RCK_Logo_Cua_RenderNeg.jpg", link: "/noticia-7" },
  ];

  return (
    <div>
      <Navbar />
      <div className="news-header">
        <h1>Noticias</h1>
        <h2>Sigue todas las novedades de la RCK</h2>
      </div>
      <hr className="news-divider" />
      <div className="news-list">
        {newsList.map((news) => (
          <a href={news.link} key={news.id} className="news-item">
            <div className="news-box">
              <img src={news.image} alt={news.title} className="news-image" />
              <h3 className="news-title">{news.title}</h3>
            </div>
          </a>
        ))}
      </div>
    </div>
  );
};

export default News;


