#!/bin/bash

function flip()
{
    rotation=$(cat orientation.txt)
    if [[ $rotation == "normal" ]]
    then
        xrandr --output eDP-1 --rotate inverted
        xsetwacom --set "Wacom HID 5173 Finger touch" Rotate half
        xsetwacom --set "Wacom HID 5173 Pen stylus" Rotate half
        xsetwacom --set "Wacom HID 5173 Pen eraser" Rotate half
        echo "inverted" > orientation.txt
    else
        xrandr --output eDP-1 --rotate normal 
        echo "normal" > orientation.txt
        xsetwacom --set "Wacom HID 5173 Finger touch" Rotate none
        xsetwacom --set "Wacom HID 5173 Pen stylus" Rotate none
        xsetwacom --set "Wacom HID 5173 Pen eraser" Rotate none
    fi
}

flip

