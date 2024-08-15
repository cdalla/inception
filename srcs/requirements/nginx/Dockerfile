FROM debian:oldstable

    # install nginx in our container
    # -y flag to automatically respond yes for apt instalation
    # install tool for TSL management 
RUN apt update && apt upgrade && apt install -y \
    nginx \
    openssl
    #&& rm -rf /etc/nginx/sites-enabled && rm -rf /etc/nginx/sites-available

    # copy the conf file in our folder into the container
#COPY conf/nginx.conf /etc/nginx/conf.d/
    
COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN rm -rf /etc/nginx/sites-enabled/* && ln -sf /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/
    
    # create a self-signed TLS certificate in standard format x509
    # -node for not encrypted key as typing is not possible during container creation
    # -out -keyout to specify where to save certificate and key for TLS
    # -subj to prefill all the info would be necessary
RUN openssl req -x509 -nodes -newkey rsa:2048 \
    -out /etc/ssl/certs/nginx-certificate.crt \
    -keyout /etc/ssl/private/nginx-key.key \
    -subj "/C=NL/ST=North Holland/L=Amsterdam/O=Codam/CN=cdalla-s"

EXPOSE  443

CMD ["nginx", "-g", "daemon off;"]