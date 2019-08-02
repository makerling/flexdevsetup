# flexdevsetup
One-click script for setting up a dev environment for FLEx on Windows 10. Follows instructions from https://github.com/sillsdev/FwDocumentation/wiki/Contributing-to-FieldWorks-Development

Instructions: 
- Clone on fresh Windows 10 machine (not tested on other version yet)
- Run setup.bat batch script (right-click Run as administrator)
  - If Windows 10 blocks this from running, you will need to disable SmartScreen (click 'more info' click 'run anyways')

The script does the following:
- leverages the boxstarter framework to complete the install without interruption, it's recommended to do a reboot after it is completed
- leverages the chocolatey repository to silently install git and chrome
- leverages the chocolatey repository to install VS Studio 2017 with the recommended Workloads and components with no interaction needed from user, progress screen is shown so you know what's going on during the 4GB download
- cleans up/removes unecessary applications that come with Windows out of the box
- adds a few helpful tweaks (unhide system files, show file extensions, etc)

The script might timeout with a flaky internet connection. It is safe to rerun it multiple times. 
