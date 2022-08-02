ansible-playbook -i server scsidisk_list.yml|grep "0:0:[0-9]*:0"|awk -F : '{print $3}'|tail -1 > unit_number.txt
