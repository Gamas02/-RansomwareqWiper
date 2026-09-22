# Imagem Apache HTTP Server com o conteúdo do Atlas já embutido.
# Uso alternativo ao docker-compose.yml (que usa volume) — útil se o
# professor pedir uma imagem "pronta", sem depender da pasta local.
#
# Build:  docker build -t atlas-ameacas .
# Run:    docker run -d --name atlas-ameacas -p 8080:80 atlas-ameacas

FROM httpd:2.4

COPY ./atlas-ameacas/ /usr/local/apache2/htdocs/

EXPOSE 80
