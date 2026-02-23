#!/bin/bash
export DEBIAN_FRONTEND=noninteractive

REGULAR_USER=viveira
REGULAR_PASSWORD=vivaeconsciente

sudo apt update -y

# Cria script de pós-login do GDM3 para o usuário 'aluno'
cat << 'EOF' > /etc/gdm3/PostLogin/Default
#!/bin/bash

# (DESATIVADO) Apaga e recria diretório do usuário, e restaura senha
if [[ "$USER" == "$REGULAR_USER" ]]; then
    #rm -rf /home/$USER
    #cp -r /etc/skel /home/$USER
    #chown -R $USER:$USER /home/$USER
    #echo "$REGULAR_USER:$REGULAR_PASSWORD" | chpasswd
fi

exit 0
EOF

chmod a+x /etc/gdm3/PostLogin/Default
echo '' > /etc/gdm3/PostSession/Default

sudo systemctl restart gdm3

##########################
# Instalação de pacotes
##########################

sudo apt install -y guvcview
sudo snap install godot-4

exit 0
