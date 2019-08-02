@echo off

REM Detecting Admin permissions
REM Ref: https://stackoverflow.com/questions/4051883/batch-script-how-to-check-for-admin-rights#11995662
echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
  echo Success: Administrative permissions confirmed, continuing...
  echo ""
  echo Downloading latest version of Boxstarter install script, running shortly...

  REM need to run as admin, Windows 10 might block this from running, need to disable SmartScreen (click 'more info' click 'run anyways')
  REM installs Boxstarter and Chocolatey from web - ensures latest version is always installed
  powershell -NoProfile -ExecutionPolicy bypass -command ". { iwr -useb https://boxstarter.org/bootstrapper.ps1 } | iex; Get-Boxstarter -Force"

  echo ""
  echo updating environment to recognize boxstarter install
  REM syntax for cmd: https://github.com/chocolatey/choco/issues/1461
  REM reference: https://chocolatey.org/docs/helpers-update-session-environment
  call refreshenv.cmd

  REM installing/running Boxstarter package from local powershell script file see: https://boxstarter.org/InstallingPackages
  powershell -NoProfile -ExecutionPolicy bypass -command "Install-BoxstarterPackage -DisableReboots -PackageName "%~dp0%boxstartercommands.ps1"" 

  REM cloning fwmeta and running initrepo script
  set workingdirectory=%~dp0
  start /b cmd /c "%ProgramFiles%\Git\git-bash.exe" %workingdirectory%clonefieldworks.sh

  echo Script has completed, you can close the console and restart your machine.
) else (
        echo Failure: Current permissions inadequate, close terminal and restart script as admin.
    )
PAUSE
