#!/usr/bin/env bash

rsyncopts="-ravvh --progress --log-file=${HOME}/restore-files.log"

echo '' > ${HOME}/restore-files.log

src=/run/media/USER/EXTERNAL_HD1
if [ -d $src ]; then
	rsync ${rsyncopts} ${src}/calibre ${HOME}/
	rsync ${rsyncopts} ${src}/configs ${HOME}/
	rsync ${rsyncopts} ${src}/dev ${HOME}/
	rsync ${rsyncopts} ${src}/doc/ ${HOME}/Documents/
	rsync ${rsyncopts} ${src}/games ${HOME}
	rsync ${rsyncopts} ${src}/img/ ${HOME}/Pictures/
	rsync ${rsyncopts} ${src}/music/ ${HOME}/Music/library/
	rsync ${rsyncopts} ${src}/music-sfx/ ${HOME}/Music/sfx/
	rsync ${rsyncopts} ${src}/music-flac/ ${HOME}/Music/flac/
	rsync ${rsyncopts} ${src}/org ${HOME}/
	rsync ${rsyncopts} ${src}/prj ${HOME}/
	rsync ${rsyncopts} ${src}/sw ${HOME}/
fi
