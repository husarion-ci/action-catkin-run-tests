#!/bin/bash


if [ -z $1 ]
then
      echo "workspace path is empty!"
      exit(1)
fi

cd $1

if [ -z $2 ]
then
    source install/setup.bash
else
    source $2
fi

catkin run_tests

catkin_test_results > ~/test_results.txt