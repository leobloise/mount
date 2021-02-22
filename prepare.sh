#!/bin/bash

sudo apt-get update
sudo apt update
sudo apt upgrade
sudo apt install snapd

if [ $? -eq 0 ]; then

    echo "Installing base"

    sudo apt install curl
    sudo apt install wget
    sudo apt install zip
    sudo apt install unzip
    sudo apt-get install gdebi

    if [ $? -eq 0 ]; then

        sudo snap install --classic code
        sudo snap install node --classic --channel=14
        sudo apt install npm
        curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
        echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
        sudo snap install --classic heroku
        git config --global user.name "Leonardo Cardoso da Silva Bloise"
        git config --global user.email "leonardo.bloise@outlook.com"
        
        if [ $? -eq 0 ]; then
            sudo apt update
            sudo apt install --no-install-recommends yarn
        else
            echo "CODE, NODE OR CURL WAS NOT INSTALLED";
        fi

        sudo snap install discord
        sudo snap install slack --classic
        sudo apt install php

        echo "Installing google chrome"

        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo dpkg -i google-chrome-stable_current_amd64.deb

        if [ $? -eq 0 ]; then

            bash install_font.sh

            echo "JetBrains Mono Installed"

            echo "deb https://dl.bintray.com/getinsomnia/Insomnia /" \
                | sudo tee -a /etc/apt/sources.list.d/insomnia.list

            wget --quiet -O - https://insomnia.rest/keys/debian-public.key.asc \
                | sudo apt-key add - 

            sudo apt-get update 
            sudo apt-get install insomnia

            wget -O hyper_3.0.2.deb  https://releases.hyper.is/download/deb
            sudo gdebi ./hyper_3.0.2.deb 

            wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
            echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
            sudo apt-get update
            sudo apt-get install sublime-text

            sudo snap install telegram-desktop

            echo "
                SNAPD
                CURL
                WGET
                GDEBI
                ZIP
                UNZIP
                NODE
                NPM
                YARN
                VSCODE
                DISCORD
                SLACK
                PHP
                GOOGLE CHROME 
                JetBrains Mono
                HEROKU
                Git configuration username and email
                INSOMNIA
                HYPER
                SUBLIME_TEXT
                TELEGRAM

                Installed              
            "

            if [ $? -eq 0 ]; then

                echo "Starting to install extensions in VSCODE"
                
                code --install-extension PKief.material-icon-theme --force
                code --install-extension rocketseat.theme-omni  --force
                code --install-extension mohsen1.prettify-json --force
                code --install-extension felixfbecker.php-pack  --force
                code --install-extension felixfbecker.php-intellisense --force
                code --install-extension felixfbecker.php-pack --force
                code --install-extension davidanson.vscode-markdownlint --force
                code --install-extension dbaeumer.vscode-eslint --force

                if [ $? -eq 0 ]; then
                    
                    echo "{
                        \"workbench.colorTheme\": \"Omni\",
                        \"workbench.iconTheme': \"material-icon-theme\",
                        \"editor.fontFamily': \"'JetBrains Mono', 'monospace', monospace, 'Droid Sans Fallback'\",
                        \"editor.fontLigatures\": \"true\"
                    }" > $HOME/.config/Code/User/settings.json

                    echo "VS CODE SETUP COMPLETE"

                else
                    echo "There was an error while installing extensions in Visual Studio Code"
                fi
            
            else
                echo "There was an error while installing stuff"
            fi
        else
            echo "GOOGLE CHROME WAS NOT INSTALLED";
        fi

    else
        echo "CURL AND WGET ARE NECESSARY TO RUN THIS SCRIPT";
    fi

else
    echo "There was an error while running the script."
fi



