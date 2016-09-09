#!/bin/bash
#nvidia-smi -q -d UTILIZATION | grep Gpu | grep -oP "[0-9]{1,3}"
load=$(nvidia-smi -q -d UTILIZATION | grep Gpu | grep -oP "[0-9]{1,3}" )

echo "GPU: $load%"

