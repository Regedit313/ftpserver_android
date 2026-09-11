# ftpserver_android

pkg update -y

pkg install python -y

pip install pyftpdlib

termux-setup-storage

python -m pyftpdlib -p 2121 -w -d "/storage/emulated/0/FTPshare"

----------

Know ip : 

python -c "import socket;s=socket.socket(socket.AF_INET,socket.SOCK_DGRAM);s.connect(('8.8.8.8',80));print(s.getsockname()[0]);s.close()"

----------

Stop server :

pkill -f pyftpdlib

or

CTRL + C
