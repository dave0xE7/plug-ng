
if [ "$(command -v apt)" ]; then
    echo "command \"apt\" exists on system"
    sudo apt update -y
    sudo apt install -y curl wget git jq tor openssh-server
  fi

if [ "$(command -v pkg)" ]; then
    echo "command \"pkg\" exists on system"
    pkg update -y
    pkg install curl wget git jq tor openssh-server -y
fi
