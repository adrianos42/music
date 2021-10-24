#!/usr/bin/bash

flutter build linux --verbose --release
rm -rf ~/opt/music
mkdir -p ~/opt/music
cp -r build/linux/x64/release/bundle/* ~/opt/music/
cp assets/icon_transparent.svg ~/opt/music/icon.svg
echo "#!/usr/bin/env xdg-open
[Desktop Entry]
Version=1.0
Terminal=false
Type=Application
Name=Music" >> ~/.local/share/applications/music.desktop
echo "Exec=$HOME/opt/music/music" >> ~/.local/share/applications/music.desktop
echo "Icon=$HOME/opt/music/icon.svg" >> ~/.local/share/applications/music.desktop