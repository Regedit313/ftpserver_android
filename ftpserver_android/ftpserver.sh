
#!/data/data/com.termux/files/usr/bin/bash

cd "$(dirname "$0")" || exit 1

clear

echo
echo "ftpserver_android"
echo

echo "Creating FTPshare folder..."
mkdir -p "/storage/emulated/0/FTPshare"

echo
echo "Checking installation..."
echo

if ! command -v python >/dev/null 2>&1; then
    echo "Python is not installed."
    echo "Run Setup / Update first."
    echo
    read -p "Press Enter to continue..."
    exit 1
fi

if ! python -c "import pyftpdlib" >/dev/null 2>&1; then
    echo "pyftpdlib is not installed."
    echo "Run Setup / Update first."
    echo
    read -p "Press Enter to continue..."
    exit 1
fi

echo "Installation OK."
echo

echo "Local IP address:"

python -c "import socket;s=socket.socket(socket.AF_INET,socket.SOCK_DGRAM);s.connect(('8.8.8.8',80));print(s.getsockname()[0]);s.close()"

echo
echo "FTP port: 2121"
echo
echo "Shared folder:"
echo "/storage/emulated/0/FTPshare"
echo
echo "Press CTRL+C to stop the server."
echo

python -m pyftpdlib -p 2121 -w -d "/storage/emulated/0/FTPshare"

