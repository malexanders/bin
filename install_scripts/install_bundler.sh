#!/bin/bash

echo ""
echo "======================================="
echo "======= Install Bundler ==============="
echo "======================================="
echo ""
if  [[ ! `gem list bundler -i` ]] ; then
  echo "Installing bundler..."
  gem install bundler
  rbenv rehash
else
  echo "$(bundler --version)"
fi
