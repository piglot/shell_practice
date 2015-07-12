#!/bin/bash

array=("HI" "my" "name" "is")

echo ${array[0]}

echo ${array[@]}

echo ${!array[@]}

unset array[2];echo ${array[@]}

array[333]="New_elemetn";echo ${array[@]}

