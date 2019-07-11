@echo off

REM ToDo: check if admin, else break, run boxstarter script from relative file rather than github text file (users an edit it easier)
echo "Downloading latest version of script, running shortly..."

REM need to run as admin, Windows 10 might block this from running, need to disable SmartScreen (click 'more info' click 'run anyways')
REM installs Boxstarter and Chocolatey from web - ensures latest version is always installed

powershell -NoProfile -ExecutionPolicy bypass -command ". { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force"

echo
echo "updating environment to recognize boxstarter install"
REM syntax for cmd: https://github.com/chocolatey/choco/issues/1461
REM reference: https://chocolatey.org/docs/helpers-update-session-environment

call refreshenv.cmd

REM installing/running Boxstarter package from github text file see: https://boxstarter.org/InstallingPackages

powershell -NoProfile -ExecutionPolicy bypass -command "Install-BoxstarterPackage -DisableReboots -PackageName boxstartercommands.ps1" 

echo "Script has completed, you can close the console and restart your machine."

PAUSE
