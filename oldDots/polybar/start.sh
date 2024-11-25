function DOUBLESCREEN {
	! xrandr | grep "^VGA1" | grep disconnected
}
# Whait for kill
killall -q polybar

while pgrep -x polybar >/dev/null; do sleep 1; done

polybar primary &
if DOUBLESCREEN 
then
	polybar split &
fi
