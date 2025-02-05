import Navbar from '../nav/Navbar'; // Asegúrate de importar correctamente el componente Navbar

const News = () => {
  // Array de noticias como ejemplo
  const newsList = [
    { id: 1, title: "Noticia test Hardcodeada", link: "/noticia-1" },
    // Agrega más noticias si es necesario
  ];

  return (
    <div>
      <Navbar />
      <div className="news-header">
        <h1>Noticias</h1>
        <h2>Toda la actualidad de la RCK</h2>
      </div>
      <div className="news-list">
        {newsList.map((news) => (
          <div className="news-item" key={news.id}>
            <a href={news.link}>
              <div className="news-box">
                <h3>{news.title}</h3>
              </div>
            </a>
          </div>
        ))}
      </div>
    </div>
  );
};

export default News;