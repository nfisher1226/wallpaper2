# Create the prefs dialog
export PTMPFILE=$(mktemp)
cat >> $PTMPFILE << EOF
<window title="$PROGNAME-$VERSION: $(gettext 'preferences')" icon="gtk-preferences" window-position="2">
 <vbox>
  <hbox>
   <text space-expand="false">
    <label>$(gettext 'Preview height (pixels)')</label>
   </text>
   <hbox space-expand="true" space-fill="true">
    <text><label>" "</label></text>
   </hbox>
   <comboboxtext space-expand="false" space-fill="false">
    <variable>HEIGHT</variable>
    <default>$HEIGHT</default>
    <item>150</item>
    <item>200</item>
    <item>250</item>
    <item>300</item>
    <item>400</item>
    <item>500</item>
   </comboboxtext>
  </hbox>
  <hbox>
   <text space-expand="false">
    <label>$(gettext 'Preview background')</label>
   </text>
   <hbox space-expand="true" space-fill="true">
    <text><label>" "</label></text>
   </hbox>
   <comboboxtext space-expand="false" space-fill="false">
    <variable>PREVIEW_BACKGROUND</variable>
    <default>$PREVIEW_BACKGROUND</default>
    <item>Black</item>
    <item>White</item>
    <item>Pattern</item>
    <item>none</item>
   </comboboxtext>
  </hbox>
  <hbox>
   <text space-expand="false">
    <label>$(gettext 'Enable slideshow editor')</label>
   </text>
   <hbox space-expand="true" space-fill="true">
    <text><label>" "</label></text>
   </hbox>
   <checkbox>
    <variable>SHOW_SLIDESHOW_EDITOR</variable>
    <default>$SHOW_SLIDESHOW_EDITOR</default>
    <label>""</label>
   </checkbox>
  </hbox>
  <hbox>
   <button>
    <label>$(gettext 'Close')</label>
    <input file stock="gtk-close"></input>
   </button>
  </hbox>
 </vbox>
</window>
EOF
