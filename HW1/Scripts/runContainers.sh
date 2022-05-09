#!/bin/bash

#Config variable
config=$0

if [ $config -eq 0 ];
then
	sudo docker run --rm -it --cpuset-cpus"0-1" -m 2G --entrypoint /bin/sh zyclonite/sysbench

elif [ $config -eq 1 ];
then
	sudo docker run --rm -it --cpuset-cpus"0-2" -m 3G --entrypoint /bin/sh zyclonite/sysbench

elif [ $config -eq 2 ];
then
	sudo docker run --rm -it --cpuset-cpus"0-3" -m 4G --entrypoint /bin/sh zyclonite/sysbench

else
	echo "Bad config"
	exit 1
fi
