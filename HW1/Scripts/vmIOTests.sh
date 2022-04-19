#!/bin/bash

dir=$(pwd)
filename=$dir/vm_io_test_results.txt
if [ ! -f $filename ]
then
    touch $filename
    echo "QEMU VM IO Test Results" >> $filename
fi

cpus=1

if [ $cpus -eq 1 ]; #1 core, 2 threads
then
    echo "VM Configuration: 1 core, 2 threads, 2 GB Mem" >> $filename
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

echo "Sequential Write Mode" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    #Create files to test
    sysbench --test=fileio --file-num=128 --file-total-size=500M prepare
    #Run tests
    sysbench --test=fileio --file-num=128 --file-total-size=500M --file-test-mode=seqwr run \
    | grep "Throughput:\|read, MiB/s:\|written, MiB/s:\|Latency (ms):\|min:\|avg:\|max:\|95th percentile:\|sum:" >> $filename
    #Cleanup
    sysbench --test=fileio cleanup
    #Drop the cache
    sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
done

echo "Sequential Read mode" >> $filename
for ((counter=1; counter<6; counter++))
do
    echo "TEST $counter" >> $filename
    #Create the files to test
    sysbench --test=fileio --file-num=128 --file-total-size=500M prepare
    #Run the actual test
    sysbench --test=fileio --file-num=128 --file-total-size=500M --file-test-mode=seqrd run \
    | grep "Throughput:\|read, MiB/s:\|written, MiB/s:\|Latency (ms):\|min:\|avg:\|max:\|95th percentile:\|sum:" >> $filename
    #Cleanup the test files
    sysbench --test=fileio cleanup
    #Drop the cache
    sudo sh -c 'echo 3 > /proc/sys/vm/drop_caches'
done
