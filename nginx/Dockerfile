FROM nginx

RUN apt-get update && apt-get install -y openssl

RUN rm /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/conf.d

ENV TZ=Europe/Madrid
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

COPY ./snippets /etc/nginx/snippets
COPY ./entrypoint.sh /
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]


#https letsencrypt
#RUN mkdir /letsencrypt
#RUN mkdir /etc/letsencrypt
#RUN apt-get update && apt-get install -y certbot
#RUN certbot certonly --webroot --non-interactive --agree-tos --email jaume.perez.medina@estudiantat.upc.edu --domain transmed.duckdns.org --webroot-path /letsencrypt


# FROM nginx

# RUN apt-get update && apt-get install -y openssl certbot python3-certbot-nginx

# RUN rm /etc/nginx/conf.d/default.conf
# COPY nginx.conf /etc/nginx/conf.d/default.conf
# ENV TZ=Europe/Madrid
# RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && dpkg-reconfigure -f noninteractive tzdata
# COPY snippets /etc/nginx/snippets
# COPY entrypoint.sh /

# # Set executable permission on entrypoint.sh
# RUN chmod +x /entrypoint.sh

# # Install Certbot and any other dependencies
# RUN apt-get update && apt-get install -y certbot python3-certbot-nginx

# RUN mkdir -p /etc/letsencrypt/live/transmed.duckdns.org

# ENTRYPOINT ["/entrypoint.sh"]


# # # Install Certbot and any other dependencies


# RUN apt-get update -y && apt-get install certbot -y
# RUN certbot certonly --cert-path /etc/ssl/certs/
