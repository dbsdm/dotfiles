#!/bin/bash

cut_at=20 # characters
length=$(mpc --port=8888 current | awk '{print length}')

if [ $length -eq 0 ]; then
    result=""
elif [ $length -le $cut_at ]; then
    result=" $(mpc --port=8888 current)"
else
    result=" $(mpc --port=8888 current | cut -c -20)..."
fi

echo $result
