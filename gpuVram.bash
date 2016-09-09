#!/bin/bash
#nvidia-smi -q -d UTILIZATION | grep Gpu | grep -oP "[0-9]{1,3}"
vram=$(nvidia-smi -q -d UTILIZATION | grep Memory | grep -oP "[0-9]{1,3}" )

echo "VRAM: $vram%"

