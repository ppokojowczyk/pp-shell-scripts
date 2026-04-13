theme=$(gsettings get org.gnome.desktop.interface gtk-theme)
newTheme=$1
echo "Previous theme: $theme"
gsettings set org.gnome.desktop.interface gtk-theme ''
sleep 1
echo "New theme: $theme"
gsettings set org.gnome.desktop.interface gtk-theme $theme

