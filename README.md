# nopt042-constraint-programming-tutorial

NOPT042 Constraint Programming tutorial: notes and code

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

If you want to execute the notebooks, install jupyter notebook with [picat kernel](https://pypi.org/project/picat-kernel/) (if you want to install them locally, add `--user`):

```bash
pip install jupyter
pip install metakernel
pip install picat-kernel
```

Then run `jupyter notebook`. A picat kernel should be available (New > picat).
