#!/bin/bash

if [ -z $WS_PATH ]
then
      echo "workspace path is empty!"
      exit 1
fi

cd $WS_PATH

if [ -z $SETUP_PATH ]
then
    source install/setup.bash
else
    source $SETUP_PATH
fi

rm -rf build/ logs/ devel/ install/

catkin_make_isolated

source devel_isolated/setup.bash

catkin_make_isolated --make-args run_tests

catkin_test_results > ~/test_results.txt

