#!/bin/bash
wget -q https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh
bash miniconda.sh -b -p $HOME/.miniconda3
rm miniconda.sh
$HOME/.miniconda3/bin/conda init bash
source $HOME/.miniconda3/etc/profile.d/conda.sh

# Accept terms of service
$HOME/.miniconda3/bin/conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/main
$HOME/.miniconda3/bin/conda tos accept --override-channels --channel https://repo.anaconda.com/pkgs/r

# Create environment
$HOME/.miniconda3/bin/conda create -y -n nopt042 python=3.10 -c conda-forge --override-channels

# Activate environment
source $HOME/.miniconda3/etc/profile.d/conda.sh
conda activate nopt042

# Install packages
conda install -y -c conda-forge --override-channels jupyterlab=4.0.12 notebook=7.0.8 nodejs=18.15.0
pip install mermaid-magic ipicat jupyterlab-rise nbconvert[webpdf]

# Download and install Picat
wget -q http://picat-lang.org/download/picat39_linux64.tar.gz -O picat.tar.gz
mkdir -p $HOME/.picat
tar -xzf picat.tar.gz -C $HOME/.picat --strip-components=1
rm picat.tar.gz

# Set up Picat path in conda environment
mkdir -p $HOME/.miniconda3/envs/nopt042/etc/conda/activate.d
echo 'export PATH="$HOME/.picat:$PATH"' > $HOME/.miniconda3/envs/nopt042/etc/conda/activate.d/picat.sh
