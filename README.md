# ImageStorage

App rails basica para almacenar imagenes y acceder a ellas mediante url.

Guarda las imagenes en cualquier object storage que sea S3 compatible.

Se integra con una CDN para optimizar la carga de las imagenes.

componentes:

- Rails
- PostgreSQL
- ActiveAdmin
- S3 object storage (IDrive E2 en mi caso)
- CDN (Bunny.net CDN o Gcore CDN en mi caso)
