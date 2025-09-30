# NOPT042 Constraint Programming

Notes and code for the tutorial on constraint programming using Picat.

### Install Picat

You can install [Picat](http://picat-lang.org/) manually:

```bash
cd ~
mkdir -p .picat
cd .picat
wget http://picat-lang.org/download/picat39_linux64.tar.gz
tar -xzf picat39_linux64.tar.gz
```

Add the executable to `$PATH`:

```bash
echo 'export PATH="$HOME/.picat:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

Test the installation: `picat --version`

### Install Jupyter with Picat Support

Create a conda environment and install Jupyter components:

```bash
conda create -n nopt042 python=3.10
conda activate nopt042
pip install jupyterlab notebook ipicat
```

### Install Extensions

For slideshow presentations:
```bash
pip install RISE
jupyter-nbextension install rise --py --sys-prefix
jupyter-nbextension enable rise --py --sys-prefix
```

For Mermaid diagram support:
```bash
pip install mermaid-magic
```

## Usage

### Starting Jupyter

```bash
# Activate environment (if not already active)
conda activate nopt042

# Start JupyterLab
jupyter lab

# Or start Jupyter Notebook (better for RISE slideshows)
jupyter notebook
```

### Using Picat in Notebooks

**Option 1: Using ipicat extension (Recommended)**

1. **Create a new Python notebook** (select Python kernel)
2. **Load the ipicat extension** in the first cell:
   ```python
   %load_ext ipicat
   ```
3. **Use Picat magic commands** in subsequent cells:
   ```python
   %%picat
   main =>
       println("Hello from Picat!").
   ```
4. **Or execute Picat files**:
   ```python
   %picat hello-world.pi
   ```

**Option 2: Direct Picat execution**

You can also run Picat files directly from the terminal:
```bash
picat your_file.pi
```
