artist=$(qdbus org.mpris.clementine /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep artist | grep -oP ": (.)*$")

title=$(qdbus org.mpris.clementine /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep title | grep -oP ": (.)*$")

playback=$(qdbus org.mpris.clementine /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlaybackStatus)

length=$(qdbus org.mpris.clementine /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep length | grep -oP ": (.)*$")

position=$(qdbus org.mpris.clementine /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Position )

left="$((${length:2} - $position))"
min="$(($left / 60000000 ))"
sec="$(($left / 1000000 ))"
sec="$(($sec - ($min * 60)))"
minZero=""
secZero=""

if [ ${min} -lt 10 ] ; then
	minZero="0";
fi

if [ ${sec} -lt 10 ] ; then
	secZero="0";
fi

if [ $playback == 'Playing' ] ; then
	playback="⯈";
#	playback="⏵";
elif [ $playback == 'Paused' ] ; then
#	playback="▮▮";
	playback="⏸";
fi

if [ $playback == 'Stopped' ] ; then
#	echo ◼ ;
	echo ⏹ ;
else
	echo $playback ${artist:2} - ${title:2}  -${minZero}${min}:${secZero}${sec} 🤘
fi
