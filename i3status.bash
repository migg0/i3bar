#!/bin/bash
# Public Domain
# (someone claimed the next lines would be useful for…
#  people. So here goes: © 2012 Stefan Breunig
#  stefan+measure-net-speed@mathphys.fsk.uni-heidelberg.de)

# append i3status output to the measure-net-speed’s one.
# the quote and escape magic is required to get valid
# JSON output, which is expected by i3bar (if you want
# colors, that is. Otherwise plain text would be fine).
# For colors, your i3status.conf should contain:
# general {
#   output_format = i3bar
# }

# i3 config looks like this:
# bar {
#   status_command measure-net-speed-i3status.bash
# }

cd ~/.config/i3/i3bar

i3status -c ./i3status.conf | (read line && echo $line && read line && echo $line && while :
do
  read line
  music=$(./music.bash)
  net=$(./measure-net-speed.bash)
#  gpu=$(./gpuLoad.bash)
#  vram=$(./gpuVram.bash)
#  temp=$(./gpuTemp.bash)
  ram=$(free | grep Mem | awk '{ printf("RAM: %.0f%", $4/$2 * 100.0) }')

  net_json="{ \"name\":\"net\", \"min_width\":120, \"align\": \"right\", \"full_text\":\"${net}\" },"
  line=${line/'{"name":"ethernet"'/${net_json}'{"name":"ethernet"'}

#  gpu_json="{ \"name\":\"gpu\", \"min_width\":60, \"align\": \"right\", \"full_text\":\"${gpu}\" },"
#  vram_json="{ \"name\":\"vram\", \"min_width\":65, \"align\": \"right\", \"full_text\":\"${vram}\" },"
#  temp_json="{ \"name\":\"temp\", \"full_text\":\"${temp}\" }," 
#  line=${line/'{"name":"cpu_usage"'/${gpu_json}${vram_json}${temp_json}'{"name":"cpu_usage"'}

  ram_json="{ \"name\":\"ram\", \"full_text\":\"${ram}\" },"
  line=${line/'{"name":"tztime"'/${ram_json}'{"name":"tztime"'}

  dat="[{ \"name\":\"music\", \"full_text\":\"${music}\" },"
  echo "${line/[/$dat}" || exit 1
done)
