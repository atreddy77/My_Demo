echo "Welcome"
ansible-playbook -i hosts create_vm_from_template.yml --extra-vars="vmname=vmtemp10 vmmem=2048 vmcpu=2 ipa=192.168.0.88 nmask=255.255.255.0 ipg=192.168.0.1 dnsp=192.168.0.1 dnss=192.168.0.100"
