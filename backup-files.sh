#!/usr/bin/env bash

rsyncopts="-ravvh --progress --log-file=${HOME}/backup-files.log"

echo '' > ${HOME}/backup-files.log

dest=/run/media/USER/EXTERNAL_HD1
if [ -d $dest ]; then
	rsync ${rsyncopts} ${HOME}/calibre/ ${dest}/calibre
	rsync ${rsyncopts} ${HOME}/configs/ ${dest}/configs
	rsync ${rsyncopts} ${HOME}/dev/ ${dest}/dev
	rsync ${rsyncopts} ${HOME}/Documents/ ${dest}/doc
	rsync ${rsyncopts} ${HOME}/games/ ${dest}/games
	rsync ${rsyncopts} ${HOME}/Pictures/ ${dest}/img
	rsync ${rsyncopts} ${HOME}/Music/library/ ${dest}/music
	rsync ${rsyncopts} ${HOME}/Music/sfx/ ${dest}/music-sfx
	rsync ${rsyncopts} ${HOME}/Music/flac/ ${dest}/music-flac
	rsync ${rsyncopts} ${HOME}/org/ ${dest}/org
	rsync ${rsyncopts} ${HOME}/prj/ ${dest}/prj
	rsync ${rsyncopts} ${HOME}/sw/ ${dest}/sw
fi

dest=/run/media/USER/EXTERNAL_HD2
if [ -d $dest ]; then
	rsync ${rsyncopts} ${HOME}/calibre/ ${dest}/calibre
	rsync ${rsyncopts} ${HOME}/configs/ ${dest}/configs
	rsync ${rsyncopts} ${HOME}/dev/ ${dest}/dev
	rsync ${rsyncopts} ${HOME}/Documents/ ${dest}/doc
	rsync ${rsyncopts} ${HOME}/games/ ${dest}/games
	rsync ${rsyncopts} ${HOME}/Pictures/ ${dest}/img
	rsync ${rsyncopts} ${HOME}/Music/library/ ${dest}/music
	rsync ${rsyncopts} ${HOME}/Music/sfx/ ${dest}/music-sfx
	rsync ${rsyncopts} ${HOME}/Music/flac/ ${dest}/music-flac
	rsync ${rsyncopts} ${HOME}/org/ ${dest}/org
	rsync ${rsyncopts} ${HOME}/prj/ ${dest}/prj
	rsync ${rsyncopts} ${HOME}/sw/ ${dest}/sw
fi
