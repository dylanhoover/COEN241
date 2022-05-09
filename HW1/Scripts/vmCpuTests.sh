#!/bin/bash

dir=$(pwd)
filename=$dir/vm_cpu_tests_results(2core).txt
if [ ! -f $filename ]
then
    touch $filename
    echo "QEMU VM CPU Test Results" >> $filename
fi

cpus=2

if [ $cpus -eq 1 ]; #1 core, 2 threads
then
    echo "VM Configuratio: 1 core, 2 threads, 2 GB Mem" >> $filename
    echo "===========================================================" >> $filename

elif [ $cpus -eq 2 ]; #2 cores, 4 threads
then
    echo "VM Configuration: 2 cores, 4 threads, 4 GB Mem" >> $filename
    echo "===========================================================" >> $filename

elif [ $cpus -eq 4 ]; #4 cores, 8 threads
then
    echo "VM Configuration: 4 cores, 8 threads, 8 GB Mem" >> $filename
    echo "===========================================================" >> $filename

else
    echo "Error"
    exit 1
fi

echo "CPU Test with 2 Threads" >> $filename
echo "-----------------------" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    sysbench --test=cpu --threads=2 --cpu-max-prime=10000 --time=30 run | grep "events per second:\|total number of events:" >> $filename
done

echo "CPU Test with 4 Threads" >> $filename
echo "-----------------------" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    sysbench --test=cpu --threads=4 --cpu-max-prime=10000 --time=30 run | grep "events per second:\|total number of events:" >> $filename
done

echo "CPU Test with 8 Threads" >> $filename
echo "-----------------------" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    sysbench --test=cpu --threads=8 --cpu-max-prime=10000 --time=30 run | grep "events per second:\|total number of events:" >> $filename
done
