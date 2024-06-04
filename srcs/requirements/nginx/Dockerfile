FROM debian:oldstable

    # install nginx in our container
    # -y flag to automatically respond yes for apt instalation
    # install tool for TSL management 
RUN apt update && apt upgrade && apt install -y \
    nginx \
    openssl \
    && rm -rf /etc/nginx/sites-enabled && rm -rf /etc/nginx/sites-available
    
    # create a self-signed TLS certificate in standard format x509
    # -node for not encrypted key as typing is not possible during container creation
    # -out -keyout to specify where to save certificate and key for TLS
    # -subj to prefill all the info would be necessary
RUN openssl req -x509 -nodes -newkey rsa:2048 \
    -out /etc/ssl/certs/nginx-certificate.crt \
    -keyout /etc/ssl/private/nginx-key.key \
    -subj "/C=NL/ST=North Holland/L=Amsterdam/O=Codam/CN=cdalla-s"

    # copy the conf file in our folder into the container
COPY conf/nginx.conf /etc/nginx/conf.d/

EXPOSE  433

ENTRYPOINT ["nginx", "-g", "daemon off;"]