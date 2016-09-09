artist=$(qdbus org.mpris.clementine /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep artist | grep -oP ": (.)*$")

title=$(qdbus org.mpris.clementine /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep title | grep -oP ": (.)*$")

playback=$(qdbus org.mpris.clementine /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlaybackStatus)

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
	echo $playback ${artist:2} - ${title:2} 🤘
fi
