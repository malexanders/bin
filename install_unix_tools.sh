#!/bin/bash

if [[ ! `brew ls --versions dialog` > /dev/null ]]; then
  brew install dialog
else
  echo "Dialog already install"
fi
