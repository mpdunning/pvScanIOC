#!/bin/bash

n=10
outFile=scanPv.req

exec > $outFile

for (( i=1; i<=$n; i++ )); do 
    echo "\$(P):SCANPV$i:INC"
    echo "\$(P):SCANPV$i:SPEED"
    echo "\$(P):SCANPV$i:START"
    echo "\$(P):SCANPV$i:STOP"
    echo "\$(P):SCANPV$i:NSTEPS"
    echo "\$(P):SCANPV$i:DESC"
    echo "\$(P):SCANPV$i:OFFSET"
    echo "\$(P):SCANPV$i:SETTLETIME"
    echo "\$(P):SCANPV$i:PVNAME"
    echo "\$(P):SCANPV$i:PVTYPE"
    echo "\$(P):SCANPV$i:DELTA"
    echo "\$(P):SCANPV$i:PRE_START"
    echo "\$(P):SCANPV$i:PRE_STOP"
    echo "\$(P):SCANPV$i:PRE_NSTEPS"
    echo "\$(P):SCANPV$i:PRE_INC"
    echo "\$(P):SCANPV$i:RANDSCAN"
    echo "\$(P):SCANPV$i:RAND_VALS"
    echo "\$(P):SCANPV$i:RBVNAME"
    echo
done


exit 0

