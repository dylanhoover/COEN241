
#!/bin/bash

config=$1

if [ $config -eq 0 ];
then
    sudo qemu-system-x86_64 -m 2048 -boot d -accel kvm -smp cores=1,threads=2 -boot strict=on -hda ubuntu.img

elif [ $config -eq 1 ];
then
    sudo qemu-system-x86_64 -m 4096 -boot d -accel kvm -smp cores=2,threads=2 -boot strict=on -hda ubuntu.img

elif [ $config -eq 2 ];
then
    sudo qemu-system-x86_64 -m 8192 -boot d -accel kvm -smp cores=4,threads=2 -boot strict=on -hda ubuntu.img

else
    echo "Error"
    exit 1
fi
