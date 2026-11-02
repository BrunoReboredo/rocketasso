import "./SeasonNotice.css";

const SeasonNotice = ({ title }: { title: string }) => (
  <section className="season-notice">
    <p className="season-notice-label">RCK · TEMPORADA 3</p>
    <h1>{title}</h1>
    <div className="season-notice-card">
      <h2>Estamos trabajando en ello</h2>
      <p>Actualizaremos la web en cuanto haya noticias sobre la Temporada 3.</p>
      <p>¡Mantente atento a las novedades!</p>
    </div>
  </section>
);

export default SeasonNotice;