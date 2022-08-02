ansible-playbook -i server scsidisk_list.yml|grep "0:0:$1:0"|awk '{print $7}'|tail -1 > disk_name.txt
