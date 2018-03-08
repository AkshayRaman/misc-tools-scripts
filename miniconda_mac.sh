curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
sh Miniconda3-latest-MacOSX-x86_64.sh

. ~/.bash_profile

conda create -n env python=3.6

source activate env

conda install tensorflow
pip install keras
pip install h5py
pip install sklearn
conda install matplotlib


