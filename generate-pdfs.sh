#! /bin/bash
for i in {1..12}
do
    jupyter nbconvert --to notebook --inplace --execute tutorial$i/tutorial$i.ipynb
    jupyter nbconvert --to webpdf tutorial$i/tutorial$i.ipynb
done