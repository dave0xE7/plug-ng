#!/usr/bin/env bash

if [ ! -v PLUG_DATA ]; then
    exit
fi

PLUG_TOR_LOGFILE=$PLUG_DATA/unique/tor.log
PLUG_TOR_TORRC=$PLUG_DATA/unique/torrc

echo "" > $PLUG_TOR_LOGFILE
mate-terminal --geometry=160x80+1930+0 --zoom=0.5 --working-directory=$(pwd) --title='plug-terminal' --command='tail -f '$PLUG_TOR_LOGFILE &

echo "starting"

if [ ! -f $PLUG_TOR_TORRC ]; then
    echo ''
    echo "HiddenServiceDir $PLUG_DATA/unique/hidden_service/" >> $PLUG_TOR_TORRC
    echo "HiddenServicePort 80 127.0.0.1:80" >> $PLUG_TOR_TORRC
    echo "HiddenServicePort 22 127.0.0.1:22" >> $PLUG_TOR_TORRC
fi


mkdir -vp $PLUG_DATA/unique/hidden_service/
chown -R root.root $PLUG_DATA/unique/hidden_service/
# chown -R debian-tor.debian-tor hidden_service
chmod -R 700 $PLUG_DATA/unique/hidden_service/

tor --Log "debug file $PLUG_TOR_LOGFILE" --torrc-file $PLUG_TOR_TORRC
#tor --Log "debug file debug.log" -f torrc
