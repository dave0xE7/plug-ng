#!/usr/bin/env bash

init() {
    echo "initialising..."
}

info() {
    echo "info"
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

        init) init; shift;
        ;;
        info) info; shift
        ;;
        config) config; shift
        ;;

        -h|--help)
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


    