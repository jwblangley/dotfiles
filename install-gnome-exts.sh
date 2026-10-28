#!/usr/bin/env bash
set -e

if [[ "$1" != "load" && "$1" != "dump" ]]
then
    echo "Supported operations: load, dump"
    exit 1
fi

EXTENSIONS=(
  "tilingshell@ferrarodomenico.com"
)

if [[ "$1" == "load" ]]
then
    if ! command -v gext
    then
        echo "Installing gnome-extensions-cli (gext)"
        pipx install gnome-extensions-cli
    fi
fi


DCONF_BACKUP_DIR="${DCONF_BACKUP_DIR:-${HOME}/.dconf}"
DCONF_INSTALL_DIR=${DCONF_INSTALL_DIR:-"/org/gnome/shell/extensions"}

for ext in "${EXTENSIONS[@]}"; do
    dconf_name=$(cut -d'@' -f1 <<<"$ext")

    if [ "$1" == "load" ]
    then
        if ! gext list | grep -q "$ext"
        then
            echo "Installing $ext"
            gext install "$ext"
        fi

        echo "Install config for $ext"
        dconf load "${DCONF_INSTALL_DIR}/${dconf_name}/" <"${DCONF_BACKUP_DIR}/${dconf_name}.dconf"
    else
        # Sadly gnome does not support symlinks so we need an export option
        echo "Exporting config for $ext"
        dconf dump "${DCONF_INSTALL_DIR}/${dconf_name}/" >"${DCONF_BACKUP_DIR}/${dconf_name}.dconf"
    fi
done
