#!/bin/sh
. ./settings.sh
"$JAVACMD" -server -Xms${MIN_RAM} -Xmx${MAX_RAM} ${JAVA_PARAMETERS} -jar ${FORGEJAR} nogui