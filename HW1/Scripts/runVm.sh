
#!/bin/bash

#Arg = 0 - low-end config
#Arg = 1 - middle-end config
#Arg = 2 - high-end config

vm_config=$1

if [ $vm_config -eq 0 ];
then
    sudo qemu-system-x86_64 -m 2048 -boot d -accel kvm -smp cores=1,threads=2 -boot strict=on -hda ubuntu.img

elif [ $vm_config -eq 1 ];
then
    sudo qemu-system-x86_64 -m 4096 -boot d -accel kvm -smp cores=2,threads=2 -boot strict=on -hda ubuntu.img

elif [ $vm_config -eq 2 ];
then
    sudo qemu-system-x86_64 -m 8192 -boot d -accel kvm -smp cores=4,threads=2 -boot strict=on -hda ubuntu.img

else
    echo "Incorrect VM Configuration selected."
    exit 1
fi
