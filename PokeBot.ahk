#NoEnv
#Persistent
#SingleInstance force
ListLines Off
Process, Priority, , H
SetBatchLines, -1
SetKeyDelay, -1 ;this might speed up the script
SetWorkingDir %A_ScriptDir%
#Include gdip.ahk
#Include functions.ahk

CoordMode, Pixel, Window
CoordMode, Mouse, Window

Global moves := ["a", "d"]
Global count := 0
Global Walk := 0
Global Surf := 0
Global FishX := 0
Global FishY := 0
Global Fishing := 0
Global Surfing := 0
Global firstlocX := 0
Global firstlocY := 0
Global secondlocX := 0
Global secondlocY := 0
Global thirdlocX := 0
Global thirdlocY := 0
Global fourthlocX := 0
Global fourthlocY := 0
Global fifthlocX := 0
Global fifthlocY := 0
Global sixthlocX := 0
Global sixthlocY := 0
Global InventoryLocX
Global InventoryLocY
Global LastMsg := 0
Global EmailTo
Global EmailFrom
Global EmailPassword
Global iniloc := A_AppData "\NerderBot\config.ini"
Global msg := 0
MinTimer := rand(1,15)

if FileExist(iniloc)
{
	IniRead, EmailTo, %iniloc%, Email, To
	IniRead, EmailFrom, %iniloc%, Email, From
	IniRead, EmailPassword, %iniloc%, Email, Password
}else{
	FileCreateDir, %A_AppData%\NerderBot
	FileAppend, [Email]`nFrom=""`nPassword=""`nTo="", %iniloc%
	IniRead, EmailTo, %iniloc%, Email, To
	IniRead, EmailFrom, %iniloc%, Email, From
	IniRead, EmailPassword, %iniloc%, Email, Password
}

if (EmailTo = ""){
	InputBox, TempTo, Email Configuration, Email you want to send to:
	if ErrorLevel
		MsgBox, CANCEL was pressed.
	else
		IniWrite, "%TempTo%", %iniloc%, Email, To
		IniRead, EmailTo, %iniloc%, Email, To
}
if (EmailFrom = ""){
	InputBox, TempFrom, Email Configuration, Email you want to send from (requires gmail):
	if ErrorLevel
		MsgBox, CANCEL was pressed.
	else
		IniWrite, "%TempFrom%", %iniloc%, Email, From
		IniRead, EmailFrom, %iniloc%, Email, From
}
if (EmailPassword = ""){
	InputBox, TempPass, Email Configuration, Email account password:, HIDE
	if ErrorLevel
		MsgBox, CANCEL was pressed.
	else
		IniWrite, "%TempPass%", %iniloc%, Email, Password
		IniRead, EmailPassword, %iniloc%, Email, Password
}

F1::
	State := 0
	index := 0
	Loop
	{
		count++
		ToolTip, Operations: %count%     |  Performing: Main Loop, 0, 0
		move := moves[index]
		ImageSearch, FoundX, FoundY, 525, 200, 770, 380, *40 nurse.png
		if ErrorLevel = 0
		{
			Email2(EmailTo, EmailFrom, EmailPassword)
			ExitApp
			Return
		}
		ImageSearch, FoundX, FoundY, 390, 740, 530, 975, *40 TS.png
		if ErrorLevel = 0
		{
			Email2(EmailTo, EmailFrom, EmailPassword)
			ExitApp
			Return
		}
		WinGetActiveTitle, Title
		if (title = "Pokemon Planet - Free Pokemon MMORPG - Google Chrome")
		{
			ToolTip, Operations: %count%      |  Performing: Login Screen, 0, 0
			ImageSearch, PlayX, PlayY, 483, 896, 795, 962, *20 playnow.png
			if ErrorLevel = 0
			{
				MouseClick, left, PlayX, PlayY
				Sleep, 2000
				ImageSearch, FoundX, FoundY, 443, 539, 672, 590, *20 Login.png
				if ErrorLevel = 0
				{
					MouseClick, left, FoundX, FoundY
					Sleep, 3000
				}
				if (title != "pokemon-planet.com/gameFullscreen.php - Google Chrome")
				{
					Run, %comspec% /c "start chrome.exe --new-tab http://pokemon-planet.com/gameFullscreen.php"
					Sleep, 500
					Send, ^{1}
					Sleep, 500
					Send, ^{w}
					Sleep, 1000
				}
			}
			restart()
			continue
		}
		ImageSearch, AFKX, AFKY, 450, 450, 835, 575, *70 AFK.PNG
		if ErrorLevel = 0
		{
			ToolTip, Operations: %count%      |  Performing: AFK timeout reset, 0, 0
			restart()
			continue
		}
		ImageSearch, FoundX, FoundY, 315, 305, 980, 750, *70 cnc.png
		if ErrorLevel = 0
		{
			ToolTip, Operations: %count%      |  Performing: Could not connect, 0, 0
			restart()
			continue
		}
		ImageSearch, FoundX, FoundY, 315, 305, 980, 750, *70 refresh.png
		if ErrorLevel = 0
		{
			ToolTip, Operations: %count%      |  Performing: Speedhack reset, 0, 0
			restart()
			continue
		}
		ImageSearch, FoundX, FoundY, 315, 305, 980, 750, *70 connection.png
		if ErrorLevel = 0
		{
			ToolTip, Operations: %count%      |  Performing: Connection Lost reset, 0, 0
			restart()
			continue
		}
		ImageSearch, FoundX, FoundY, 522, 460, 768, 587, *20 trade.png
		if ErrorLevel = 0
		{
			ToolTip, Operations: %count%      |  Performing: Close Trade, 0, 0
			Sleep, 1000
			MouseClick, left,  FoundX + 200,  FoundY + 15
			Sleep % rand(10, 60)
			continue
		}
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *20 summary.png
		if ErrorLevel = 0
		{
			ToolTip, Operations: %count%      |  Performing: Close Summary, 0, 0
			Sleep, 100
			MouseClick, left,  FoundX + 370,  FoundY + 12
			Sleep % rand(10, 60)
			continue
		}
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *20 evolving.png
		if ErrorLevel = 0
		{
			ToolTip, Operations: %count%      |  Performing: Evolve Poke, 0, 0
			MouseClick, left,  FoundX,  FoundY
			Sleep % rand(10, 60)
			continue
		}
		ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *20 abilitylearn.png
		if ErrorLevel = 0
		{
			ToolTip, Operations: %count%      |  Performing: Ignore Ability, 0, 0
			MouseClick, left,  FoundX + 283,  FoundY + 7
			Sleep % rand(10, 60)
			continue
		}
		Loop {
			ToolTip, Operations: %count%      |  Performing: Combat Loop, 0, 0
			ImageSearch, EncounterX, EncounterY, 315, 305, 980, 750, *70 *TransWhite encounter.png
			if ErrorLevel = 0
			{
				ImageSearch, CaughtX, CaughtY, 327, 619, 960, 685, *20 congrats.PNG
				if ErrorLevel = 0
				{
					Sleep % rand(10, 60)
					SS2()
					Loop {
						ImageSearch, EncounterX, EncounterY, 315, 305, 980, 750, *70 *TransWhite encounter.png
						if ErrorLevel = 0
						{
							Sleep % rand(10, 60)
							continue
						}else{
							Sleep % rand(10, 60)
							continue 2
						}
					}					
				}
				Sleep % rand(10, 60)
				ToolTip, Operations: %count%      |  Performing: Combat, 0, 0
				totaldead := DeadCount()
				ImageSearch, FoundX, FoundY, 850, 545, 885, 580, *20 deadpoke.png
				if ErrorLevel = 0
				{
					ImageSearch, FoundX, FoundY, 330, 620, 635, 725, *20 Pokemon.png
					if ErrorLevel = 0
					{
						MouseClick, left,  FoundX,  FoundY
						Sleep, 350
					}
					ImageSearch, FoundX, FoundY, 330, 620, 635, 725, *20 Pokemonhover.png
					if ErrorLevel = 0
					{
						MouseClick, left,  FoundX,  FoundY
						Sleep, 350
					}
					If (totaldead = 1){
						MouseClick, left, 423, 692
						Sleep, 350
					}
					If (totaldead = 2){
						MouseClick, left, 562, 647
						Sleep, 350
					}
					If (totaldead = 3){
						MouseClick, left, 571, 695
						Sleep, 350
					}
					If (totaldead = 4){
						MouseClick, left, 712, 648
						Sleep, 350
					}
					If (totaldead = 5){
						MouseClick, left, 708, 695
						Sleep, 350
					}
					continue
				}
				If (totaldead = 5){
					capture()
					count++
					Sleep % rand(10, 60)
					continue
				}
				ImageSearch, BackX, BackY, 330, 620, 1000, 750, *70 back.png
				if ErrorLevel = 0
				{
					if (SanityCaptureCheck() = 0){
						ImageSearch, FoundX, FoundY, 325, 335, 555, 410, *20 captured.png
						if ErrorLevel = 0
						{
							CaptureCheck()
							AlternativeCombat()
							count++
							Sleep 350
							continue
						}else{
							SS()
							capture()
							count++
							Sleep 350
							continue
						}
					}
					if (SanityCaptureCheck() = 1){
						capture()
						Sleep 350
						continue
					}
				}
				ImageSearch, FoundX, FoundY, 330, 620, 635, 725, *70 Capture\bag.png
				if ErrorLevel = 0
				{
					if (SanityCaptureCheck() = 0){
						ImageSearch, FoundX, FoundY, 325, 335, 555, 410, *20 captured.png
						if ErrorLevel = 0
						{
							CaptureCheck()
							AlternativeCombat()
							count++
							Sleep 350
							continue
						}else{
							SS()
							capture()
							count++
							Sleep 350
							continue
						}
					}
					if (SanityCaptureCheck() = 1){
						capture()
						Sleep 350
						continue
					}
				}else{
					Sleep % rand(10, 60)
					continue
				}
			}
			break
		}
		ImageSearch, DeadX, DeadY, 134, 84, 1155, 140, *20 dead.png
		if ErrorLevel = 0
		{
			If (Walk = 0 && Surf = 0 && Fishing = 0) {
				Send {f down}
				Sleep, 10
				Send {f up}
				Sleep % rand(10, 60)
				Fishing := 1
			}
			ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *20 inventory.png
			if ErrorLevel = 0
			{
				InventoryLocX := FoundX
				InventoryLocY := FoundY
				ImageSearch, FRX, FRY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *100 failedrevive.png
				if ErrorLevel = 0
				{
					HyperPot(DeadX + 100, DeadY)
					Sleep, 100
					continue
				}
				ImageSearch, FRX, FRY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *100 failedrevive2.png
				if ErrorLevel = 0
				{
					HyperPot(DeadX + 100, DeadY)
					Sleep, 100
					continue
				}
				ImageSearch, ReviveX, ReviveY, FoundX, FoundY, FoundX + 191, FoundY + 325, *70 revive.png
				if ErrorLevel = 0
				{
					Sleep, 350
					DoubleClick(ReviveX, ReviveY)
					Sleep, 250
					Click(DeadX + 100, DeadY)
					continue
				}
			}else{
				Send {i down}
				Sleep, 10
				Send {i up}
			}
			Sleep % rand(10, 60)
			continue
		}
		ImageSearch, LowHPX, LowHPY, 134, 84, 1155, 140, *20 extremelylow.png
		if ErrorLevel = 0
		{
			If (Walk = 0 && Surf = 0 && Fishing = 0) {
				Send {f down}
				Sleep, 10
				Send {f up}
				Fishing := 1
			}
			ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *20 inventory.png
			if ErrorLevel = 0
			{
				InventoryLocX := FoundX
				, InventoryLocY := FoundY
				HyperPot(LowHPX, LowHPY)
				Sleep, 100
				continue
			}else{
				Send {i down}
				Sleep, 10
				Send {i up}
			}
			continue
		}
		;ImageSearch, FoundX, FoundY, 134, 84, 1155, 140, *20 *TransWhite image.png
		;if ErrorLevel = 0
		;{
			totallow := LowCount()
			While totallow > 2
			{
				ToolTip, Operations: %count%      |  Performing: 3+ Low heal, 0, 0
				if (SanityRestart() = 1){
					continue
				}else{
					If (Walk = 0 && Surf = 0 && Fishing = 0) {
						Send {f down}
						Sleep, 10
						Send {f up}
						Sleep % rand(10, 60)
						Fishing := 1
					}
					ImageSearch, FoundX, FoundY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *20 inventory.png
					if ErrorLevel = 0
					{
						InventoryLocX := FoundX
						, InventoryLocY := FoundY
						ImageSearch, FoundX, FoundY, 134, 84, 1155, 140, *20 *TransWhite image.png
						if ErrorLevel = 0
						{
							PixelGetColor, sixth, FoundX + 958, FoundY + 29
							If (sixth = 0x454545){
								HyperPot(sixthlocX, sixthlocY)
								Sleep, 100
								totallow := LowCount()
								continue
							}
							PixelGetColor, fifth, FoundX + 788, FoundY + 29
							If (fifth = 0x454545){
								HyperPot(fifthlocX, fifthlocY)
								Sleep, 100
								totallow := LowCount()
								continue
							}
							PixelGetColor, fourth, FoundX + 618, FoundY + 29
							If (fourth = 0x454545){
								HyperPot(fourthlocX, fourthlocY)
								Sleep, 100
								totallow := LowCount()
								continue
							}
							PixelGetColor, third, FoundX + 448, FoundY + 29
							If (third = 0x454545){
								HyperPot(thirdlocX, thirdlocY)
								Sleep, 100
								totallow := LowCount()
								continue
							}
							PixelGetColor, second, FoundX + 278, FoundY + 29
							If (second = 0x454545){
								HyperPot(secondlocX, secondlocY)
								Sleep, 100
								totallow := LowCount()
								continue
							}
							PixelGetColor, first, FoundX + 108, FoundY + 29
							If (first = 0x454545){
								HyperPot(firstlocX, firstlocY)
								Sleep, 100
								totallow := LowCount()
								continue
							}
						}
						Sleep % rand(10, 60)
						totallow := LowCount()
						continue
					}else{
						Send {i down}
						Sleep, 10
						Send {i up}
						continue
					}
					Sleep % rand(10, 60)
					continue
				}
				break
			}
		;}
		ImageSearch, FoundX, FoundY, 855, 915, %A_ScreenWidth%, %A_ScreenHeight%, *70 failed.png
		if ErrorLevel = 0
		{
			Sleep, 100
			Send {f down}
			Sleep, 10
			Send {f up}
			Sleep % rand(10, 60)
			continue
		}
		ImageSearch, FoundX, FoundY, 855, 915, %A_ScreenWidth%, %A_ScreenHeight%, *70 failed2.png
		if ErrorLevel = 0
		{
			Sleep, 100
			Send {f down}
			Sleep, 10
			Send {f up}
			Sleep % rand(10, 60)
			continue
		}
		ImageSearch, FoundX, FoundY, 460, 540, 825, 585, *10 fishbar1.png
		if ErrorLevel = 0
		{
			RightHook(FoundX, FoundY)
			count++		
			continue
		}
		ImageSearch, FoundX, FoundY, 460, 540, 825, 585, *10 fishbar2.png
		if ErrorLevel = 0
		{
			LeftHook(FoundX, FoundY)
			count++
			continue
		}
		if (Fishing = 1){
			Send {f}
			Fishing := 0
			continue
		}
		ImageSearch, FoundX, FoundY, 855, 915, %A_ScreenWidth%, %A_ScreenHeight%, *70 fishstop.png
		if ErrorLevel = 0
		{
			Sleep, 100
			Send {f down}
			Sleep, 10
			Send {f up}
			Sleep % rand(10, 60)
			continue
		}
		if (Surfing = 1){
			Send {%move%}
			Sleep, 100
			Send {space}
			Surfing := 0
			continue
		}
		;if (A_Min = MinTimer) {
		;	ToolTip, Hourly AFK Active, 0, 0
		;	if (Walk = 0 && Surf = 0) {
		;		Fishing := 1
		;	}
		;	Sleep % rand(300000,600000)
		;}
		if (A_Hour = 01 && A_Min = 54) {
			ToolTip, Sleeping till about 7:45AM, 0, 0
			if (Walk = 0 && Surf = 0) {
				Fishing := 1
			}
			Sleep % rand(17000000,19000000)
		}
		if (Walk = 1){
			Send {%move% down}
			Sleep % rand(500, 700)
			Send {%move% up}
		}
		if (Surf = 1){
			Send {%move% down}
			Sleep % rand(500, 700)
			Send {%move% up}
		}
		Sleep % rand(10, 60)

		if index = 2 ;lengh if moves
			index = 1 
		else
			index++
	}
	
F2::
	Suspend
	Pause ,, 1
	if (State = 0) {
		State := 1
	}
	else {
		State := 0
	}
	Return

F3::
	if (Walk = 0 && Surf = 0) {
		Walk := 1
		return
	}
	if (Walk = 0 && Surf = 1) {
		Walk := 1
		Surf := 0
		return
	}
	if (Walk = 1) {
		Walk := 0
		return
	}
	
F4::
	if (Walk = 0 && Surf = 0) {
		Surf := 1
		return
	}
	if (Walk = 1 && Surf = 0) {
		Walk := 0
		Surf := 1
		return
	}
	if (Surf = 1) {
		Surf := 0
		return
	}
	
F5::
	Send {enter}/disableplayers{enter}
	return

F6::
	total := DeadCount()
	totallow := LowCount()
	Sanity := SanityCaptureCheck()
	MsgBox Total dead is: %total%`nTotal low is: %totallow%`nHourly AFK at: %MinTimer%`n%Sanity%
	return
	
F7::
	ImageSearch, RefreshX, RefreshY, 0, 0, %A_ScreenWidth%, %A_ScreenHeight%, *20 refreshbutton.png
	if ErrorLevel = 0
	{
		Click(RefreshX + 10, RefreshY + 10)
		Sleep, 500
	}
	restart()
	return
	
F8::
	Send {enter}/weeklyexp{enter}
	return
	
F11::
	SS()
	return
	
F12::
	Msg()
	return

Msg() {
	Send {enter}{$}Buying IV reset 1kk & Pokemon Box 1.5kk{!} Taking offers on Lvl 100 Naive Noivern{!}{enter}
	return
}

Esc::
ExitApp
Return