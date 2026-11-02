import { FontAwesomeIcon } from "@fortawesome/react-fontawesome";
import { faDiscord, faXTwitter, faTwitch, faYoutube, faTiktok } from "@fortawesome/free-brands-svg-icons";
import "./GetInTouch.css";

const contactEmail = "spanishrocketassociation@gmail.com";
const tiktokUrl = "https://www.tiktok.com/@RocketAsso";
const discordUrl = "https://discord.com/invite/jK2DfwHDaQ";
const networks = [
  { name: "X", icon: faXTwitter, description: "Noticias y comunicados", href: "https://x.com/Rocketasso_" },
  { name: "Twitch", icon: faTwitch, description: "La RCK en directo", href: "https://www.twitch.tv/rocketasso" },
  { name: "YouTube", icon: faYoutube, description: "Vídeos y retransmisiones", href: "https://www.youtube.com/@RocketAsso" },
  { name: "TikTok", icon: faTiktok, description: "Jugadas y momentos", href: tiktokUrl },
];

const GetInTouch = () => (
  <section className="contact-page" aria-labelledby="contact-title">
    <header className="contact-heading">
      <p className="contact-eyebrow">CONECTA CON LA RCK</p>
      <h1 id="contact-title">Contacto</h1>
      <p>Sigue la competición, impulsa el proyecto o forma parte del equipo.</p>
    </header>
    <section className="contact-networks" aria-labelledby="networks-title">
      <h2 id="networks-title">Encuentra nuestras redes sociales</h2>
      <p>Todo lo que pasa dentro y fuera del campo.</p>
      <div className="contact-network-grid">
        {networks.map(network => {
          const content = <><FontAwesomeIcon icon={network.icon} aria-hidden="true" /><strong>{network.name}</strong><span>{network.description}</span></>;
          return network.href ? (
            <a className="contact-network" href={network.href} target="_blank" rel="noopener noreferrer" key={network.name}>{content}<span className="contact-sr-only"> (se abre en otra pestaña)</span></a>
          ) : <div className="contact-network" key={network.name}>{content}</div>;
        })}
      </div>
    </section>
    <div className="contact-channels">
      <section className="contact-card contact-card-featured" aria-labelledby="partners-title">
        <p className="contact-card-label">CREZCAMOS JUNTOS</p>
        <h2 id="partners-title">Marcas y patrocinadores</h2>
        <p className="contact-description">¿Quieres apoyar la RCK o proponernos una colaboración? Cuéntanos quién eres, qué representa tu marca y qué te gustaría construir con nosotros.</p>
        <div className="contact-buttons">
          {contactEmail && <a className="contact-action" href={`mailto:${contactEmail}?subject=Colaboraci%C3%B3n%20con%20la%20RCK`}>Escribir por correo <span aria-hidden="true">↗</span></a>}
          <a className="contact-action contact-action-secondary" href={discordUrl} target="_blank" rel="noopener noreferrer"><FontAwesomeIcon icon={faDiscord} aria-hidden="true" /> Contactar por Discord<span className="contact-sr-only"> (se abre en otra pestaña)</span></a>
        </div>
        {contactEmail && <p className="contact-email">{contactEmail}</p>}
      </section>
      <section className="contact-card" aria-labelledby="join-title">
        <p className="contact-card-label">CONSTRUYE LA RCK DESDE DENTRO</p>
        <h2 id="join-title">Únete a la organización</h2>
        <p className="contact-description">Si te apasionan Rocket League y los esports, nos gustaría conocerte. Cuéntanos qué te gustaría aportar a la organización de la RCK.</p>
        <p className="contact-join-note">Organización, retransmisiones, diseño, comunicación… Háblanos de tus intereses, tu experiencia y tu disponibilidad.</p>
        <a className="contact-action" href={discordUrl} target="_blank" rel="noopener noreferrer"><FontAwesomeIcon icon={faDiscord} aria-hidden="true" /> Hablar con la organización<span className="contact-sr-only"> (se abre en otra pestaña)</span></a>
      </section>
    </div>
  </section>
);

export default GetInTouch;