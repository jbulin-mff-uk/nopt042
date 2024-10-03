#!/bin/bash
cd ~
wget http://picat-lang.org/download/picat37_linux64.tar.gz
tar -xf picat37_linux64.tar.gz
rm picat37_linux64.tar.gz
mv Picat .picat

echo 'export PATH="$HOME/.picat:$PATH"' >> ~/.bashrc
source ~/.bashrc

pip install --user jupyterlab ipicat rise
conda install nodejs
jupyter labextension install jupyterlab-rise jupyterlab-rise-metadata-form
