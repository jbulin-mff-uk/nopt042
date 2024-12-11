#! /bin/bash
if [ "$*" == "" ];
then
    for i in {1..13}
    do
        jupyter nbconvert --to notebook --inplace --execute tutorial$i/tutorial$i.ipynb
        jupyter nbconvert --to webpdf --allow-chromium-download tutorial$i/tutorial$i.ipynb
        jupyter nbconvert --to slides tutorial$i/tutorial$i.ipynb

    done
else
    for i in $*; do 
        jupyter nbconvert --to notebook --inplace --execute tutorial$i/tutorial$i.ipynb
        jupyter nbconvert --to webpdf --allow-chromium-download tutorial$i/tutorial$i.ipynb
        jupyter nbconvert --to slides tutorial$i/tutorial$i.ipynb
    done

fi
