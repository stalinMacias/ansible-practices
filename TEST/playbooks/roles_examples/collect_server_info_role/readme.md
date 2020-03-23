


	1.- The file named as: "playbook_with_no_role_structure.yml" was the one where the plays were created first.
       	    I mean, the role was created originally as a normal playbook, once it was tested and validated its functionality, that playbook was converted into a role.
        
       2.- In order to understand how the role works, all begins in the file named as: "run_collect_server_info.yml", that is the equivalent to the "main.yml" file of the role!

       3.- Read the file named as: "run_collect_server_info_README.md" to know the final goal of the role!


 		--- Important notes ---
	* In the local file the next path it must exist before the role runs by first time:
        
   		path: /ansible/ESO/DataAnalyticsOps/Oracle/TEST/logs/
	     
 	- if the path doesnt exist, create if first then run the playbook, otherwise, the playbook won´t run as it is expected!
