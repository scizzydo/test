DeadCount() {
	dead := 0
	ImageSearch, FoundX, FoundY, 134, 84, 1155, 140, *20 *TransWhite image.png
	if ErrorLevel = 0
	{
		PixelGetColor, first, FoundX + 55, FoundY + 29
		If (first = 0x393939){
			dead++
		}
		PixelGetColor, second, FoundX + 225, FoundY + 29
		If (second = 0x393939){
			dead++
		}
		PixelGetColor, third, FoundX + 395, FoundY + 29
		If (third = 0x393939){
			dead++
		}
		PixelGetColor, fourth, FoundX + 565, FoundY + 29
		If (fourth = 0x393939){
			dead++
		}
		PixelGetColor, fifth, FoundX + 735, FoundY + 29
		If (fifth = 0x393939){
			dead++
		}
		PixelGetColor, sixth, FoundX + 905, FoundY + 29
		If (sixth = 0x393939){
			dead++
		}
	}
	return dead
}

LowCount() {
	low := 0
	ImageSearch, FoundX, FoundY, 134, 84, 1155, 140, *20 *TransWhite image.png
	if ErrorLevel = 0
	{
		PixelGetColor, first, FoundX + 108, FoundY + 29
		If (first = 0x454545){
			low++
			firstlocX := FoundX + 108
			firstlocY := FoundY + 29
		}
		PixelGetColor, second, FoundX + 278, FoundY + 29
		If (second = 0x454545){
			low++
			secondlocX := FoundX + 278
			secondlocY := FoundY + 29
		}
		PixelGetColor, third, FoundX + 448, FoundY + 29
		If (third = 0x454545){
			low++
			thirdlocX := FoundX + 448
			thirdlocY := FoundY + 29
		}
		PixelGetColor, fourth, FoundX + 618, FoundY + 29
		If (fourth = 0x454545){
			;low := low + 7
			low++
			fourthlocX := FoundX + 618
			fourthlocY := FoundY + 29
		}
		PixelGetColor, fifth, FoundX + 788, FoundY + 29
		If (fifth = 0x454545){
			low++
			fifthlocX := FoundX + 788
			fifthlocY := FoundY + 29
		}
		PixelGetColor, sixth, FoundX + 958, FoundY + 29
		If (sixth = 0x454545){
			low++
			sixthlocX := FoundX + 958
			sixthlocY := FoundY + 29
		}
	}
	return low
}

HyperPot(x, y){
	ImageSearch, PotionX, PotionY, InventoryLocX, InventoryLocY, InventoryLocX + 191, InventoryLocY + 325, *70 hyperpot.png
	if ErrorLevel = 0
	{
		DoubleClick(PotionX, PotionY)
		Sleep, 100
		Click(x, y)
		Sleep % rand(10, 60)			
	}
	return
}

LeftHook(x, y) {
	chance := rand(1, 5)
	Loop 
	{
		ToolTip, Operations: %count%      |  Performing: Hook (left), 0, 0
		if (chance = 1){
			PixelGetColor, color, x + 6, y + 7
			;MsgBox, color is %color%
			If (color != 0x4DFF26 && color != 0x48FF25 && color != 0x53FF29){
				Send {space}
				count++
				Sleep % rand(10, 60)
				break
			}else{
				count++
				Sleep % rand(10, 60)
				continue
			}
		}
		if (chance != 1){
			PixelGetColor, color, x + 29, y + 7
			;MsgBox, color is %color%
			If (color != 0x13CBFF){
				Send {space}
				count++
				Sleep % rand(10, 60)
				break
			}else{
				count++
				Sleep % rand(10, 60)
				continue
			}
		}
	}
	return
}

RightHook(x, y) {
	chance := rand(1, 5)
	Loop
	{
		ToolTip, Operations: %count%      |  Performing: Hook (right), 0, 0
		if (chance = 1){
			PixelGetColor, color, x + 53, y + 7
			;MsgBox, color is %color%
			If (color != 0x4DFF26 && color != 0x48FF25 && color != 0x53FF29){
				Send {space}
				count++
				Sleep % rand(10, 60)
				break
			}else{
				count++
				Sleep % rand(10, 60)
				continue
			}
		}
		if (chance != 1){
			PixelGetColor, color, x + 29, y + 7
			;MsgBox, color is %color%`nchance is %chance%
			If (color != 0x13CBFF){
				Send {space}
				count++
				Sleep % rand(10, 60)
				break
			}else{
				count++
				Sleep % rand(10, 60)
				continue
			}
		}
	}
	return
}

rand(x,y){
	Random, value, %x%, %y%
	Return value
}

Click(x,y){
	MouseMove, x, y
	Click, x, y
	Sleep % rand(10, 60)
	return
}
DoubleClick(x,y){
	MouseMove, x, y
	Click, x, y, 2
	Sleep % rand(10, 60)
	return
}

CaptureCheck(){
	Loop, Files, Pokemon\*.png
	{
		ImageSearch, FoundX, FoundY, 325, 333, 540, 365, *50 Pokemon\%A_LoopFileName%
		if ErrorLevel = 0
		{
			capture()
			break
		}
	}
	return
}

SanityCaptureCheck(){
	Loop, Files, Pokemon\*.png
	{
		ImageSearch, FoundX, FoundY, 325, 333, 540, 365, *50 Pokemon\%A_LoopFileName%
		if ErrorLevel = 0
		{
			Return True
			break
		}
	}
	Return False
}

capture() {
	Loop, Files, Capture\*.png
	{
		ImageSearch, FoundX, FoundY, 330, 620, 635, 725, *50 Capture\%A_LoopFileName%
		if ErrorLevel = 0
		{
			Sleep, 350
			Click(FoundX,  FoundY)
			break
		}
	}
	Loop, Files, Balls\*.png
	{
		ImageSearch, FoundX, FoundY, 330, 620, 635, 725, *50 Balls\%A_LoopFileName%
		if ErrorLevel = 0
		{
			Sleep, 350
			MouseClick, left,  FoundX,  FoundY + 64
			break
		}
	}
	;Sleep % rand(10, 60)
	return
}

fight(num){
	ImageSearch, FoundX, FoundY, 330, 620, 635, 725, *70 Moves\fight.png
	if ErrorLevel = 0
	{
		Click(FoundX,  FoundY)
	}
	ImageSearch, FoundX, FoundY, 330, 620, 635, 725, *70 Moves\fighthover.png
	if ErrorLevel = 0
	{
		Click(FoundX,  FoundY)
	}
	ImageSearch, BackX, BackY, 330, 620, 1000, 750, *70 back.png
	if ErrorLevel = 0
	{
		ImageSearch, AbilitiesX, AbilitiesY, 330, 620, 1000, 750, *220 *TransWhite 4abilities.png
		if ErrorLevel = 0
		{
			If (num = 1) {
				Click(AbilitiesX + 75, AbilitiesY + 25)
			}
			If (num = 2) {
				Click(AbilitiesX + 225, AbilitiesY + 25)
			}
			If (num = 3) {
				Click(AbilitiesX + 75, AbilitiesY + 75)
			}
			If (num = 4) {
				Click(AbilitiesX + 225, AbilitiesY + 75)
			}
		}
	}
	Sleep % rand(10, 60)
	return
}

AlternativeCombat(){
	Loop, Files, Combat\4\*.png
	{
		ImageSearch, FoundX, FoundY, 325, 333, 555, 410, *20 Combat\4\%A_LoopFileName%
		if ErrorLevel = 0
		{
			fight(4)
			break
		}
	}
	Loop, Files, Combat\3\*.png
	{
		ImageSearch, FoundX, FoundY, 325, 333, 555, 410, *20 Combat\3\%A_LoopFileName%
		if ErrorLevel = 0
		{
			fight(3)
			break
		}
	}
	Loop, Files, Combat\2\*.png
	{
		ImageSearch, FoundX, FoundY, 325, 333, 555, 410, *20 Combat\2\%A_LoopFileName%
		if ErrorLevel = 0
		{
			fight(2)
			break
		}
	}
	Loop, Files, Combat\1\*.png
	{
		ImageSearch, FoundX, FoundY, 325, 333, 555, 410, *20 Combat\1\%A_LoopFileName%
		if ErrorLevel = 0
		{
			fight(1)
			break
		}
	}
	;Sleep % rand(10, 60)
	return
}

SS(){
	file := A_ScriptDir "\Pokemon\" A_Now ".png"
	file2 := A_ScriptDir "\Chats\" A_Now ".png"
	screen :=  "328|340|71|13" ; X|Y|W|H
	screen2 := "865|793|384|150"
	Screenshot(file,screen)
	Screenshot(file2,screen2)
	Email(file "|" file2, EmailTo, EmailFrom, EmailPassword)
	return
}

SS2(){
	file := A_ScriptDir "\Caught\" A_Now ".png"
	file2 := A_ScriptDir "\Chats\" A_Now ".png"
	screen :=  "317|307|658|436" ; X|Y|W|H
	screen2 := "865|793|384|150"
	Screenshot(file,screen)
	Screenshot(file2,screen2)
	Email(file "|" file2, EmailTo, EmailFrom, EmailPassword)
	return
}

Screenshot(outfile, screen) ; Save screenshot from defined coordinates.
{
	pToken := Gdip_Startup()
	raster := 0x40000000 + 0x00CC0020

	pBitmap := Gdip_BitmapFromScreen(screen,raster)

	Gdip_SaveBitmapToFile(pBitmap, outfile, 100)
	Gdip_DisposeImage(pBitmap)
	Gdip_Shutdown(pToken)
}

SanityRestart(){
	WinGetActiveTitle, Title
	if (title = "Pokemon Planet - Free Pokemon MMORPG - Google Chrome")
	{
		Return True
	}
	ImageSearch, AFKX, AFKY, 450, 450, 835, 575, *70 AFK.PNG
	if ErrorLevel = 0
	{
		Return True
	}
	ImageSearch, FoundX, FoundY, 315, 305, 980, 750, *70 refresh.png
	if ErrorLevel = 0
	{
		Return True
	}
	ImageSearch, FoundX, FoundY, 315, 305, 980, 750, *70 connection.png
	if ErrorLevel = 0
	{
		Return True
	}
	ImageSearch, FoundX, FoundY, 315, 305, 980, 750, *70 cnc.png
	if ErrorLevel = 0
	{
		Return True
	}
	Return False
}

restart(){
	Loop
	{
		restartcheck := SanityRestart()
		if (restartcheck = 1){
			ImageSearch, RefreshX, RefreshY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *20 refreshbutton.png
			if ErrorLevel = 0
			{
				Click(RefreshX + 10, RefreshY + 10)
				Sleep, 500
			}
			continue
		}
		ImageSearch, CommX, CommY, 315, 305, 980, 750, *20 communicating.PNG
		if ErrorLevel = 0
		{
			Sleep 250
			continue
		}
		ImageSearch, CommX, CommY, 315, 305, 980, 750, *20 loading.PNG
		if ErrorLevel = 0
		{
			Sleep 250
			continue
		}
		ImageSearch, BlankX, BlankY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *20 blank.png
		if ErrorLevel = 0
		{
			Sleep 250
			continue
		}
		ImageSearch, ChatX, ChatY, 866, 760, 1190, 807, *20 chatsnr.PNG
		If ErrorLevel = 0
		{
			DoubleClick(ChatX + 295, ChatY + 9)
			Sleep, 100
			continue
		}
		ImageSearch, ChatX, ChatY, 866, 760, 1190, 807, *20 chatsnr2.PNG
		If ErrorLevel = 0
		{
			DoubleClick(ChatX + 290, ChatY + 8)
			Sleep, 100
			continue
		}
		ImageSearch, FoundX, FoundY, 1020, 750, 1180, 810, *20 clanselected.png
		If ErrorLevel > 0
		{
			continue
		}
		ImageSearch, EncounterX, EncounterY, 315, 305, 980, 750, *70 *TransWhite encounter.png
		if ErrorLevel = 0
		{
			if (Walk = 0 && Surf = 0)
			{
				Fishing := 1
			}
			if (Walk = 0 && Surf = 1)
			{
				Surfing := 1
			}
		}
		Send {enter}/disableplayers{enter}
		Sleep, 100
		if (Walk = 0 && Surf = 0)
		{
			Send {f}
		}
		if (Surf = 1)
		{
			Send {%move% down}
			Sleep % rand(100, 150)
			Send {%move% up}
			Sleep % rand(10,60)
			Send {space}
		}
		if (Walk = 1)
		{
			Send {b}
		}
		break
	}
	return
}

Email(var, p_to, p_from, p_password){
	pmsg 							:= ComObjCreate("CDO.Message")
	pmsg.From 						:= p_from
	pmsg.To 						:= p_to
	pmsg.BCC 						:= ""   									; Blind Carbon Copy, Invisible for all, same syntax as CC
	pmsg.CC 						:= ""										; Somebody@somewhere.com, Other-somebody@somewhere.com
	pmsg.Subject 					:= "New Pokemon Caught (" A_Now "-" A_ComputerName ")"
	pmsg.TextBody 					:= "See Attachment."
	;pmsg.HtmlBody 					:= "<html><head><title>New Pokemon Caught</title></head><body>See Attachment.</body></html>"
	sAttach   						:= var 										; can add multiple attachments, the delimiter is |
	fields 							:= Object()
	fields.smtpserver   			:= "smtp.gmail.com" 						; specify your SMTP server
	fields.smtpserverport   		:= 465 										; 25
	fields.smtpusessl      			:= True 									; False
	fields.sendusing     			:= 2   										; cdoSendUsingPort
	fields.smtpauthenticate 		:= 1   										; cdoBasic
	fields.sendusername 			:= p_from
	fields.sendpassword 			:= p_password
	fields.smtpconnectiontimeout	:= 60
	schema 							:= "http://schemas.microsoft.com/cdo/configuration/"
	pfld 							:=  pmsg.Configuration.Fields
	For field,value in fields
		pfld.Item(schema . field) 	:= value
	pfld.Update()
	
	Loop, Parse, sAttach, |, %A_Space%%A_Tab%
		pmsg.AddAttachment(A_LoopField)
	
	pmsg.Send()
	return
}	

Email2(p_to, p_from, p_password){
	pmsg 							:= ComObjCreate("CDO.Message")
	pmsg.From 						:= p_from
	pmsg.To 						:= p_to
	pmsg.BCC 						:= ""   									; Blind Carbon Copy, Invisible for all, same syntax as CC
	pmsg.CC 						:= ""										; Somebody@somewhere.com, Other-somebody@somewhere.com
	pmsg.Subject 					:= "Sent to Pokecenter (" A_Now "-" A_ComputerName ")"
	pmsg.TextBody 					:= "Team was wiped out."
	;pmsg.HtmlBody 					:= "<html><head><title>New Pokemon Caught</title></head><body>See Attachment.</body></html>"
	;sAttach   						:= var 										; can add multiple attachments, the delimiter is |
	fields 							:= Object()
	fields.smtpserver   			:= "smtp.gmail.com" 						; specify your SMTP server
	fields.smtpserverport   		:= 465 										; 25
	fields.smtpusessl      			:= True 									; False
	fields.sendusing     			:= 2   										; cdoSendUsingPort
	fields.smtpauthenticate 		:= 1   										; cdoBasic
	fields.sendusername 			:= p_from
	fields.sendpassword 			:= p_password
	fields.smtpconnectiontimeout	:= 60
	schema 							:= "http://schemas.microsoft.com/cdo/configuration/"
	pfld 							:=  pmsg.Configuration.Fields
	For field,value in fields
		pfld.Item(schema . field) 	:= value
	pfld.Update()
	
	pmsg.Send()
	return
}