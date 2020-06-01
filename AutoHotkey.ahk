;KeyHistory ;Opens a window to show what keys have been pressed
LCtrl & Tab::AltTab ;make alt-tab menu work with ctrl (like mac)
return
LCtrl & j::AltTab ;make alt-tab menu work Ctrl + J
return
;LCtrl & m::AltTab ;make alt-tab menu work Ctrl + J
;return
;LCtrl & k::Send, {Tab} ; prevent pinkey hurt
;return
LCtrl & h::Send, {Tab} ; prevent pinkey hurt
return
LCtrl & `::Send, {LAlt down}``{LAlt up}{LCtrl up}
return
;LCtrl::LAlt

;LCtrl & Left::Home ; attempt to make ctrl-left/right work like mac (beginning of line and end of line)
;LCtrl & Right::End ; same as above ^

LCtrl & Right::Send, ^#{NumpadRight} ;Shows next desktop
return
LCtrl & Left::Send, ^#{NumpadLeft} ; shows previous desktop
return
