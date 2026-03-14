#!/usr/bin/env bash
# Usage: $0 /mnt/destination/path

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
    "${HOME}/Music/" "${dest}/music"
    "${HOME}/News/" "${dest}/news"
    "${HOME}/Pictures/" "${dest}/img"
    "${HOME}/calibre/" "${dest}/calibre"
    "${HOME}/configs/" "${dest}/configs"
    "${HOME}/dev/" "${dest}/dev"
    "${HOME}/foo-shop/" "${dest}/foo-shop"
    "${HOME}/games/" "${dest}/games"
    "${HOME}/gnucash/" "${dest}/gnucash"
    "${HOME}/guitar/" "${dest}/guitar"
    "${HOME}/howm/" "${dest}/howm"
    "${HOME}/org-backups/" "${dest}/org-backups"
    "${HOME}/org/" "${dest}/org"
    "${HOME}/prj/" "${dest}/prj"
    # "${HOME}/src/" "${dest}/src"
    "${HOME}/sw/" "${dest}/sw"
    "/mnt/files/guitar/" "${dest}/guitar"
    "/mnt/files/img/" "${dest}/img"
    "/mnt/files/pgp/" "${dest}/pgp"
    "/mnt/files/src/" "${dest}/src"
)

# Dirs which we delete files (to exactly match the source dir, eg for git repos )
mirror_dirs=(
    "/mnt/files/password-store/" "${dest}/password-store"
    "/mnt/files/authinfo/" "${dest}/authinfo"
    "${HOME}/src/bash-scripts/" "${dest}/src/bash-scripts"
    "${HOME}/src/dotemacs/" "${dest}/src/dotemacs"
    "${HOME}/src/nascv/" "${dest}/src/nascv"
    "${HOME}/src/nixos-config/" "${dest}/src/nixos-config"
    "${HOME}/src/saveplace-pdf-view/" "${dest}/src/saveplace-pdf-view"
)

while (( ${#dirs[@]} )); do
    src="${dirs[0]}"
    dst="${dirs[1]}"
    echo -e "\n\e[1;34mBacking up ${src} => ${dst}\e[0m"
    rsync ${rsyncopts} ${src} ${dst}

    dirs=( ${dirs[@]:2} )
done



while (( ${#mirror_dirs[@]} )); do
    mirror_src="${mirror_dirs[0]}"
    mirror_dst="${mirror_dirs[1]}"
    echo -e "\n\e[1;34mBacking up ${mirror_src} => ${mirror_dst}\e[0m"
    rsync ${rsyncopts} --delete ${mirror_src} ${mirror_dst}

    mirror_dirs=( ${mirror_dirs[@]:2} )
done
