#!/bin/sh
set -e
#обязательно поменяйте путь на вашу директорию с проектом
REPO_DIR="$HOME/alpine-hyprland-noctalia"

PACKAGES="
hyprutils
hyprgraphics
hyprlang
hyprwire
hyprcursor
aquamarine
hyprland
xdg-desktop-portal-hyprland
"

for pkg in $PACKAGES; do
    target_dir="$REPO_DIR/$pkg"
    
    if [ ! -d "$target_dir" ]; then
        echo "--> [ПРОПУСК] Каталог $target_dir не найден."
        continue
    fi

    echo "===> Сборка $pkg в $target_dir"
    cd "$target_dir"
    
    abuild checksum
    abuild -r -c
    doas apk update
done

echo "===> Все пакеты успешно собраны!"
