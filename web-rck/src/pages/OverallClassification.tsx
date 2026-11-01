import { useEffect, useState } from "react";
import "./OverallClassification.css";
import clubNames from "../data/historicalClubs.json";

interface Club {
  id: number;
  nombre: string;
  logo: string | null;
  puntuacion: number | null;
  partidosGanados: number | null;
  partidosPerdidos: number | null;
}

const apiOrigin = import.meta.env.VITE_API_URL || "http://localhost:8080";

const pendingClubs: Club[] = clubNames.map((nombre, index) => ({
  id: -(index + 1), nombre, logo: null,
  puntuacion: null, partidosGanados: null, partidosPerdidos: null,
}));

const OverallClassification = () => {
  const [clubs, setClubs] = useState<Club[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState(false);

  useEffect(() => {
    const controller = new AbortController();
    const load = async () => {
      try {
        const response = await fetch(new URL("/api/historicalclassification/", apiOrigin), {
          signal: controller.signal,
        });
        if (!response.ok) throw new Error("Error cargando la clasificación");
        const data: Club[] = response.status === 204 ? [] : await response.json();
        setClubs(data.length === 0 ? pendingClubs : [...data].sort((a, b) =>
          (b.puntuacion ?? 0) - (a.puntuacion ?? 0) ||
          ((b.partidosGanados ?? 0) - (b.partidosPerdidos ?? 0)) - ((a.partidosGanados ?? 0) - (a.partidosPerdidos ?? 0)) ||
          a.nombre.localeCompare(b.nombre, "es") || a.id - b.id
        ));
      } catch {
        if (!controller.signal.aborted) { setError(true); setClubs(pendingClubs); }
      } finally {
        if (!controller.signal.aborted) setLoading(false);
      }
    };
    void load();
    return () => controller.abort();
  }, []);

  return (
    <section className="historical-classification" aria-labelledby="historical-title">
      <h1 id="historical-title">Clasificación histórica</h1>
      <p className="historical-description">El recorrido de los clubes a lo largo de la RCK.</p>
      <div className="historical-table-scroll" role="region" aria-label="Tabla de clasificación histórica" tabIndex={0}>
        <table className="historical-table">
          <caption>{error || clubs.some(club => club.puntuacion === null) ? "Clubes participantes · estadísticas pendientes de incorporar." : "Ordenada por puntos y diferencia de partidos ganados y perdidos."}</caption>
          <thead>
            <tr>
              <th scope="col">Posición</th>
              <th scope="col">Logo</th>
              <th scope="col">Club</th>
              <th scope="col">Puntos</th>
              <th scope="col"><abbr title="Partidos ganados">PG</abbr></th>
              <th scope="col"><abbr title="Partidos perdidos">PP</abbr></th>
              <th scope="col">Diferencia</th>
            </tr>
          </thead>
          <tbody>
            {loading || clubs.length === 0 ? (
              <tr><td colSpan={7} role="status">
                {loading ? "Cargando clasificación…" : error ? "No se ha podido cargar la clasificación. Comprueba que la API esté disponible." : "Todavía no hay clubes en la clasificación histórica."}
              </td></tr>
            ) : clubs.map((club, index) => {
              const difference = club.partidosGanados === null || club.partidosPerdidos === null ? null : club.partidosGanados - club.partidosPerdidos;
              return (
                <tr key={club.id}>
                  <td>{club.puntuacion === null ? "—" : index + 1}</td>
                  <td>{club.logo ? <img src={new URL(club.logo, apiOrigin).href} alt={`Escudo de ${club.nombre}`} className="historical-club-logo" /> : <span aria-label="Sin escudo">—</span>}</td>
                  <th scope="row">{club.nombre}</th>
                  <td className="historical-points">{club.puntuacion ?? "—"}</td>
                  <td>{club.partidosGanados ?? "—"}</td>
                  <td>{club.partidosPerdidos ?? "—"}</td>
                  <td>{difference === null ? "—" : difference > 0 ? `+${difference}` : difference}</td>
                </tr>
              );
            })}
          </tbody>
        </table>
      </div>
      <p className="historical-key">PG: partidos ganados · PP: partidos perdidos · Diferencia: PG − PP</p>
    </section>
  );
};

export default OverallClassification;