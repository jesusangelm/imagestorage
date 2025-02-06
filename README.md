# ImageStorage

App rails basica para almacenar imagenes y acceder a ellas mediante url.

Guarda las imagenes en cualquier object storage que sea S3 compatible.

Se integra con una CDN para optimizar la carga de las imagenes.

componentes:

- Rails
- SQLite3
- S3 object storage (IDrive E2, BackBlaze, etc)
- CDN (Bunny CDN, Gcore CDN, etc)

Usado para [JesusMarin.Dev](https://jesusmarin.dev)
