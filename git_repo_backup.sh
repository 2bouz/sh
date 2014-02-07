#!/bin/sh

REMOTEREPO=user@host-name:/repository/path

# backup directory
DESTDIR=/backup/directory

# list of the bare repository name
REPOS=(abc xyz)

for REPO in ${REPOS[@]}; do
    if [ ! -e ${DESTDIR}/${REPO}.git ]; then
        echo "=============="
        echo "Creating mirror repository for ${REPO}.git"
        git clone --mirror ${REMOTEREPO}/${REPO}.git ${DESTDIR}/${REPO}.git
        echo "${DESTDIR}/${REPO}.git Created"
    else
        echo "=============="
        echo "Updateding ${REPO}.git..."
        cd ${DESTDIR}/${REPO}.git
        git remote update
        echo "${REPO}.git updated"
    fi
done
