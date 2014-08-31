#!/bin/bash

readonly PROGNAME="$(basename $0)"
readonly PROGDIR="$(readlink -m "(dirname $0)")"
readonly ARGS="$@"
readonly SERVER="brzeczyszczykiewicz"

main() {
    mkdir -p ~/.ssh
    cp ~/id_rsa_rusty-server ~/.ssh 
    chmod 0600 ~/.ssh/id_rsa_rusty-server 

    ssh pvv@${SERVER}.pvv.ntnu.no -i ~/.ssh/id_rsa_rusty-server -t -o PasswordAuthentication=no $ARGS 
}

usage() {
    tee <<- EOF
    usage: $PROGNAME options

    Program remotely passes command to ${SERVER}.  

    OPTIONS:
        -s --show           shows a youtube video/gif/png from net
        -h --help           shows this help
        -v --verbose        verbose. This may be implemented


EOF
}

main
