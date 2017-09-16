FROM nginx:1.13

LABEL author="Emmanuel Akinpelu hemor2709@gmail.com"
LABEL description="nginx image that auto reloads when a new configuration is added to the /etc/nginx/sites-enabled folder."

RUN apt-get update && apt-get -y install incron nano vim supervisor

RUN mkdir /etc/nginx/sites-enabled

COPY ./nginx/default.conf /etc/nginx/conf.d/

COPY ./nginx/nginx.conf /etc/nginx/

COPY ./incron.d/nginx.tab /etc/incron.d/

COPY ./supervisor/*.conf /etc/supervisor/conf.d/

CMD ["supervisord", "-n", "-c", "/etc/supervisor/supervisord.conf"]
