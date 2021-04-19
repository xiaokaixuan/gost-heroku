Const Title = "Gost", errorLog = "client.log"
Const CommandLine = "gost.exe -L=:1080 -F=ss+mwss://chacha20:ss123456@appname.herokuapp.com:443"

Class Application
	Private WS
	Private SF
	Private SA
	Private Cimv2
	
	Private Sub Class_Initialize
	Set WS = CreateObject("WScript.Shell")
	Set SF = CreateObject("Scripting.FileSystemObject")
	Set SA = CreateObject("Shell.Application")
	Set Cimv2 = GetObject("winmgmts:\\.\root\cimv2")
	End Sub
	
	Private Sub Class_Terminate
	Set WS = NoThing
	Set SF = NoThing
	Set SA = NoThing
	Set Cimv2 = NoThing
	End Sub
	
	Public Sub HideExecute
	If LCase(Right(WScript.FullName, 11)) = "wscript.exe" Then
		SA.ShellExecute "cscript.exe", """" & WScript.ScriptFullName & """", Null, "runas", 0
		WScript.Quit
	End If
	End Sub
	
	Public Sub CheckRunning
	Set Processes = Cimv2.ExecQuery("Select ProcessId From Win32_Process Where CommandLine=""" & CommandLine & """")
	Result = Confirm(Processes.Count > 0)
	If Result = vbNo Then
		WScript.Quit
	Elseif Processes.Count > 0 Then
		For Each Process in Processes: Process.Terminate 0: Next
		WScript.Quit
	End If
	End Sub
	
	Public Sub RunCommand
	Set oExec = WS.Exec(CommandLine)
	If Len(errorLog) <= 0 Then
		WScript.Quit
	End If
	Set fsm = SF.OpenTextFile(".\\" & errorLog, 2, true)
	Do While Not oExec.StdErr.AtEndOfStream
		fsm.WriteLine oExec.StdErr.ReadLine
		WScript.Sleep 200
	Loop
	fsm.Close
	End Sub
	
	Private Function Confirm(isRunning)
	If isRunning Then
		Confirm = MsgBox(Title & " is running, do you want to stop it ?", vbSystemModal or vbYesNo or vbExclamation, "Question")
	Else
		Confirm = MsgBox(Title & " is not running, do you want to start it ?", vbSystemModal or vbYesNo or vbQuestion, "Question")
	End If
	End Function
End Class

Set App = new Application
App.HideExecute
App.CheckRunning
App.RunCommand

