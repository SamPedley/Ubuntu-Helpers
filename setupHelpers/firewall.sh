#!/bin/bash

function setupFirewall() {
    read -r -p "Setup Firewall? (y or n): " continue
    if [[ $continue = "y" ]]; then
        echo "Firewall currently includes: "
        ufw app list
        # Make sure we allways open up the ssh port.  Because why wouldn't we. 
        ufw allow ssh
        ufw allow 4444/tcp
    else
        return 1
    fi

    read -r -p "Open HTTP/HTTPS ports? (y or n): " http
    if [[ $http = "y" ]]; then
        ufw allow 80/tcp
        ufw allow 443/tcp
    fi

    read -r -p "Open SMPT Email ports? (y or n): " smpt
    if [[ $smpt = "y" ]]; then
        ufw allow 25/tcp
    fi

    echo "Firewall will now include:"
    ufw show added

    read -r -p "Save and Enable Firewall changes? (y or n): " save
    if [[ $save = "y" ]]; then
        echo "Firewall changes HAVE been made: "
        ufw enable
    else
        echo "Firewall changes NOT saved"
        return 1
    fi
}
