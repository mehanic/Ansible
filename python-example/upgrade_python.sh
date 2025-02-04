sudo apt-get install build-essential checkinstall
sudo apt-get install libreadline-gplv2-dev libncursesw5-dev libssl-dev \
    libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev


version=3.7.2
cd ~/Downloads/
wget https://www.python.org/ftp/python/$version/Python-$version.tgz
tar -xvf Python-$version.tgz
cd /home/net/ansible/Python-$version
./configure
make
sudo checkinstall

echo "python installed " > /installed_python.txt

if [[ $(python --version) =~ "3.7" ]]
   then 
      echo "I have 3.7"
   else 
      echo "I don`t have 3.7"
fi
