#ansible-playbook -i hosts create_vm.yml --extra-vars="vmname=$1 vmmem=$2  vmcpu=$3"
ansible-playbook --vault-password-file=anspwd.yml vm_add_cpu.yml --extra-vars="dc=$1 vmname=$2 vmcpu=$3"
