scoop bucket add extras
scoop install main/gh
scoop install extras/googlechrome
scoop install extras/github
scoop install extras/dbeaver
scoop install extras/lens
scoop install extras/vscode
scoop install extras/teamviewer
scoop install extras/discord
scoop install extras/postman

# log in chrome 
start-process chrome

if (!(gh auth status 2>&1 | Select-String "Logged in to github.com")) {
  gh auth login -p https -h github.com -w
}

wsl --install