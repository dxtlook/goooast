cd /gost
wget -O gost.gz  http://github.com/ginuerzh/gost/releases/download/v${VER}/gost-linux-amd64-${VER}.gz
gzip -d gost.gz
mv gost-linux-amd64-${VER} gost
chmod +x gost
./gost -L=${MODE}://${METHOD}:${PASSWORD}@:${PORT}
