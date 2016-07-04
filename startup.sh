#
# Starts Nanocube server and its web viewer
#
export NANOCUBE_HOST=`tail -1 /etc/hosts | cut -f 1`

# Starts the server in background
cat ${NANOCUBE_SRC}/data/crime50k.dmp | nanocube-leaf -q ${NANOCUBE_PORT} -f 10000 &

# Configures and starts the viewer 
ncwebviewer-config -s http://${NANOCUBE_HOST}:${NANOCUBE_PORT} \
  -o ${NANOCUBE_SRC}/extra/nc_web_viewer/config_crime.json
cd ${NANOCUBE_SRC}/extra/nc_web_viewer
python -m SimpleHTTPServer ${VIEWER_PORT}