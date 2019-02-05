#!/bin/bash

for fichier in $1/*
do
    if [ "${fichier##*.}" = "class" ] || [ "${fichier##*.}" = "java" ]
  	then
  	    file=${fichier##*/}
  	    package=$1/${file%%.*}
  	    ext=${file##*.}
  	    if [[ -d "$package" ]]
 	    then
			if [[ "$ext" = "class" ]]
			then
	   			package=$package/out
	    		file=${file#*.}
	    		while [[ ! (`echo $file | tr -d -c "\." | wc -c` = "1") ]]
	    		do
	      			package=$package/${file%%.*}
	      			file=${file#*.}
	      			if [[ ! ( -d "$package" ) ]]
	      			then 
						mkdir $package 
	      			fi
	    		done
	    		mv $fichier $package
			else
	    		package=$package/src
	    		file=${file#*.}
	    		while [[ ! (`echo $file | tr -d -c "\." | wc -c` = "1") ]]
	    		do
	      			package=$package/${file%%.*}
	      			file=${file#*.}
	      			if [[ ! ( -d "$package" ) ]]
	      			then 
						mkdir $package
	      			fi
	    		done
	    		mv $fichier $package
			fi
    	else
        	mkdir $package
			mkdir $package/src
			mkdir $package/out
			if [[ "$ext" = "class" ]]
			then
	    		package=$package/out
	    		file=${file#*.}
	    		while [[ ! (`echo $file | tr -d -c "\." | wc -c` = "1") ]]
	    		do
	      			package=$package/${file%%.*}
	      			file=${file#*.}
	      			mkdir $package
	    		done
	    		mv $fichier $package
        	else 
	    		package=$package/src
	    		file=${file#*.}
	    		while [[ ! (`echo $file | tr -d -c "\." | wc -c` = "1") ]]
	    		do
	      			package=$package/${file%%.*}
	      			file=${file#*.}
	      			mkdir $package
	    		done
	    		mv $fichier $package
			fi
    	fi
    fi
    if [[ ! ( -d "$1/resource" ) ]]
    then
		mkdir $1/resource
		mkdir $1/resource/pdf
		mkdir $1/resource/data
		mkdir $1/resource/others
		mkdir $1/resource/bash
    	elif [ "${fichier#*.}" = "pdf" ] || [ "${fichier##*.}" = "pdf" ]
    	then
       		mv "$fichier" $1/resource/pdf
    	elif [ "${fichier%%_*}" = "${fichier%%/*}/DATA" ] || [ "${fichier#*.}" = "jgp" ] || [ "${fichier##*.}" = "jgp" ] || [ "${fichier#*.}" = "png" ] || [ "${fichier##*.}" = "png" ] || [ "${fichier#*.}" = "gif" ] || [ "${fichier##*.}" = "gif" ]
    	then
       		mv "$fichier" $1/resource/data
    	elif [ "${fichier#*.}" = "zip" ] || [ "${fichier##*.}" = "zip" ]
    	then
        	mv "$fichier" $1/resource/others
    	else
		if [ -f "$fichier" ]
		then
	    	if !( [ "${fichier##*.}" = "java" ] || [ "${fichier##*.}" = "class" ])
	    	then 
				mv "$fichier" $1/resource/others
	    	fi
		fi
    fi
done
if [[ -f $1/resource/bash/README ]]
then
	rm -f $1/resource/bash/README
fi 
touch $1/resource/bash README
echo "https://github.com/Mxtthieu/-file-sorting" >> $1/resource/bash/README
if [[ -f tri.sh ]]
then
	cp tri.sh $1/resource/bash
fi
