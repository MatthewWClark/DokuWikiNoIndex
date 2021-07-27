#!/bin/bash
#finds all start pages and puts them into text file
find (full_path)/dokuwiki -name "start.txt" -exec echo "{}" \;>startPages.txt;
#clears pages array
pagesArray=()

##fills array with each filepath from startpages.txt
mapfile -t pagesArray < startPages.txt;
len=${#pagesArray[@]}

#makes noStart.txt empty
echo ''>noStart.txt

#loops through all of pagesArray and says "if array object does not contain index menu, then echo filepath to noStart.txt
for ((i=0;i<$len; i++));
        do
        if ! grep -q 'indexmenu' "${pagesArray[$i]}"
        then echo ${pagesArray[$i]}>>noStart.txt
        fi

done
