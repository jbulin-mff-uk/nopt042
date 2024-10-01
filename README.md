# NOPT042 Constraint Programming

Notes and code for the tutorial

## Installation

You can install [Picat](http://picat-lang.org/) like this (check if there's a newer version of Picat):

```bash
cd ~
wget http://picat-lang.org/download/picat37_linux64.tar.gz
tar -xf picat37_linux64.tar.gz
```

Then add the executable to `$PATH` (assuming we use bash):

```bash
echo 'export PATH="$HOME/Picat:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Then the command `picat` runs the Picat interpreter. (For Windows, see [Get Started With Picat](http://picat-lang.org/download/get_started.pdf)).

If you want to execute the notebooks, install [Jupyter Notebook](https://jupyter.org/) with [ipicat extension](https://pypi.org/project/picat-kernel/) (if you want to install them locally, add `--user`):

```bash
pip install jupyter
pip install ipicat
```

Then run `jupyter notebook`. Load the extension: `%load_ext ipicat`. Once the extension is loaded you can use `%%picat` cell magic or execute picat files: `%picat -e hello-world.pi`.

To view the slideshow, install the RISE extension: 
```
pip install RISE
```
