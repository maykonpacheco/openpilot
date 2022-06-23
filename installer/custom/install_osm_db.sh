export OSM_DIR=/data/osm
export DB_DIR=${OSM_DIR}/db
# export GOOGLEDRIVE_FILEID=1YZP94KPpHB_Ck1aTxs0p8HXK1D1ClxAv
export GZ_MAP_FILE_NAME=sao_paulo.tar.gz
export GZ_MAP_FILE=${OSM_DIR}/${GZ_MAP_FILE_NAME}

# Remove legacy compressed map file if existing
rm -rf $GZ_MAP_FILE

# WD
cd $OSM_DIR

# Download map file
# wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=${GOOGLEDRIVE_FILEID}' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=${GOOGLEDRIVE_FILEID}" -O ${GZ_MAP_FILE_NAME} && rm -rf /tmp/cookies.txt
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1YZP94KPpHB_Ck1aTxs0p8HXK1D1ClxAv' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1YZP94KPpHB_Ck1aTxs0p8HXK1D1ClxAv" -O sao_paulo.tar.gz && rm -rf /tmp/cookies.txt

if [[ "$?" != 0 ]]; then
  echo "Error downloading map file"
else
  echo "Successfuly downloaded map file"
  # Remove current db dir if exisiting
  rm -rf $DB_DIR
  # Decompressing
  tar -xzvf ${GZ_MAP_FILE_NAME}
  # Renaming in (my case)
  mv db_sp db

  # Populate data-base (U can do this outside and after sftp/scp/rsync put in DB_DIR) read first https://overpass-api.de/no_frills.html
  # wget https://download.openstreetmap.fr/extracts/south-america/brazil/southeast/your-region_latest.osm.pbf
  # sudo apt -y install osmctools
  # osmconvert --out-osm your-region_latest.osm.pbf | ~/osm/osm-3s_v0.7.56/bin/update_database --meta --db-dir="/home/sato/osm/db/"

  # Remove compressed map files after expanding
  # rm -rf $GZ_MAP_FILE_NAME
fi
