import "./MeetUs.css";

const MeetUs = () => (
  <section className="meet-us-page" aria-labelledby="meet-us-title">
    <header className="meet-us-heading">
      <p className="meet-us-eyebrow">DETRÁS DE LA RCK</p>
      <h1 id="meet-us-title">Conócenos</h1>
    </header>
    <section className="meet-us-section" aria-labelledby="about-title">
      <h2 id="about-title">¿Quiénes somos?</h2>
      <p>Rocketasso, es una organización a escala nacional con el objetivo de impulsar los Esports a nivel español, en concreto en el videojuego Rocket League. Nuestro cometido principal es crear un circuito de competición sostenible, sano y competitivo.</p>
    </section>
    <section className="meet-us-team" aria-labelledby="team-title">
      <h2 id="team-title">¿Quién trabaja en la RCK?</h2>
      <article className="meet-us-person">
        <div className="meet-us-initials" aria-hidden="true">BR</div>
        <div className="meet-us-person-info">
          <h3>Bruno Reboredo Álvarez</h3>
          <p>brunoo652</p>
        </div>
        <span className="meet-us-role">CEO</span>
      </article>
    </section>
  </section>
);

export default MeetUs;