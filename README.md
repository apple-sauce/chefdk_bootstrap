# chefdk_bootstrap

## Setup your laptop for Chef development in minutes

Run one simple command to easily set up your Windows or Mac machine
for Chef cookbook development in about **20 minutes**.

## Before You Begin
* If you are on a Windows machine, you will need at least PowerShell 3.0. We recommend [PowerShell 5.0](https://www.microsoft.com/en-us/download/details.aspx?id=50395) because it supports [Microsoft DSC](https://msdn.microsoft.com/en-us/PowerShell/DSC/overview).

## Windows Quickstart

Copy the PowerShell command below and paste them into a **PowerShell Admin** console. This will download and run the [bootstrap](https://raw.githubusercontent.com/apple-sauce/chefdk_bootstrap/master/bootstrap.ps1)
script on your workstation.

```PowerShell
$ScriptFromGithHub = Invoke-WebRequest https://raw.githubusercontent.com/apple-sauce/chefdk_bootstrap/master/bootstrap.ps1 
Invoke-Expression $($ScriptFromGithHub.Content)
```

## What does it do?
This cookbook installs the following programs:
  Tools               Version
* ChefDK              3.0.36
* Chocolatey:         latest
* ConEmu:             latest
* Visual Studio Code: latest
* Vagrant:            1.9.5
* Virtual Box:        5.1.22

----
