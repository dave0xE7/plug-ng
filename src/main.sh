#!/usr/bin/env bash

if ! [[ -v PLUG_PATH ]]; then
    echo "variable PLUG_PATH is not set"
    echo "exiting"
    exit;
fi

PLUG_DATA=$PLUG_PATH/data
if ! [ -d $PLUG_PATH ]; then
    echo "error"
    
    # if [[ ! -d $PLUG_DATA ]]; then
    #     echo "$PLUG_DATA directory not found"
    #     init
    # else
    # echo "$PLUG_CONFIG"
fi

generate_keys() {
    ssh-keygen -f $PLUG_DATA/id_rsa -t rsa -N '' -C 'plug' -b 4096 -y &> /dev/null
}
fingerprint_key() {
    ssh-keygen -f data/id_rsa.pub -l -E sha256 | awk '{print $2}' | awk -F: '{print $2}'
}

generate_uuid() {
    echo $(date +%s | sha1sum - | awk '{print $1}')
}

init() { 
    echo "initialising..."
    mkdir -vp $PLUG_DATA
    PLUG_UUID="$(generate_uuid)"
    echo "PLUG_UUID=$PLUG_UUID" > $PLUG_DATA/config

}

info() {
    echo "info"
    echo "pwd="$(pwd)""
    [ ! -d $PLUG_DATA ] && echo "has not been initialized yet"


}

help() {
    echo "plug help"
    echo "read the manual first"
}


POSITIONAL=()
while (( $# > 0 )); do
    case "${1}" in
        -f|--flag)
        echo flag: "${1}"
        shift # shift once since flags have no values
        ;;

        init) init; shift;;
        info) info; shift;;
        config) config; shift;;
        
        help| -h|--help)
        help; shift;
        shift # shift once since flags have no values
        ;;
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
        POSITIONAL+=("${1}")
        shift
        ;;
    esac
done

set -- "${POSITIONAL[@]}" # restore positional params


    