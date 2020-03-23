#! /bin/ksh

# Get db_name
DB_NAME=`ps -ef|grep pmon |grep -v grep |cut -d '_' -f3`

db_name=`echo $DB_NAME |tr '[:upper:]' '[:lower:]'`
# Load profile
. ~/.profile$db_name

# Change directory to oh
oh
# Change directory to network/admin/
cd network/admin/

# Get the total listeners that should be running (listeners registered)
listeners_registered=`cat listener.ora | grep "SID_LIST_" | wc -l`

# Get the total listener that are running
listeners_running=`ps -eaf | grep tnslsnr | grep -v grep | wc -l`

#  Check if the file where listeneres that are not running exists on the server
NOT_RUNNING_LISTENERS=/tmp/not_running_listeneres
if [ -f "$NOT_RUNNING_LISTENERS" ];
then
echo "File exists"
else
touch "$NOT_RUNNING_LISTENERS"
fi

# Compare differences between registered and running listeners
if [ $listeners_registered -ne $listeners_running ]; 
then 
# Create a file with the listeners that should be running
cat listener.ora | grep "SID_LIST_" | cut -d "_" -f3 | sed s/=// | sort > /tmp/listeners_registered; 
# Create a file with the listeners that are currently running
ps -eaf | grep tnslsnr | grep -v grep | awk '{print $(NF-1)}' | sort > /tmp/listeners_running;
# Compare both values and those that are different, write them in a file 
comm -3 /tmp/listeneres_resigtered /tmp/listeneres_running > "$NOT_RUNNING_LISTENERS";
else
echo "All regitered listeners are running properly" > "$NOT_RUNNING_LISTENERS"
echo "=============================" >> "$NOT_RUNNING_LISTENERS"
fi


# Create a file with the listeners that should be running
#cat listener.ora | grep "SID_LIST_" | cut -d "_" -f3 | sed s/=// | sort > /tmp/listeners_registered

# Create a file with the listeners that are currently running
#ps -eaf | grep tnslsnr | grep -v grep | awk '{print $(NF-1)}' | sort > /tmp/listeners_running



