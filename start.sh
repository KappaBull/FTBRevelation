#!/bin/sh
. ./settings.sh
export MAX_RAM="7G"       # -Xmx
export MIN_RAM="6G"       # -Xms
"$JAVACMD" -server -Xmx${MAX_RAM} -Xms${MIN_RAM} ${JAVA_PARAMETERS} -jar ${FORGEJAR} nogui