import { useEffect, useState } from "react";
import Navbar from "../nav/Navbar";
import "./OverallClassification.css";

interface Club {
  id: number;
  clubId: number;
  nombre: string;
  logo: string;
  puntuacion: number;
  partidosGanados: number;
  partidosPerdidos: number;
  diferenciaPartidos: number | null;
}

const OverallClassification = () => {
  const [clubs, setClubs] = useState<Club[]>([]);

  useEffect(() => {
    // Verifica si la URL es la correcta, prueba con esta URL en tu navegador primero
    console.log("Realizando la solicitud a la API...");

    fetch("http://localhost:8080/api/clasificacion/")
      .then((response) => {
        console.log("Respuesta de la API recibida:", response);
        if (!response.ok) {
          // Verifica si la respuesta es exitosa
          throw new Error("Error en la solicitud de la API");
        }
        return response.json();
      })
      .then((data) => {
        console.log("Datos recibidos de la API:", data);
        setClubs(data);
      })
      .catch((error) => {
        console.error("Error cargando la clasificación:", error);
      });
  }, []);
  

  return (
    <div>
      <Navbar />
      <div className="classification-container">
        <h1>Clasificación Histórica</h1>
        <table className="classification-table">
          <thead>
            <tr>
              <th>Posición</th>
              <th>Nombre Club</th>
              <th>Logo</th>
              <th>Puntos</th>
              <th>PG</th>
              <th>PP</th>
              <th>Diferencia</th>
            </tr>
          </thead>
          <tbody>
            {clubs.map((club, index) => (
              <tr key={club.id}>
                <td>{index + 1}</td> {/* Columna de posición */}
                <td>
                  <img src={club.logo} alt={club.nombre} className="club-logo" /> {club.nombre}
                </td>
                <td>{club.puntuacion}</td>
                <td>{club.partidosGanados}</td>
                <td>{club.partidosPerdidos}</td>
                <td>{club.diferenciaPartidos !== null ? club.diferenciaPartidos : "N/A"}</td> {/* Muestra N/A si diferencia es null */}
              </tr>
            ))}
          </tbody>
        </table>
      </div>
    </div>
  );
};

export default OverallClassification;