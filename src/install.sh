#!/bin/bash

echo "installation begin"

echo "PATH=${PATH}"
echo "PLUG_PATH=${PLUG_PATH}"
#echo "PATH=${PATH}"

function CreateSymbolicLinkAtPath() {
    echo "trying to create symbol at $1"
    if [ -d $1 ]; then
        # echo "path found"
        ls -lda $1
        if [ -e $1/plug ]; then
            echo "symbol already exists at $1/plug"
            if [ "$(realpath $1/plug)" == "$PLUG_PATH/bin/plug" ]; then
                echo "symbol at $1/plug"
                # ls -la $1/plug
            else
                ls -la $1/plug
                rm -rf $1/plug
                ln -s $PLUG_PATH/bin/plug $1/plug
            fi
            echo ""
        else
            ln -s $PLUG_PATH/bin/plug $1/plug
        fi
        ls -la $1/plug
    fi
    echo ""
}

is_sudoer() {
    ## Define error code
    E_NOTROOT=87 # Non-root exit error.

    ## check if is sudoer
    if ! $(sudo -l &> /dev/null); then
        echo 'Error: root privileges are needed to run this script'
        return $E_NOTROOT
    fi
    return  0
}

# check if current user is root or maybe sudoer
if (($(id -u) != 0)); then
    echo "I'm not root"
    if is_sudoer; then
        echo "Im sudoer"
        
    else
        echo "you ned to have root privileged"
        break
    fi
fi

if [ "$(command -v plug)" ]; then
    echo "command \"plug\" exists on system"
else
    echo "command \"plug\" not exists"
fi

# if [[ -d /usr/local/bin && -G /usr/local/bin ]]; then
# cd /usr/local/bin
# ln -s /
# fi


CreateSymbolicLinkAtPath /usr/bin
CreateSymbolicLinkAtPath /usr/local/bin
CreateSymbolicLinkAtPath /data/data/com.termux/files/usr/bin

echo "installation finished."
