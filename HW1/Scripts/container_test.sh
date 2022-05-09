#!/bin/bash

dir=$(pwd)
filename=$dir/container_cpu_results.txt
if [ ! -f $filename ]
then
    touch $filename
    echo "Docker Container CPU Test Results" >> $filename
fi

echo "Configuration: 1 core, 2 threads, 2 GB Mem" >> $filename
echo "===========================================================" >> $filename
echo "CPU Test with 2 Threads" >> $filename
echo "-----------------------" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    sudo docker run --rm --cpuset-cpus="0-1" -m 2G zyclonite/sysbench --test=cpu --threads=2 --cpu-max-prime=10000 --time=15 run | grep "events per second:\|total number of events:" >> $filename
done

echo "CPU Test with 4 Threads" >> $filename
echo "-----------------------" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    sudo docker run --rm --cpuset-cpus="0-1" -m 2G zyclonite/sysbench --test=cpu --threads=4 --cpu-max-prime=10000 --time=15 run | grep "events per second:\|total number of events:" >> $filename
done

echo "CPU Test with 8 Threads" >> $filename
echo "-----------------------" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    sudo docker run --rm --cpuset-cpus="0-1" -m 2G zyclonite/sysbench --test=cpu --threads=8 --cpu-max-prime=10000 --time=15 run | grep "events per second:\|total number of events:" >> $filename
done

echo "Configuration: 2 cores, 4 threads, 4 GB Mem" >> $filename
echo "===========================================================" >> $filename
echo "CPU Test with 2 Threads"
echo "-----------------------" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    sudo docker run --rm --cpuset-cpus="0-3" -m 4G zyclonite/sysbench --test=cpu --threads=2 --cpu-max-prime=10000 --time=15 run | grep "events per second:\|total number of events:" >> $filename
done

echo "CPU Test with 4 Threads" >> $filename
echo "-----------------------" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    sudo docker run --rm --cpuset-cpus="0-3" -m 4G zyclonite/sysbench --test=cpu --threads=4 --cpu-max-prime=10000 --time=15 run | grep "events per second:\|total number of events:" >> $filename
done

echo "CPU Test with 8 Threads" >> $filename
echo "-----------------------" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    sudo docker run --rm --cpuset-cpus="0-3" -m 4G zyclonite/sysbench --test=cpu --threads=8 --cpu-max-prime=10000 --time=15 run | grep "events per second:\|total number of events:" >> $filename
done

echo "Configuration: 4 cores, 8 threads, 8 GB Mem" >> $filename
echo "===========================================================" >> $filename
echo "CPU Test with 2 Threads" >> $filename
echo "-----------------------" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    sudo docker run --rm --cpuset-cpus="0-7" -m 8G zyclonite/sysbench --test=cpu --threads=2 --cpu-max-prime=10000 --time=15 run | grep "events per second:\|total number of events:" >> $filename
done

echo "CPU Test with 4 Threads" >> $filename
echo "-----------------------" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    sudo docker run --rm --cpuset-cpus="0-7" -m 8G zyclonite/sysbench --test=cpu --threads=4 --cpu-max-prime=10000 --time=15 run | grep "events per second:\|total number of events:" >> $filename
done

echo "CPU Test with 8 Threads" >> $filename
echo "-----------------------" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    sudo docker run --rm --cpuset-cpus="0-7" -m 8G zyclonite/sysbench --test=cpu --threads=8 --cpu-max-prime=10000 --time=15 run | grep "events per second:\|total number of events:" >> $filename
done
