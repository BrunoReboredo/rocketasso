import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faDiscord, faXTwitter, faTwitch, faYoutube } from "@fortawesome/free-brands-svg-icons";
import "./GetInTouch.css";

const channels = [
  { name: "Discord", icon: faDiscord, label: "Nuestra comunidad", description: "Entra en el servidor de la RCK para plantear tus dudas y hablar con la organización.", action: "Entrar en Discord", href: "https://discord.com/invite/jK2DfwHDaQ", featured: true },
  { name: "X", icon: faXTwitter, label: "RocketAsso", description: "Encuentra nuestra cuenta oficial y ponte en contacto con nosotros a través de X.", action: "Ir a @Rocketasso_", href: "https://x.com/Rocketasso_", featured: false },
];

const GetInTouch = () => (
  <section className="contact-page" aria-labelledby="contact-title">
    <header className="contact-heading">
      <p className="contact-eyebrow">HABLEMOS DE LA RCK</p>
      <h1 id="contact-title">Contacto</h1>
      <p>Detrás de cada partido hay una comunidad. Estamos al otro lado.</p>
    </header>
    <div className="contact-channels">
      {channels.map(channel => (
        <article className={`contact-card${channel.featured ? " contact-card-featured" : ""}`} key={channel.name}>
          <div className="contact-card-top">
            <FontAwesomeIcon icon={channel.icon} aria-hidden="true" />
            {channel.featured && <span className="contact-badge">Canal principal</span>}
          </div>
          <p className="contact-card-label">{channel.label}</p>
          <h2>{channel.name}</h2>
          <p className="contact-description">{channel.description}</p>
          <a className="contact-action" href={channel.href} target="_blank" rel="noopener noreferrer">
            {channel.action} <span aria-hidden="true">↗</span>
            <span className="contact-sr-only"> (se abre en otra pestaña)</span>
          </a>
        </article>
      ))}
    </div>
    <aside className="contact-help" aria-labelledby="contact-help-title">
      <h2 id="contact-help-title">¿En qué podemos ayudarte?</h2>
      <p>Dudas sobre la competición, consultas de clubes, propuestas de colaboración o sugerencias para mejorar la RCK.</p>
      <p>Cuando nos escribas, cuéntanos el motivo de tu consulta y, si representas a un club, indica su nombre para darnos contexto.</p>
    </aside>
    <section className="contact-follow" aria-labelledby="contact-follow-title">
      <h2 id="contact-follow-title">Sigue la competición</h2>
      <p>Retransmisiones, vídeos y momentos de la RCK.</p>
      <div className="contact-follow-links">
        <a href="https://www.twitch.tv/rocketasso" target="_blank" rel="noopener noreferrer"><FontAwesomeIcon icon={faTwitch} aria-hidden="true" /> Twitch <span className="contact-sr-only"> (se abre en otra pestaña)</span><span aria-hidden="true">↗</span></a>
        <a href="https://www.youtube.com/@RocketAsso" target="_blank" rel="noopener noreferrer"><FontAwesomeIcon icon={faYoutube} aria-hidden="true" /> YouTube <span className="contact-sr-only"> (se abre en otra pestaña)</span><span aria-hidden="true">↗</span></a>
      </div>
    </section>
  </section>
);

export default GetInTouch;