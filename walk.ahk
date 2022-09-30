#MaxThreadsPerHotkey, 2
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

arr := ["w", "a", "s", "d"]
looping = 0
 
#-:: ;<-- the hotkey with a $ so it won't re-trigger itself
 
 
looping := !looping ;<-- is the switch to tell the loop to start or stop
if (!looping)  ;<-- if the toggle is now off don't do the loop
   Return
loop ;<-- an infinite loop with a break condition inside
{   If (!looping) ;<-- the loop will break once the looping flag is flipped off
        Break
    #MaxThreadsPerHotkey, 2
    Random, oVar, 1, 4
    lKey := arr[oVar]					
 
    Random, rand, 5, 12 ; random number between 1 and 10
    Loop, %rand%
    {
	    sendinput % lKey   
    }
	Random, rand, 30000, 45000
    sleep, rand
}
Return
esc::ExitApp
