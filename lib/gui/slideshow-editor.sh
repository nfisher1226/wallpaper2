export STMP=$(mktemp)
cat $SLIDESHOWDIR/$CURRENT_SLIDESHOW > $STMP

# Right click action
right_click_add (){
[ "$PTR_BTN" = "3" ] && echo $WP >> $STMP
}
export -f right_click_add

# Display this extra menuentry if the user sets "show slideshow" to
# true in the prefs dialog
create_slideshow_menuentry () {
cat << EOF
      <menuitem checkbox="true" use-underline="true"
        active="false" accel-key="0x45" accel-mods="4">
       <label>$(gettext 'Slideshow editor')</label>
       <action>if true show:SLIDESHOW_EDITOR</action>
       <action>if false hide:SLIDESHOW_EDITOR</action>
      </menuitem>
      <separator></separator>
EOF
}

# Hold the entire slideshow editor in this variable
create_slideshow_editor () {
cat << EOF
  <vbox visible="false">
   <hseparator space-expand="true" space-fill="true"></hseparator>
   <hbox>
    <button space-expand="false" space-fill="false"
      tooltip-text="$(gettext 'Add selection to current slideshow')">
     <input file stock="gtk-add"></input>
     <action function="insert">WP,STREE</action>
     <action>save:STREE</action>
     <action>sed -i 's:|::g' $STMP</action>
     <action>refresh:STREE</action>
     <action>cat $STMP > $SLIDESHOWDIR/\$CURRENT_SLIDESHOW</action>
    </button>
    <button space-expand="false" space-fill="false"
      tooltip-text="$(gettext 'Remove selection from current slideshow')">
     <input file icon="gtk-remove"></input>
     <action function="removeselected">STREE</action>
     <action>save:STREE</action>
     <action>sed -i 's:|::g' $STMP</action>
     <action>refresh:STREE</action>
     <action>cat $STMP > $SLIDESHOWDIR/\$CURRENT_SLIDESHOW</action>
    </button>
    <vseparator></vseparator>
    <button space-expand="false" space-fill="false"
      tooltip-text="$(gettext 'Play slideshow')">
     <input file stock="gtk-media-play"></input>
     <action>echo</action>
    </button>
    <button space-expand="false" space-fill="false"
      tooltip-text="$(gettext 'Pause slideshow')">
     <input file stock="gtk-media-pause"></input>
     <action>echo</action>
    </button>
    <vseparator></vseparator>
    <comboboxtext space-expand="false" space-fill="false">
     <input>ls $SLIDESHOWDIR</input>
     <variable>CURRENT_SLIDESHOW</variable>
     <action>cat $SLIDESHOWDIR/\$CURRENT_SLIDESHOW > $STMP</action>
     <action type="refresh">STREE</action>
    </comboboxtext>
    <button space-expand="false" space-fill="false"
      tooltip-text="$(gettext 'Create a new slideshow')">
     <input file stock="gtk-new"></input>
     <action>show:NEW_SLIDESHOW</action>
    </button>
    <entry visible="false">
     <variable>NEW_SLIDESHOW</variable>
     <action signal="activate">touch $SLIDESHOWDIR/\$NEW_SLIDESHOW</action>
     <action signal="activate">refresh:CURRENT_SLIDESHOW</action>
     <action signal="activate">hide:NEW_SLIDESHOW</action>
    </entry>
    <vseparator space-expand="false" space-fill="false"></vseparator>
    <hbox space-expand="true" space-fill="true">
     <text>
      <label>" "</label>
     </text>
    </hbox>
   </hbox>
   <tree selected-row="0" selection-mode="1"
     tooltip-text="$(gettext 'Add items to the list that you wish to play in a slideshow')"
     exported-column="0" column-type="string" column-visible="true">
    <label>Images</label>
    <height>250</height>
    <input file>$STMP</input>
    <output file>$STMP</output>
    <variable>STREE</variable>
    <action signal="changed">refresh_slideshow_preview</action>
    <action signal="changed" type="refresh">CURRENTIMG</action>
   </tree>
   <variable>SLIDESHOW_EDITOR</variable>
  </vbox>
EOF
}
