#!/usr/bin/bash
#
# Aleksandr Gavrik, 2019, mbfx@mail.ru
#
# Скрипт генерации ключей, если таковых ещё нет.
#
echo "Running RSA keys generator."

KEYNAME="id_rsa"
PASSPHRASE=""

if [ -f "$HOME/.ssh/$KEYNAME" ] ; # Проверяем наличие уже готовых ключей
        then
        echo "File $KEYNAME exist in $HOME/.ssh"
        if [ -f "$HOME/.ssh/$KEYNAME" ] ; # Если есть, то будем использовать их
            then
            echo "Copy file from $HOME/.ssh to $PWD"
            cp -b $HOME/.ssh/$KEYNAME.pub $PWD/
        fi
	else
    echo "Generating keys in $HOME/.ssh" # А если нет, то сделаем новые
	ssh-keygen -q -t rsa -N "$PASSPHRASE" -f "$HOME/.ssh/$KEYNAME"
    echo "Copy keyfile from $HOME/.ssh to $PWD"
    cp -b $HOME/.ssh/$KEYNAME.pub $PWD/ # И будем использовать новые
fi
exit 0
