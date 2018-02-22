date
echo "Starting..."

echo "Installing compiler, all necessary development tools and libraries, and ndn-cxx prerequisites"
sudo apt-get install build-essential libsqlite3-dev libcrypto++-dev libboost-all-dev libssl-dev git python-setuptools
sudo apt-get install python-dev python-pygraphviz python-kiwi python-pygoocanvas python-gnome2 python-rsvg ipython

#For the visualizer...
sudo apt install gtk2-engines-pixbuf

echo "Installing ndnSIM"
export ndnsim_root_dir=ndnSIM
mkdir $ndnsim_root_dir
cd $ndnsim_root_dir
unset ndnsim_root_dir

git clone https://github.com/named-data-ndnSIM/ns-3-dev.git ns-3
git clone https://github.com/named-data-ndnSIM/pybindgen.git pybindgen
git clone --recursive https://github.com/named-data-ndnSIM/ndnSIM.git ns-3/src/ndnSIM

cd ns-3
./waf configure --enable-examples
./waf

date
echo "Done..."

#Run the example
#NS_LOG=ndn.Producer:ndn.Consumer ./waf --run=ndn-simple
#NS_LOG=ndn.Producer:ndn.Consumer ./waf --run=ndn-simple --vis
