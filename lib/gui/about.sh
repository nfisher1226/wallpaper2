# Create a simple "About" dialog
ATMPFILE=$(mktemp)
cat >> $ATMPFILE << EOF
<window title="${PROGNAME}-${VERSION}: $(gettext 'about')" icon="gtk-about">
 <vbox>
  <notebook labels="$(gettext 'About|Credits')">
   <vbox>
    <text use-markup="true">
     <label>"<b>$(gettext 'A fast and lightweight wallpaper setter')</b>"</label>
    </text>
    <text>
     <label>"$(gettext 'Gwp is designed to allow the average user to set their desktop wallpaper with a minimum of fuss. It is designed to be fast, easy, and desktop independent while providing a simple and streamlined interface.')"</label>
    </text>
    <button>
     <label>https://bitbucket.org/nfisher1226/wallpaper2</label>
     <action>xdg-open https://bitbucket.org/nfisher1226/wallpaper2 &</action>
    </button>
   </vbox>
   <vbox>
    <hbox>
     <text space-expand="false">
      <label>$(gettext 'Author'): Nathan Fisher</label>
     </text>
     <hseparator space-expand="true"></hseparator>
    </hbox>
    <hbox>
     <text space-expand="false">
      <label>$(gettext 'License'): GPLv2</label>
     </text>
     <hseparator space-expand="true"></hseparator>
    </hbox>
    <hbox>
     <text space-expand="false">
      <label>Copyright(©) 2013 Nathan Fisher</label>
     </text>
     <hseparator space-expand="true"></hseparator>
    </hbox>
    <text><label>" "</label></text>
    <button>
     <label>http://www.gnu.org/licenses/gpl-2.0.txt</label>
     <action>xdg-open http://www.gnu.org/licenses/gpl-2.0.txt &</action>
    </button>
   </vbox>
  </notebook>
  <hbox>
   <button>
    <label>$(gettext 'Close')</label>
    <input file stock="gtk-close"></input>
   </button>
  </hbox>
 </vbox>
</window>
EOF
