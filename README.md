# Rocketasso · RCK

Web de la RCK, el circuito competitivo de Rocket League de Rocketasso. Reúne la clasificación histórica, los campeones, las noticias y los canales oficiales de la organización.

> Muchos sueñan con alcanzar la gloria; pocos están dispuestos a forjarla.

## Tecnologías

- **Web:** React 18, TypeScript, Vite y React Router.
- **API:** Java y Spring Boot 3.4.2, con Spring Data JPA y Spring Security.
- **Base de datos:** SQL sobre MariaDB.

React consulta la API de Spring; Spring accede a MariaDB y sirve los logos de los clubes.

## Estructura

```text
rocketasso/
├── web-rck/                         # Aplicación React
│   └── src/
│       ├── assets/                  # Vídeo, identidad y fondo
│       ├── pages/                   # Páginas y estilos
│       ├── nav/                     # Navegación
│       └── footer/                  # Pie de página
├── api-rck/                         # API de Spring Boot
│   ├── sql/                         # Scripts SQL y documentación de datos
│   └── src/main/
│       ├── java/com/rocketasso/api_rck/
│       │   ├── config/              # Seguridad e inicialización
│       │   ├── controller/          # Rutas de la API
│       │   ├── model/               # Entidades y repositorios
│       │   └── service/             # Servicios
│       └── resources/
│           ├── db/                  # Scripts ejecutados al arrancar
│           ├── static/logos/clubs/  # Logos servidos por Spring
│           └── application.yml      # Configuración de MariaDB
└── README.md
```

## Requisitos

- Node.js y npm.
- JDK 17 como mínimo y `JAVA_HOME` apuntando a la instalación del JDK.
- MariaDB, por ejemplo la incluida en XAMPP.
- Git para clonar el repositorio.

El repositorio incluye Maven Wrapper: no es necesario instalar Maven por separado. La primera ejecución necesita conexión para descargar Maven y las dependencias.

## Arranque local en Windows

**Hay que iniciar los tres servicios: MariaDB, Spring y React. Abrir solo la web no permite cargar los datos.**

### 1. Preparar MariaDB

Inicia **MySQL** desde el panel de XAMPP (la distribución utilizada en este proyecto incluye MariaDB). Crea la base de datos si todavía no existe:

```sql
CREATE DATABASE IF NOT EXISTS `bbdd-rck`
  CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
```

Revisa `api-rck/src/main/resources/application.yml`. La configuración local actual utiliza:

| Parámetro | Valor local |
| --- | --- |
| Servidor | `localhost` |
| Puerto | `3306` |
| Base de datos | `bbdd-rck` |
| Usuario | `root` |
| Contraseña | Vacía |

Si tu instalación utiliza otras credenciales, ajusta la configuración o las variables `SPRING_DATASOURCE_URL`, `SPRING_DATASOURCE_USERNAME` y `SPRING_DATASOURCE_PASSWORD`.

Hibernate está configurado con `ddl-auto: update`. Además, Spring ejecuta los scripts registrados en `HistoricalClubsInitializer` para incorporar los datos históricos y sus correcciones. Los archivos de `sql/` incluyen copias para uso manual; no es necesario ejecutarlas además del inicializador.

### 2. Arrancar la API de Spring

Abre una terminal en `api-rck` y ejecuta:

```cmd
mvnw.cmd org.springframework.boot:spring-boot-maven-plugin:3.4.2:run
```

Desde PowerShell, utiliza ` .\mvnw.cmd` en lugar de `mvnw.cmd`.

Con **Java 23**, habilita el procesamiento de anotaciones de Lombok:

```powershell
.\mvnw.cmd "-Dmaven.compiler.proc=full" org.springframework.boot:spring-boot-maven-plugin:3.4.2:run
```

La API escucha en **http://localhost:8080**. Mantén esta terminal abierta.

### 3. Arrancar la web

Abre otra terminal en `web-rck`:

```cmd
npm ci
npm run dev
```

`npm ci` instala las dependencias; no hace falta repetirlo en cada arranque si no han cambiado. Abre la dirección que muestre Vite, normalmente **http://localhost:5173**. Mantén también esta terminal abierta.

Para cambiar la dirección de la API, crea `web-rck/.env.local`:

```dotenv
VITE_API_URL=http://localhost:8080
```

Reinicia Vite después de cambiar este archivo. Esta dirección debe ser accesible desde el navegador que abre la web.

## Secciones

| Sección | Ruta |
| --- | --- |
| Inicio | `/` |
| Clasificación histórica | `/competition/overall-classification` |
| Hall of Fame | `/competition/hall-of-fame` |
| Calendario de la temporada 3 | `/competition/season3/calendar` |
| Clasificación de la temporada 3 | `/competition/season3/classification` |
| Noticias | `/news` |
| Conócenos | `/meet-us` |
| Contacto | `/contact` |

El inicio utiliza un vídeo de fondo. El resto de páginas comparte un fondo topográfico otoñal fijo. Los apartados de la temporada 3 muestran un aviso mientras se preparan las novedades.

## Datos históricos

- Cada club tiene una única fila para acumular sus resultados entre temporadas.
- Los puntos históricos suman la temporada 1 y el **total azul de la temporada 2**; las otras columnas de esa imagen son el desglose y no se vuelven a sumar.
- Las victorias y derrotas facilitadas por la organización son **totales históricos absolutos**, no incrementos.
- La diferencia se calcula como **partidos ganados − partidos perdidos**.
- Los partidos ganados y perdidos **no incluyen Última Oportunidad ni las RCK Finals**.
- La clasificación se ordena por puntos, diferencia de partidos y nombre del club.

Las correcciones de puntos y partidos utilizan `rck_data_migrations` para evitar aplicarse de nuevo en cada arranque. Al incorporar una corrección, añade un script con una versión nueva y regístralo en el inicializador. Conserva los puntos cuando actualices únicamente partidos.

Los logos se guardan en `api-rck/src/main/resources/static/logos/clubs/`; la base de datos conserva su ruta pública. Ejemplo:

```text
http://localhost:8080/logos/clubs/Atom%20Unity.png
```

La lista de nombres en `web-rck/src/data/historicalClubs.json` es un recurso provisional para mostrar clubes sin estadísticas cuando la API no devuelve datos. Los datos definitivos proceden de SQL a través de Spring.

## API pública de consulta

| Método | Ruta | Contenido |
| --- | --- | --- |
| GET | `/api/historicalclassification/` | Clasificación histórica |
| GET | `/api/historicalclassification/health` | Comprobación básica de la ruta |
| GET | `/api/hall-of-fame` | Campeones y plantillas |
| GET | `/api/noticias` | Noticias |
| GET | `/api/noticias/{id}` | Una noticia |
| GET | `/logos/clubs/{archivo}` | Logo de un club |

## Comprobaciones y compilación

Desde `web-rck`:

```cmd
npm run build
npm run lint
npm run preview
```

`build` genera la web en `web-rck/dist`. `preview` permite revisar esa compilación; la API y MariaDB deben seguir activas para consultar los datos.

Desde `api-rck`, con PowerShell y Java 23:

```powershell
.\mvnw.cmd "-Dmaven.compiler.proc=full" compile
.\mvnw.cmd "-Dmaven.compiler.proc=full" "-DskipTests=false" test
```

El proyecto tiene las pruebas de Maven desactivadas por defecto en `pom.xml`; el segundo comando las habilita. Las pruebas que cargan el contexto de Spring necesitan la base de datos disponible.

## Si la web no carga los datos

1. Comprueba que MariaDB está arrancada en el puerto `3306`.
2. Comprueba que Spring sigue ejecutándose y que no ha mostrado un error al arrancar.
3. Abre **http://localhost:8080/api/historicalclassification/**: debe devolver los clubes en JSON.
4. Revisa las credenciales y el nombre de la base de datos en `application.yml`.
5. Si cambiaste `VITE_API_URL`, reinicia Vite y recarga la página.

Si aparecen errores de métodos `get...` inexistentes con Java 23, utiliza la opción `-Dmaven.compiler.proc=full` indicada arriba. Si un puerto está ocupado, revisa si ya hay una instancia del servicio antes de iniciar otra.

## Canales oficiales

- **Correo:** [spanishrocketassociation@gmail.com](mailto:spanishrocketassociation@gmail.com)
- **Discord:** [Comunidad RCK](https://discord.com/invite/jK2DfwHDaQ)
- **X:** [@Rocketasso_](https://x.com/Rocketasso_)
- **Twitch:** [rocketasso](https://www.twitch.tv/rocketasso)
- **YouTube:** [@RocketAsso](https://www.youtube.com/@RocketAsso)
- **TikTok:** [@RocketAsso](https://www.tiktok.com/@RocketAsso)