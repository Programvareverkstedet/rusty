#!/bin/bash


readonly PROGNAME="$(basename $0)"
readonly PROGDIR="$(readlink -m "(dirname $0)")"
readonly ARGS="$@"

main() {
        local program=$1 
        local link=$2
        local generatedLink
        if [[ $program == "vis" ]];then
                generatedLink=$(youtube-dl -g $link)
                tee ~pvv/var/queue/$(uuidgen) <<- EOF
$program
mpv $generatedLink 
EOF

        else
                tee ~pvv/var/queue/$(uuidgen) <<- EOF
$program
$ARGS
EOF
        fi
}

usage() {
        tee <<- EOF
EOF

}
main $ARGS
#this not best practice, going to sleep ZZzzz#!/bin/bash
