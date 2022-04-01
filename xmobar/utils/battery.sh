#!/bin/bash

# Settings
critical_percentage=10

# Get battery data
upwr=$(upower -e | grep 'BAT')
state=$(upower -i $upwr | grep "state" | awk '{print $2}')
percentage=$(upower -i $upwr | grep "percentage" | awk '{print $2}')
time=$(upower -i $upwr | grep "time" | awk '{print $4}')
time_scale=$(upower -i $upwr | grep "time" | awk '{print $5}')
time_hours=$(echo "$time / 1" | bc)
time_min=$(printf "%02d" $(echo "(($time - $time / 1) * 60) / 1" | bc))

# Format time until charge or empty
if [[ $time_scale == "hours" ]]
then
    time_str="$time_hours:$time_min"
elif [[ $time_hours == "0" ]]
then
    time_str=""
else
    time_str="00:$(printf "%02d" $time_hours)"
fi

# Battery Icon
battery_icon_str="<fn=1>"
if [[ $state == "fully-charged" ]]
then
    echo "fully charged: \uf584"
elif [[ $state == "charging" ]]
then
    if [[ ${percentage%?} -lt 30 ]]
    then
        battery_icon_str+="\uf585"
    elif [[ ${percentage%?} -lt 40 ]]
    then
        battery_icon_str+="\uf586"
    elif [[ ${percentage%?} -lt 50 ]]
    then
        battery_icon_str+="\uf587"
    elif [[ ${percentage%?} -lt 70 ]]
    then
        battery_icon_str+="\uf588"
    elif [[ ${percentage%?} -lt 90 ]]
    then
        battery_icon_str+="\uf589"
    elif [[ ${percentage%?} -lt 100 ]]
    then
        battery_icon_str+="\uf58a"
    else
        battery_icon_str+="\uf584"
    fi
elif [[ $state == "discharging" ]]
then
    if [[ ${percentage%?} -le $critical_percentage ]]
    then
        battery_icon_str+="<fc=red>\uf582</fc>"
    elif [[ ${percentage%?} -lt 20 ]]
    then
        battery_icon_str+="\uf579"
    elif [[ ${percentage%?} -lt 30 ]]
    then
        battery_icon_str+="\uf57a"
    elif [[ ${percentage%?} -lt 40 ]]
    then
        battery_icon_str+="\uf57b"
    elif [[ ${percentage%?} -lt 50 ]]
    then
        battery_icon_str+="\uf57c"
    elif [[ ${percentage%?} -lt 60 ]]
    then
        battery_icon_str+="\uf57d"
    elif [[ ${percentage%?} -lt 70 ]]
    then
        battery_icon_str+="\uf57e"
    elif [[ ${percentage%?} -lt 80 ]]
    then
        battery_icon_str+="\uf57f"
    elif [[ ${percentage%?} -lt 90 ]]
    then
        battery_icon_str+="\uf580"
    elif [[ ${percentage%?} -lt 100 ]]
    then
        battery_icon_str+="\uf581"
    else
        battery_icon_str+="\uf578"
    fi
else
    battery_icon_str+="error: state = $state"
fi
battery_icon_str+="</fn>"

# Display String
echo -e "$battery_icon_str $percentage ($time_str)"
