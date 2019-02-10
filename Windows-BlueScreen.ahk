#SingleInstance
#NoTrayIcon
RegRead, TaskbarWindow, HKEY_CURRENT_USER\Software\Windows-BlueScreen, WBSTaskbarWindow
if (%TaskbarWindow% == "0")
{
msgbox Testing
}
else
{



if(A_IsAdmin)
{
 Gui, Add, Button, x116 y150 w110 h40 , Enable bluescreen exploit

 Gui, Add, Button, x246 y150 w110 h40 , Disable bluescreen exploit

 Gui, Add, Button, x175 y200 w110 h40 , Restart computer

 Gui, Font, S20 CDefault, Arial

 Gui, Show, x248 y155 h377 w477, Force Windows Bluescreen v1.0

 Return



 ButtonEnablebluescreenexploit:
 
 RegWrite, REG_DWORD, HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters, CrashOnCtrlScroll, 1
 RegWrite, REG_DWORD, HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdhid\Parameters, CrashOnCtrlScroll, 1
 msgbox Done!
 msgbox You will need to restart to see the changes take effect. Click Restart computer to do so.
 msgbox Press and hold Right Ctrl and press Scroll Lock twice to use (hold Fn as well, depending on keyboard).
 return



 ButtonDisablebluescreenexploit:

 RegDelete, HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt\Parameters, CrashOnCtrlScroll
 RegDelete, HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\kbdhid\Parameters, CrashOnCtrlScroll
 msgbox Done!
 msgbox You will need to restart to see the changes take effect. Click Restart computer to do so.
 return

 ButtonRestartcomputer:
 Run, C:\WINDOWS\system32\shutdown.exe /r /t 0
 return

 GuiClose:
 ExitApp

}
else
{
 msgbox Administrator permissions are required. Right click the script and click "Run as administrator".
 ExitApp
}
}