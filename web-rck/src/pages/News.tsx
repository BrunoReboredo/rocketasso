import { useEffect, useState } from "react";
import logo from "../assets/RCK_Logo_Cua_RenderMor.png";
import "./News.css";

interface NewsItem {
  id: number;
  titulo: string;
  contenido: string;
  foto: string | null;
  enlace: string | null;
  fechaPublicacion: string;
}
const apiOrigin = import.meta.env.VITE_API_URL || "http://localhost:8080";

const News = () => {
  const [news, setNews] = useState<NewsItem[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);
  const [attempt, setAttempt] = useState(0);
  useEffect(() => {
    const controller = new AbortController();
    // Retira la caché antigua de noticias ficticias.
    try { localStorage.removeItem("newsList"); } catch { /* El almacenamiento puede estar deshabilitado. */ }
    setLoading(true);
    setError(false);
    const load = async () => {
      try {
        const response = await fetch(new URL("/api/noticias", apiOrigin), { signal: controller.signal });
        if (!response.ok) throw new Error("No se pudieron cargar las noticias");
        const data: NewsItem[] = await response.json();
        setNews(data.sort((a, b) => Date.parse(b.fechaPublicacion) - Date.parse(a.fechaPublicacion) || b.id - a.id));
      } catch {
        if (!controller.signal.aborted) setError(true);
      } finally {
        if (!controller.signal.aborted) setLoading(false);
      }
    };
    void load();
    return () => controller.abort();
  }, [attempt]);

  return (
    <section className="news-page" aria-labelledby="news-title">
      <header className="news-header">
        <h1 id="news-title">Noticias</h1>
        <p>Sigue todas las novedades de la RCK</p>
      </header>
      <hr className="news-divider" />
      {loading ? <p role="status">Cargando noticias…</p> : error ? (
        <div role="alert"><p>No se han podido cargar las noticias.</p><button onClick={() => setAttempt(attempt + 1)}>Volver a intentar</button></div>
      ) : news.length === 0 ? <p role="status">Todavía no hay noticias publicadas.</p> : (
        <div className="news-list">
          {news.map(item => (
            <article key={item.id} className="news-box">
              <div className={`news-image-wrap${item.foto ? "" : " news-image-brand"}`}>
                <img src={item.foto ? new URL(item.foto, apiOrigin).href : logo} alt="" className="news-image" />
              </div>
              <div className="news-body">
                <span className="news-tag">Comunicado RCK</span>
                <h2 className="news-title">{item.titulo}</h2>
                <p className="news-summary">{item.contenido}</p>
                {item.enlace && <a className="news-link" href={item.enlace} target="_blank" rel="noopener noreferrer">Leer comunicado en X <span aria-hidden="true">↗</span><span className="news-sr-only"> (se abre en otra pestaña)</span></a>}
              </div>
            </article>
          ))}
        </div>
      )}
    </section>
  );
};
export default News;