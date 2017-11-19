#!/bin/bash
echo ""
echo "======================================="
echo "======= Install Mariadb ==============="
echo "======================================="
echo ""

if  [[ ! `brew ls --versions mariadb` > /dev/null ]]; then
  echo "Installing mariadb..."
  brew install mariadb
else
  echo "$(mysql --version)"
fi
