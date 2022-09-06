# NOPT042 Constraint Programming

Notes and code for the tutorial

## Installation

You can install [Picat](http://picat-lang.org/) like this (check if there's a newer version of Picat):

```bash
cd ~
wget http://picat-lang.org/download/picat328_linux64.tar.gz
tar -xf picat328_linux64.tar.gz
```

Then add the executable to `$PATH` (assuming we use bash):

```bash
echo 'export PATH="$HOME/Picat:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Then the command `picat` runs the Picat interpreter.

If you want to execute the notebooks, install [Jupyter Notebook](https://jupyter.org/) with [ipicat extension](https://pypi.org/project/picat-kernel/) (if you want to install them locally, add `--user`):

```bash
pip install jupyter
pip install ipicat
```

Then run `jupyter notebook`. Once the extension is loaded you can use `%%picat` cell magic or execute picat files: `%picat -e hello-world.pi`.
<!--
Sometimes we will also use the [picat kernel](https://pypi.org/project/picat-kernel/) to execute picat code in cells interactively:

```bash
pip install metakernel
pip install picat-kernel
```

Then a picat kernel should be available (New > picat).
-->