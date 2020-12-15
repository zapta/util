#!/bin/bash -x

# Ascii banners from:
# http://www.patorjk.com/software/taag/#p=display&h=0&f=Banner3&t=error

log="/tmp/automesh.txt"
python3="/c/Users/User/AppData/Local/Programs/Python/Python38-32/python"

date > $log


function print_ok() {
  echo
  echo
  echo
  echo "  #######  ##    ## "
  echo " ##     ## ##   ##  "
  echo " ##     ## ##  ##   "
  echo " ##     ## #####    "
  echo " ##     ## ##  ##   "
  echo " ##     ## ##   ##  "
  echo " #######  ##    ##  "
  echo
  sleep 2
}



function print_error() {
  echo
  echo
  echo
  echo " ######## ########  ########   #######  ########  "
  echo " ##       ##     ## ##     ## ##     ## ##     ## "
  echo " ##       ##     ## ##     ## ##     ## ##     ## "
  echo " ######   ########  ########  ##     ## ########  "
  echo " ##       ##   ##   ##   ##   ##     ## ##   ##   "
  echo " ##       ##    ##  ##    ##  ##     ## ##    ##  "
  echo " ######## ##     ## ##     ##  #######  ##     ## "
  echo
  sleep 60
}




echo "Args: $*" >> $log
echo "Arg1: $1" >> $log
echo "Arg2: $2" >> $log
echo >> $log

outfile=$(cygpath -u "$1")


$python3 /c/projects/util/repo/duet3d_automesh/duet3d_automesh.py "$outfile" 2>&1 >> $log


RESULT=$?
if [ $RESULT -eq 0 ]; then
  echo
  cat $log
  (set +x ; print_ok )
else
  echo
  cat $log
  (set +x; print_error)
  #msg user "Auto-mesh error. See $log"
fi



