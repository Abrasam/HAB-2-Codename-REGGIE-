#!/bin/bash
screen -mSd gps
screen -S gps -X stuff "python GPSLoop.py\n"
screen -mSd image
screen -S image -X stuff "./imageLoop.sh\n"
python setAirborneMode.py
sleep 30s
while true; do
    Alt="`python Alt.py`"
    if [ "$Alt" -lt "5000" ];
    then
        python Telemetry.py
    else
        python SSDV.py
        python Telemetry.py
    fi
    sleep 2s
done
