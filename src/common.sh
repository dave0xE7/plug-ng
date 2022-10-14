#!/bin/bash

if [ $EUID != 0 ]; then
    PLUG_DEST=$PLUG_HOME_DEST;
else
    if [ -d /opt ]; then
        PLUG_DEST=$PLUG_ROOT_DEST;
    else
        PLUG_DEST=$PLUG_HOME_DEST;
    fi;
fi;
echo "$PLUG_DEST"


FindWriteableSearchPath() {
    for item in $(echo $PATH); do
        # echo $item;
        
        if [[ -d $item && -L $item ]]; then
            # echo "folder $item is a symbolic link to $(realpath $item)"
            target=$(realpath $item)
            if [[ -d $target && -G $target ]]; then
                # echo "folder $target is writeable"
                echo $target
            fi
        elif [[ -d $item && -G $item ]]; then
            # echo "folder $item is a writeable search path"
            echo $item
        else
            parent=$(dirname $item)
            if [[ -d $parent && -G $parent ]]; then
                # echo "folder $item could be created"
                mkdir -vp $item
                if [[ -d $item && -G $item ]]; then
                    echo $item
                fi
            fi
        fi
    done
}

FindWriteableSearchPath