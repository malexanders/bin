#!/bin/bash

echo ""
echo "===================================="
echo "======= Install Postgres ==========="
echo "===================================="
echo ""

if  [[ ! `brew ls --versions postgresql` > /dev/null ]]; then
  echo "Installing postgresql..."
  brew install postgresql
else
  echo "$(brew ls --versions postgresql)"
fi
