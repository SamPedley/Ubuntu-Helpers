#!/bin/bash

set -e

function getCurrentDir() {
    local current_dir="${BASH_SOURCE%/*}"
    if [[ ! -d "${current_dir}" ]]; then current_dir="$PWD"; fi
    echo "${current_dir}"
}

function includeDependencies() {
    source "${current_dir}/setupHelpers/firewall.sh"
    source "${current_dir}/setupHelpers/node.sh"
}

current_dir=$(getCurrentDir)
includeDependencies

function init() {
	apt-get update
	apt-get install curl
	#setupLamp
	setupNode
	setupFirewall
}

# Run that init thag...
init
