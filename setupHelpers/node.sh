#!/bin/bash

function setupNode() {
    read -p "Setup Node? (y or n): " continue
    if [[ $continue != "y" ]]; then
        return 1
    fi

    apt-get install build-essential
    curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
    apt-get install -y nodejs
}
