# hidblock
A shell script that generates rules and applies them to prevent new USB HID 
devices from registering themselves with your Linux machine. This is to prevent 
malicious USB attacks from hijacking you by impersonating input devices(BadUSB).

This script adds rules to your /etc/udev/rules.d/ folder that disable
new USB HID's from attaching to your computer. New USB mice and keyboards
will not work until you disable the rules. This should prevent USB devices 
from impersonating Human Interface Devices in order to prevent BadUSB attacks.
 
usage:
	 ./hidblock < block || b > = Block all new USB Human Interface Devices
 	 ./hidblock < unblock || u > = Unblock new USB Human Interface Devices
 	 ./hidblock < install || i > = Install(or reinstall over) the rules file
file location:
 	 /etc/udev/rules.d/10-usbblock.rules rule contents(10-usbblock.rules):
 	 #ACTION=="add", ATTR{bInterfaceClass}=="03" RUN+="/bin/sh -c 'echo 0 >/sys$DEVPATH/../authorized'"

