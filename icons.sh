#!/bin/sh
docker compose down
sed -i 's/read_only: true/read_only: false/g' docker-compose.yml
docker compose up -d --force-recreate
docker exec --workdir /var/www/img bin wget -O favicon-16x16.png https://www.score-utica.nl/hubfs/favicons.png
docker exec --workdir /var/www/img bin wget -O favicon-32x32.png https://www.score-utica.nl/hubfs/favicons.png
docker exec --workdir /var/www/img bin wget -O favicon.ico https://www.score-utica.nl/hubfs/favicons.png
docker exec --workdir /var/www/img bin wget -O icon.svg https://www.score-utica.nl/hubfs/raw_assets/public/score-utica-hubspot-theme/images/scoreuticacloud.svg
docker stop bin
sed -i 's/read_only: false/read_only: true/g' docker-compose.yml
docker start bin