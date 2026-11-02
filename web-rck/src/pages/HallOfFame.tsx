import { useEffect, useState } from "react";
import "./HallOfFame.css";

interface Champion {
  temporada: number;
  nombre: string;
  logo: string;
  jugadores: string[];
}
const apiOrigin = import.meta.env.VITE_API_URL || "http://localhost:8080";

const HallOfFame = () => {
  const [champions, setChampions] = useState<Champion[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);
  const [attempt, setAttempt] = useState(0);

  useEffect(() => {
    const controller = new AbortController();
    setLoading(true);
    setError(false);
    const load = async () => {
      try {
        const response = await fetch(new URL("/api/hall-of-fame", apiOrigin), { signal: controller.signal });
        if (!response.ok) throw new Error("No se pudo cargar el palmarés");
        setChampions(await response.json());
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
    <section className="hall-of-fame" aria-labelledby="hall-title">
      <header className="hall-heading">
        <p className="hall-eyebrow">EL LEGADO DE LA RCK</p>
        <h1 id="hall-title">Hall of Fame</h1>
        <p>La gloria tiene nombres propios.</p>
      </header>
      {loading ? <p role="status">Cargando campeones…</p> : error ? (
        <div role="alert" className="hall-status">
          <p>No se ha podido cargar el palmarés.</p>
          <button onClick={() => setAttempt(attempt + 1)}>Volver a intentar</button>
        </div>
      ) : champions.length === 0 ? <p role="status">Próximamente, los campeones de la RCK.</p> : (
        <div className="hall-champions">
          {champions.map(champion => (
            <article className="hall-champion" key={champion.temporada} aria-labelledby={`champion-${champion.temporada}`}>
              <div className="hall-season"><span>RCK</span><strong>0{champion.temporada}</strong><span>TEMPORADA</span></div>
              <div className="hall-champion-body">
                <p className="hall-crown"><span aria-hidden="true">♛</span> CAMPEÓN</p>
                <img className="hall-logo" src={new URL(champion.logo, apiOrigin).href} alt={`Escudo de ${champion.nombre}`} />
                <h2 id={`champion-${champion.temporada}`}>{champion.nombre}</h2>
                <p className="hall-event">Campeón de la fase final · Temporada {champion.temporada}</p>
                <div className="hall-roster">
                  <h3>Plantilla campeona</h3>
                  <ul>{champion.jugadores.map(player => <li key={player}>{player}</li>)}</ul>
                </div>
              </div>
            </article>
          ))}
        </div>
      )}
    </section>
  );
};
export default HallOfFame;