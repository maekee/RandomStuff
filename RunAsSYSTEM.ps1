#You can run PowerShell as NT AUTHORITY\SYSTEM with the help of Psexec
#Can be used both in an interactive prompt but also as a scheduled task

Start-Process -FilePath cmd.exe -Verb Runas -ArgumentList '/k C:\SysinternalsSuite\PsExec.exe -i -s powershell.exe'
