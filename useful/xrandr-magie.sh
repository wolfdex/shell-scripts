#!/bin/bash

# dual
case "$1" in

 auto) xrandr --output LVDS1 --auto --primary --output VGA1 --auto 

      ;;


 dualr) xrandr -o normal && xrandr --output LVDS1 --auto  --output VGA1 --auto  --pos 1280x0
    
       ;;

 duall) xrandr -o normal && xrandr --output LVDS1 --auto  --output VGA1 --auto  --pos -1280x0

       ;;

 dualo) xrandr -o normal && xrandr --output LVDS1 --auto  --output VGA1 --auto  --pos 1x0

      ;;


 xiv) xrandr -o inverted
      # NONE CW CCW HALF
      xsetwacom set "Serial Wacom Tablet eraser" rotate half
      ;;

 normal) xrandr -o normal
        xsetwacom set "Serial Wacom Tablet eraser" rotate none
      ;;

  x270) xrandr -o right
        xsetwacom set "Serial Wacom Tablet eraser" rotate cw
      ;;

   *) echo "default" 
      xrandr -o normal 
      ;;
   
esac





