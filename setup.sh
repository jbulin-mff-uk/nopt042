#! /bin/bash
cd ~
wget http://picat-lang.org/download/picat328_linux64.tar.gz
tar -xf picat328_linux64.tar.gz
rm picat328_linux64.tar.gz

echo 'export PATH="$HOME/Picat:$PATH"' >> ~/.bashrc
source ~/.bashrc

pip install --user jupyter ipicat
