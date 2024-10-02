#!/bin/bash
cd ~
wget http://picat-lang.org/download/picat37_linux64.tar.gz
tar -xf picat37_linux64.tar.gz
rm picat37_linux64.tar.gz

echo 'export PATH="$HOME/Picat:$PATH"' >> ~/.bashrc
source ~/.bashrc

pip install --user jupyter ipicat RISE

# conda install -c conda-forge jupyterlab
