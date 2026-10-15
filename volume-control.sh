set -e

OP="$1"
SINK="@DEFAULT_SINK@"

notify() {
    dunstify -t 1000 "$1"
}

if [ -z $OP ] || ( [ $OP != 'up' ] && [ $OP != 'down' ] && [ $OP != 'toggle' ] ); then
    echo "Wrong operation."
    exit 1
fi

if [ $OP = 'toggle' ]; then
    pactl set-sink-mute $SINK toggle
    notify "$(pactl get-sink-mute $SINK)"
    exit 0
fi

VOL=$(pactl get-sink-volume $SINK | grep -Po '\d+(?=%)' | head -n 1)

if [ $OP = 'up' ];then
    VOL=$(( $VOL + 5 ))
else
    VOL=$(( $VOL - 5 ))
fi

if [ $VOL -gt 100 ]; then
    VOL=100
fi

if [ $VOL -lt 0 ]; then
    VOL=0
fi

pactl set-sink-volume $SINK "$VOL%"

notify "Volume $VOL%"

