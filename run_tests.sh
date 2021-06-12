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

catkin run_tests

catkin_test_results > ~/test_results.txt

