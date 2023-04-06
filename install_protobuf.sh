mkdir build
cd build
PB_REL="https://github.com/protocolbuffers/protobuf/releases"
curl -LO $PB_REL/download/v21.12/protobuf-all-21.12.zip
unzip protobuf-all-21.12.zip

sudo apt-get install autoconf automake libtool curl make g++ unzip -y

cd protobuf-21.12
./autogen.sh
./configure
make -j$(nproc)
sudo make install
sudo ldconfig