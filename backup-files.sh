#!/usr/bin/env bash

rsyncopts="-ravh --info=NAME1 --progress --log-file=${HOME}/backup-files.log"

echo '' > ${HOME}/backup-files.log

dest="${1:-/destination/path}"
if [ ! -d "$dest" ]; then
    echo "$dest not found"
    exit 1
fi

dirs=(
    "${HOME}/3d-printing/" "${dest}/3d-printing"
    "${HOME}/Documents/" "${dest}/doc"
    "${HOME}/Mail/" "${dest}/mail"
    "${HOME}/Music/flac/" "${dest}/music-flac"
    "${HOME}/Music/library/" "${dest}/music"
    "${HOME}/Music/playlists/" "${dest}/music-playlists"
    "${HOME}/Music/sfx/" "${dest}/music-sfx"
    "${HOME}/News/" "${dest}/news"
    "${HOME}/Pictures/" "${dest}/img"
    "${HOME}/calibre/" "${dest}/calibre"
    "${HOME}/configs/" "${dest}/configs"
    "${HOME}/dev/" "${dest}/dev"
    "${HOME}/foo-shop/" "${dest}/foo-shop"
    "${HOME}/games/" "${dest}/games"
    "${HOME}/org-backups/" "${dest}/org-backups"
    "${HOME}/org/" "${dest}/org"
    "${HOME}/prj/" "${dest}/prj"
    "${HOME}/sw/" "${dest}/sw"
)

while (( ${#dirs[@]} )); do
    src="${dirs[0]}"
    dst="${dirs[1]}"
    echo -e "\n\e[1;34mBacking up ${src} => ${dst}\e[0m"
    rsync ${rsyncopts} ${src} ${dst}

    dirs=( ${dirs[@]:2} )
done
