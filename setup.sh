#!/bin/bash
cd ~
wget http://picat-lang.org/download/picat37_linux64.tar.gz
tar -xf picat37_linux64.tar.gz
rm picat37_linux64.tar.gz
mv Picat .picat

echo 'export PATH="$HOME/.picat:$PATH"' >> ~/.bashrc
source ~/.bashrc

conda install -c conda-forge jupyterlab
pip install ipicat RISE jupyterlab_rise
jupyter labextension install jupyterlab-rise jupyterlab-rise-metadata-form
conda update --all
