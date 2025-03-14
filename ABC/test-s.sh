#! /bin/bash
apt update
# apt -y install apache2
UBUNTU_CODENAME=focal
wget -O- "https://keyserver.ubuntu.com/pks/lookup?fingerprint=on&op=get&search=0x6125E2A8C77F2818FB7BD15B93C4A3FD7BB9C367" 
sudo gpg --dearmour -o /usr/share/keyrings/ansible-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/ansible-archive-keyring.gpg] http://ppa.launchpad.net/ansible/ansible/ubuntu $UBUNTU_CODENAME main" 
# sudo tee /etc/apt/sources.list.d/ansible.list
sudo apt update && sudo apt install ansible -y
# cat <<EOF > /var/www/html/index.html
# <html><body><p>Linux startup script added directly-s.</p></body></html>
# EOF