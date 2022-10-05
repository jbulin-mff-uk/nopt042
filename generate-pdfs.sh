#! /bin/bash
jupyter nbconvert --to notebook --inplace --execute tutorial1/tutorial1.ipynb
jupyter nbconvert --to pdf tutorial1/tutorial1.ipynb