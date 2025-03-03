import { useEffect, useState } from "react";
import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faTwitch, faYoutube, faTwitter, faTiktok } from "@fortawesome/free-brands-svg-icons";
import Navbar from "../nav/Navbar";
import "./News.css";

const TWITCH_CLIENT_ID = "TU_CLIENT_ID";
const TWITCH_ACCESS_TOKEN = "TU_ACCESS_TOKEN";
const TWITCH_USERNAME = "rocketasso"; // Canal de Twitch a trackear

interface NewsItem {
  id: number;
  title: string;
  image: string;
  link: string;
  type: "notificacion" | "noticia"; // Tipo de noticia
  source?: "twitch" | "youtube" | "twitter" | "tiktok"; // Origen de la notificacion
}

// Noticias hardcodeadas (simulando las de la BBDD)
const hardcodedNews: NewsItem[] = [
  { id: 1, title: "Campeón de la RCK Season 1", image: "/images/news1.jpg", link: "/noticia-1", type: "noticia" },
  { id: 2, title: "Calendario de la nueva temporada", image: "/images/news2.jpg", link: "/noticia-2", type: "noticia" },
  { id: 3, title: "Grandes jugadas de la semana", image: "/assets/RCK_Logo_Cua_RenderMor.png", link: "/noticia-3", type: "noticia" },
  { id: 4, title: "Entrevista con el MVP", image: "/images/news4.jpg", link: "/noticia-4", type: "noticia" },
];

const News = () => {
  const [newsList, setNewsList] = useState<NewsItem[]>(() => {
    const storedNews = localStorage.getItem("newsList");
    return storedNews ? JSON.parse(storedNews) : hardcodedNews;
  });

  const [filter, setFilter] = useState<"all" | "notificacion" | "noticia">("all");

  useEffect(() => {
    const checkTwitchLive = async () => {
      try {
        const response = await fetch(
          `https://api.twitch.tv/helix/streams?user_login=${TWITCH_USERNAME}`,
          {
            method: "GET",
            headers: {
              "Client-ID": TWITCH_CLIENT_ID,
              Authorization: `Bearer ${TWITCH_ACCESS_TOKEN}`,
            },
          }
        );

        const data = await response.json();
        if (data.data.length > 0) {
          const liveNews: NewsItem = {
            id: Date.now(), // ID unico basado en timestamp
            title: "Estamos en directo",
            image: "https://upload.wikimedia.org/wikipedia/commons/6/60/Twitch_logo.png",
            link: `https://www.twitch.tv/${TWITCH_USERNAME}`,
            type: "notificacion",
            source: "twitch",
          };

          setNewsList((prev) => {
            const updatedList = [liveNews, ...prev];
            localStorage.setItem("newsList", JSON.stringify(updatedList));
            return updatedList;
          });
        }
      } catch (error) {
        console.error("Error obteniendo datos de Twitch:", error);
      }
    };

    checkTwitchLive();
  }, []);

  // Filtrar noticias segun la seleccion del usuario
  const filteredNews = newsList.filter(
    (news) => filter === "all" || news.type === filter
  );

  return (
    <div>
      <Navbar />
      <div className="news-header">
        <h1>Noticias</h1>
        <h2>Sigue todas las novedades de la RCK</h2>
      </div>
      <hr className="news-divider" />

      {/* Selector de filtro con desplegable */}
      <div className="news-filter">
        
        <select id="newsFilter" value={filter} onChange={(e) => setFilter(e.target.value as any)}>
          <option value="all">Todas</option>
          <option value="notificacion">Notificaciones</option>
          <option value="noticia">Noticias</option>
        </select>
      </div>

      <div className="news-list">
        {filteredNews.map((news) => (
          <a href={news.link} key={news.id} className="news-item" target="_blank" rel="noopener noreferrer">
            <div className="news-box">
              {news.source === "twitch" ? (
                <FontAwesomeIcon icon={faTwitch} size="4x" color="#9146FF" />
              ) : news.source === "youtube" ? (
                <FontAwesomeIcon icon={faYoutube} size="4x" color="red" />
              ) : news.source === "twitter" ? (
                <FontAwesomeIcon icon={faTwitter} size="4x" color="#1DA1F2" />
              ) : news.source === "tiktok" ? (
                <FontAwesomeIcon icon={faTiktok} size="4x" color="black" />
              ) : (
                <img src={news.image} alt={news.title} className="news-image" />
              )}
              <h3 className="news-title">{news.title}</h3>
              {news.type === "notificacion" && <span className="news-tag">馃敂 Notificaci贸n</span>}
            </div>
          </a>
        ))}
      </div>
    </div>
  );
};

export default News;

