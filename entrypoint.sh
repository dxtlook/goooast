cd /gost
wget -O gost.gz  http://github.com/ginuerzh/gost/releases/download/v${VER}/gost-linux-amd64-${VER}.gz
gzip -b gost.gz 
cd /gost/gost-linux-amd64-${VER}
chmod +x gost
./gost -L=${MODE}://${METHOD}:${PASSWORD}@:${PORT}
