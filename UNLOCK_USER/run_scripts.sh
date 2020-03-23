#! /bin/ksh

#ansible-playbook create_inventory.yml

# Clear the logs.log file before the execution of the second playbook
#rm logs.log
#touch logs.log
#ansible-playbook hello.yml


ansible-playbook collect_info_for_report.yml
#ansible-playbook validate_listeners.yml

# After the second playbook has finished its execution, it is time to delete the hosts file that was created and rename the original file to it's original name!
#rm hosts;
#mv hosts2 hosts;

#ansible-playbook mail_log.yml
