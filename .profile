
# include Mycroft commands
source ~/.profile_mycroft
export QT_QPA_PLATFORMTHEME="qt5ct"
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"

# Lock firefox profile
#dir=$(pwd)
#cd /home/elliots/.dotfiles/firefox/lock_file
#touch yes.txt
#./lock_file.sh & disown
#cd $dir
