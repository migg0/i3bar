#!/bin/bash
#nvidia-smi -q -d UTILIZATION | grep Gpu | grep -oP "[0-9]{1,3}"
temp=$(nvidia-smi -q -d Temperature | grep Current | grep -oP "[0-9]{1,3}" )

echo "🌡 $temp℃"

