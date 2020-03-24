# Creates a mapgen-worker instance for building maps

FROM folken/xcsoar-base

RUN apt-get update && apt install --no-install-recommends -y python-minimal python-jsonschema p7zip gdal-bin mapserver-bin wget git && apt-get clean 

RUN git clone https://github.com/XCSoar/mapgen.git -b mapgen-2020 /opt/mapgen/

# Volume for data caching
VOLUME /opt/mapgen/data

# Volume for jobs
VOLUME /opt/mapgen/jobs

# worker process
CMD /opt/mapgen/bin/mapgen-worker
