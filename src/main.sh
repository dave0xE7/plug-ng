#!/usr/bin/env bash

if ! [[ -v PLUG_PATH ]]; then
    echo "variable PLUG_PATH is not set"
    echo "exiting"
    exit;
fi

# loading common function library
source $PLUG_PATH/src/common.sh

PLUG_DATA=$PLUG_PATH/data
if ! [ -d $PLUG_PATH ]; then
    echo "error"
    
    # if [[ ! -d $PLUG_DATA ]]; then
    #     echo "$PLUG_DATA directory not found"
    #     init
    # else
    # echo "$PLUG_CONFIG"
fi

init() { 
    echo "initialising..."
    mkdir -vp $PLUG_DATA
    mkdir -vp $PLUG_DATA/unique
    PLUG_UUID="$(generate_uuid)"
    echo "PLUG_UUID=$PLUG_UUID" > $PLUG_DATA/unique/config
    echo "$PLUG_UUID" > $PLUG_DATA/unique/uuid

}

info() {
    echo "info"
    echo "CWD="$(pwd)""
    echo "PLUG_PATH=$PLUG_PATH"

    if [ -d $PLUG_DATA/unique ]; then
        source $PLUG_DATA/unique/config
        echo "PLUG_UUID=$PLUG_UUID"
    else
        echo "has not been initialized yet"
    fi

}

help() {
    echo "plug help"
    echo "read the manual first"
}

service() {
    export $PLUG_PATH
    node $PLUG_PATH/src/app/main.js
}


if [ $# == 0 ]; then
    echo "done"
    info
fi

POSITIONAL=()
while (( $# > 0 )); do
    case "${1}" in
        -f|--flag)
        echo flag: "${1}"
        shift # shift once since flags have no values
        ;;

        init) init; shift;;
        info) info; shift;;
        install)
            source $PLUG_PATH/src/install.sh; 
            shift
            ;;
        config) config; shift;;
        service) service; shift;;
        
        help| -h|--help) help; shift;;

        -s|--switch)
        numOfArgs=1 # number of switch arguments
        if (( $# < numOfArgs + 1 )); then
            shift $#
        else
            echo "switch: ${1} with value: ${2}"
            shift $((numOfArgs + 1)) # shift 'numOfArgs + 1' to bypass switch and its value
        fi
        ;;
        *) # unknown flag/switch
        echo "unknown"
        POSITIONAL+=("${1}")
        shift
        ;;
    esac
done

set -- "${POSITIONAL[@]}" # restore positional params


    