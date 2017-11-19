#!/bin/sh
ZSHRC=$HOME/.zshrc

# Go to config file to select programs to install
source setup_dev_env.conf

for install_script in "${install_scripts[@]}"
do
   :
   $install_script
done

exit 0
