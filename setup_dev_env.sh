#!/bin/sh
ZSHRC=$HOME/.zshrc

if  [[ `brew ls --versions dialog` > /dev/null ]]; then
  indices_of_programs_to_install=$(dialog --checklist "Select programs to install:" 20 40 6 --output-fd 1 \
          1 rbenv on \
          2 bundler on \
          3 node on \
          4 postgresql on \
          5 mariadb on );
else
  brew install dialog

  echo ""
  echo "Download complete please re-run the script"
  exit 1
fi

# Install x-code
# Figure out how to check if xcode is already install and include in conditional

if [[ `echo $indices_of_programs_to_install | grep "1"` ]]; then
  "${HOME}/bin/install_scripts/install_rbenv.sh"
fi

if [[ `echo $indices_of_programs_to_install | grep "2"` ]]; then
  install_bundler.sh
fi

if [[ `echo $indices_of_programs_to_install | grep "3"` ]]; then
  install_node.sh
fi

if [[ `echo $indices_of_programs_to_install | grep "4"` ]]; then
  install_postgres.sh
fi

if [[ `echo $indices_of_programs_to_install | grep "5"` ]]; then
  install_mariadb.sh
fi

exit 0
