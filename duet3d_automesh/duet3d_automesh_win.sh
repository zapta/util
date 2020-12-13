#!/bin/bash -x

log="/tmp/automesh.txt"
#python3="/Library/Frameworks/Python.framework/Versions/3.6/bin/python3"
python3="/c/Users/User/AppData/Local/Programs/Python/Python38-32/python"

date > $log
echo "Args: $*" >> $log
echo "Arg1: $1" >> $log
echo "Arg2: $2" >> $log
echo >> $log

outfile=$(cygpath -u "$1")

$python3 /c/projects/util/repo/duet3d_automesh/duet3d_automesh.py "$outfile" 2>&1 > $log


RESULT=$?
if [ $RESULT -eq 0 ]; then
  msg user "Auto-mesh completed ok"
  #osascript -e 'display notification "OK." with title "Duet automesh"'
else
  #osascript -e 'display notification "Failed." with title "Duet automesh"'
  msg user "Auto-mesh error. See $log"
  pause 10
fi



