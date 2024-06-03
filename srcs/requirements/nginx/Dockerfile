FROM debian:oldstable

RUN apt update && apt upgrade

# install nginx in our container
# -y flag to automatically respond yes for apt instalation
RUN apt install nginx -y

# install tool for TSL management 
RUN apt install openssl -y



# copy the conf file in our folder into the container
#COPY conf/nginx.conf /etc/nginx/nginx.conf

COPY conf/nginx.conf /etc/nginx/sites-available/nginx.conf

RUN rm -rf /etc/nginx/site-enabled/* &&\
        ln -sf /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/nginx.conf


# create dir to store certificate and key
RUN mkdir -p /etc/nginx/ssl

# create a self-signed TLS certificate in standard format x509
# -node for not encrypted key as typing is not possible during container creation
# -out -keyout to specify where to save certificate and key for TLS
# -subj to prefill all the info would be necessary
RUN openssl req -x509 -nodes \
        -out /etc/nginx/ssl/nginx-certificate.crt \
        -keyout /etc/nginx/ssl/nginx-key.key \
        -subj "/C=NL/ST=North Holland/L=Amsterdam/O=Codam/CN=cdalla-s"

EXPOSE  433

ENTRYPOINT ["nginx", "-g", "daemon off;"]