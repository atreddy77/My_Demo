vmem=$(($2 * 1024))
ansible-playbook vm_add_mem.yml --extra-vars="vmname=$1 vmem=$vmem"
