# Creates a mapgen-worker instance for building maps
FROM folken/xcsoar-base

# Deploy Mapgen
RUN apt-get update && apt install $APT_OPTS python-minimal python-cherrypy3 python-genshi git && apt-get clean 
RUN git clone https://github.com/XCSoar/mapgen.git /opt/mapgen/

## Volume for jobs used by mapgen-worker
VOLUME ['/opt/mapgen/jobs']

# Nginx for reverse proxy
RUN apt-get $APT_OPTS install nginx && apt-get clean
COPY files/default /etc/nginx/sites-available/default 
RUN ln -fs /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

EXPOSE 9090

# Supervisord for running all the processes
RUN apt-get $APT_OPTS install supervisor && apt-get clean
RUN mkdir -p /var/log/supervisor
COPY files/supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Launch supervisord on container startup
CMD ["/usr/bin/supervisord"]
