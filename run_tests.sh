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

echo 'starting testing'

if catkin run_tests; then
    ;
else
    echo `catkin run tests failed` 
    exit(1)
fi


echo 'finished run_tests'

catkin_test_results > ~/test_results.txt

cat ~/test_results.txt

sudo cp `find . -name "rostest*.xml"` ~/outputs_path
sudo cp `find . -name "gtest*.xml"` ~/outputs_path
sudo cp `find . -name "rosunit*.xml"` ~/outputs_path

echo 'printed tests results'

