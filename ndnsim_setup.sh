date
echo "Starting..."

echo "Installing compiler, all necessary development tools and libraries, and ndn-cxx prerequisites"
sudo apt-get install build-essential libsqlite3-dev libcrypto++-dev libboost-all-dev libssl-dev git python-setuptools
sudo apt-get install python-dev python-pygraphviz python-kiwi python-pygoocanvas python-gnome2 python-rsvg ipython

#For the visualizer...
sudo apt install gtk2-engines-pixbuf
sudo apt install python-gnome2-desktop-dev

pwd=`pwd`

echo "Installing ndnSIM"
ndnsim_root_dir=$pwd/ndnSIM
mkdir $ndnsim_root_dir && cd $ndnsim_root_dir

git clone -b ndnSIM-v2.5 https://github.com/named-data-ndnSIM/ns-3-dev.git ns-3
git clone -b 0.18.0 https://github.com/named-data-ndnSIM/pybindgen.git pybindgen
git clone -b ndnSIM-2.5 --recursive https://github.com/named-data-ndnSIM/ndnSIM.git ns-3/src/ndnSIM

cd $ndnsim_root_dir/ns-3
./waf configure -d optimized
./waf
sudo ./waf install

if [[ `uname -a | grep Linux` ]]; then
    #When using Linux
    sudo ldconfig;
elif [[ `uname -a | grep FreeBSD` ]]; then
    #When using FreeBSD
    sudo ldconfig -a;
fi

cd $ndnsim_root_dir
git clone --recursive https://github.com/akshayraman/scenario-ntorrent.git
cd $ndnsim_root_dir/scenario-ntorrent
./waf configure
#./waf --run ntorrent-simple --vis

echo "Done..."
date

