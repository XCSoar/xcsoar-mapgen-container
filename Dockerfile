# Creates a mapgen-worker instance for building maps

FROM debian:buster-backports
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt install --no-install-recommends -y python-cherrypy3 python-genshi p7zip gdal-bin mapserver-bin wget git && apt-get clean 

RUN apt install --no-install-recommends -y ca-certificates 

RUN mkdir -p /opt/maps && mkdir -p /opt/mapgen/ && git clone https://github.com/XCSoar/mapgen.git /opt/mapgen/

# Volume for builds
VOLUME ['/opt/maps']

# Volume for data caching
VOLUME ['/opt/mapgen/data']

# Generate maps
CMD cd /opt/maps/ && /opt/mapgen/bin/generate-maps
