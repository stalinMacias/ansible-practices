## ---> This script it is conformed of 3 roles <--- ##

1.- The first role it is in charge of set up the structure on the remote host.
    It means, this role will create the needly directories and files where the inventory will be created!

2.- The second role it is in charge of deploy all templates to the remote host.
    It means, this role will take each template saved in the role's template directory and it'll deploy them in a folder that was created with the first role. 
    * Each template will be deployed with it's final extention, this means, if the template was use to store a sql query, on the host it'll be deployed as a .sql, or .sh, an so on, it depends the function of the template!

        *** Also, after all templates have been deployed, the script to run a sql query for collect all db wihtin its host it'll be executed ***
    
    The end result of running this script it'll be a file named as follows:

        inventory_collected_on_{{$DATE}}.inv

3.- The job of the third role is to fetch the file previously mentioned into the Ansible's server, store that file in the inventories folder, and after that, send an email notifying that the inventory has been created!
