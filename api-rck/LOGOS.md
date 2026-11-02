# Logos de la clasificación histórica

Los 23 originales están en `src/main/resources/static/logos/clubs` y Spring los sirve en `/logos/clubs/`.
Las rutas se guardan en la columna `Logo` de `tclubshistoricos`.

Al arrancar Spring, `HistoricalClubsInitializer` incorpora los clubes que falten y asigna los logos a los 32 clubes. No modifica los puntos ni los partidos de los clubes existentes. Los clubes nuevos parten de cero. Las variantes de Moonlab, Ventucorp, Karasu, Orion y Last Five comparten logo por indicación del organizador.

1. Arrancar MariaDB con la base `bbdd-rck` y las credenciales configuradas en `src/main/resources/application.yml`.
2. Desde `api-rck`, ejecutar `mvnw.cmd spring-boot:run`. Con Java 23, usar `mvnw.cmd "-Dmaven.compiler.proc=full" spring-boot:run` para habilitar Lombok.
3. Desde `web-rck`, ejecutar `npm run dev`.

React consulta por defecto `http://localhost:8080`. Se puede cambiar con `VITE_API_URL`.
Para comprobar un logo: `http://localhost:8080/logos/clubs/Atom%20Unity.png`.

Los archivos de `sql/` permiten realizar la importación manual si fuera necesario. Los scripts incluidos en `src/main/resources/db/` son los utilizados por Spring al arrancar.
Se conserva además Winx, presente en la base de datos anterior, con su logo recuperado del repositorio. La migración normaliza los alias antiguos y solo elimina sus duplicados vacíos; conserva las filas con estadísticas.
