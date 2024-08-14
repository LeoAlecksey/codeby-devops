FROM debian:11
LABEL developed_by='@LeoAlecksey'
RUN mkdir /opt/www
RUN apt update
WORKDIR /opt/www
COPY ./nginx.sh .
RUN chmod 777 ./nginx.sh
RUN ./nginx.sh
COPY ./index.html .
COPY ./alex.conf .
RUN mv /opt/www/alex.conf /etc/nginx/sites-available/alex.conf
RUN ln -s /etc/nginx/sites-available/alex.conf /etc/nginx/sites-enabled/
EXPOSE 80
ENTRYPOINT ["nginx", "-g", "daemon off;"]