# Creates a mapgen-worker instance for building maps
FROM folken/xcsoar-base
ENV GITURL=https://github.com/XCSoar/mapgen.git
ENV GITBRANCH=master
ENV MAPWRK_PKGS="python-minimal python-jsonschema p7zip gdal-bin mapserver-bin wget"
ENV APT_OPTS="--no-install-recommends -y"

# install base packages needed for mapgen
RUN apt-get update && apt install $APT_OPTS $MAPWRK_PKGS && apt-get clean 

# use git during install only smaller size
RUN apt-get install $APT_OPTS git && git clone $GITURL -b $GITBRANCH /opt/mapgen/ && apt-get -y purge git && apt-get -y autoremove && apt-get clean

# Volume for data caching
VOLUME /opt/mapgen/data

# Volume for jobs
VOLUME /opt/mapgen/jobs

# worker process
CMD /opt/mapgen/bin/mapgen-worker
