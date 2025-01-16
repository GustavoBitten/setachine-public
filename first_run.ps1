Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression

scoop install git
scoop bucket add extras
scoop install main/gh
scoop install extras/googlechrome
scoop install extras/github
scoop install extras/dbeaver
scoop install extras/lens
scoop install extras/vscode
scoop install extras/teamviewer




# log in chrome 
#

gh auth login -p https -h github.com -w

New-Item -ItemType Directory prj-personal

gh repo clone GustavoBitten/setachine-public prj-personal/setachine-public
