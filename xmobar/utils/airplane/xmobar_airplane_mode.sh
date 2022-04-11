#!/bin/bash

mode=$(cat airplane_mode)
if [[ $mode == "on" ]]
then
    echo -e " | <fn=1>\uf51c </fn>"
else
    echo ""
fi
