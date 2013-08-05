set_wallpaper () {
if [ "$1" = "-clear" ];then
 grep -v '<backdrop' $HOME/.config/rox.sourceforge.net/ROX-Filer/pb_default > $HOME/.config/wallpaper/pb
 mv -f $HOME/.config/wallpaper/pb $HOME/.config/rox.sourceforge.net/ROX-Filer/pb_default
 rox -p=default
 echo "[none]" > $HOME/.config/wallpaper/bg_img
 exit
fi

MODE="`cat $HOME/.config/wallpaper/backgroundmode`"
[ "$MODE" = "" ] && MODE="Scale"
[ "$MODE" = "Centred" ] && MODE="Centre"
[ "$MODE" = "Scaled" ] && MODE="Scale"

FILE="$1"
[ "$FILE" = "" ] && FILE="`cat $HOME/.config/rox.sourceforge.net/ROX-Filer/pb_default | grep '<backdrop' | cut -f 2 -d '>' | cut -f 1 -d '<'`"

rox --RPC << EOF
<?xml version="1.0"?>
<env:Envelope xmlns:env="http://www.w3.org/2001/12/soap-envelope">
 <env:Body xmlns="http://rox.sourceforge.net/SOAP/ROX-Filer">
  <SetBackdrop>
   <Filename>$FILE</Filename>
   <Style>$MODE</Style>
  </SetBackdrop>
 </env:Body>
</env:Envelope>

EOF
}
