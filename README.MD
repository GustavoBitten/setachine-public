# Setachine Public

## Install Windows

```sh
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
scoop install git
New-Item -ItemType Directory prj-personal
git clone https://github.com/GustavoBitten/setachine-public.git prj-personal/setachine-public
.\prj-personal\setachine-public\first_run_windows.ps1
```

## Install Linux

```sh
sudo apt install git
mkdir prj-personal
cd prj-personal
git clone https://github.com/GustavoBitten/setachine-public.git
cd setachine-public
chmod +x first_run_linux.sh
./first_run_linux.sh
```



