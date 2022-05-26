#!/bin/bash

LINK(){
    sudo rm -rf $2/$1
    sudo ln -sf $(pwd)/$1 $2
}

##############################################################################
#                           SELECTING CONFIGURATION                          # 
##############################################################################

echo -e "Available configurations:\n"
configurations=`ls ./configurations/`
for folder in $configurations
do
    echo -e "\t$folder"
done

echo -e "\n\t* minimal => no WM or DE, only X and basic apps\n"
read -p "Which configuration should be installed? " configuration

correct=false
for folder in $configurations
do
    if [ $folder == $configuration ]; then
        correct=true
    fi
done

if [ $correct == false ]; then
    echo -e "\n\e[31mInvalid choice.\e[0m"
    exit
fi

echo -e "\nConfiguration will be installed: \e[32m$configuration\e[0m"
sleep 3

##############################################################################
#                      INSTALLING MINIMAL CONFIGURATION                      # 
##############################################################################

cd ./configurations/minimal/ && bash ./install.sh && cd ../..

##############################################################################
#                    INSTALLING ADDITIONAL CONFIGURATIONS                    # 
##############################################################################

if [ $configuration == "minimal" ]; then
    cd ./configurations/minimal/ && fish ./fishcfg.sh
    echo -e "\n\e[32mInstallation finished.\e[0m"
else
    cd ./configurations/$configuration/ && bash ./install.sh && cd ../..
    cd ./configurations/minimal/ && fish ./fishcfg.sh
    echo -e "\n\e[32mInstallation finished.\e[0m"
fi
