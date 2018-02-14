#!/bin/sh

if ! pgrep cmus ; then
	urxvt -e cmus
else
	cmus-remote -u
fi
