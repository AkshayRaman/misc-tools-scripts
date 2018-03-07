curl -O https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
sh Miniconda3-latest-Linux-x86_64.sh

. ~/.bashrc

conda create -n env python=3.6

source activate env

pip install tensorflow
pip install keras

