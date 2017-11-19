#!/bin/bash
ZSHRC=$HOME/.zshrc

echo ""
echo "======================================="
echo "========= Install rbenv ==============="
echo "======================================="
echo ""

if [ ! -d $HOME/.rbenv ]; then
  git clone https://github.com/rbenv/rbenv.git $HOME/.rbenv
fi

if [[ ! `grep -e '/.rbenv\/bin' $ZSHRC` ]]; then
  echo "Adding rbenv to PATH..."
  echo "" >> $HOME/.zshrc
  echo "# rbenv setup" >> $HOME/.zshrc
  echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> $HOME/.zshrc
  echo "Your PATH is now:"
  echo $PATH
else
  echo "rbenv added to PATH"
fi

if [[ ! `grep -e 'eval "$(rbenv init -)"' $ZSHRC` ]]; then
  echo "Adding rbenv init to $HOME/.zshrc..."
  echo 'eval "$(rbenv init -)"' >> $HOME/.zshrc
else
  echo "rbenv init added to $HOME/.zshrc"
fi

if [ ! -d $HOME/.rbenv/plugins/ruby-build/ ]; then
  echo "Installing Ruby-Build..."
  git clone git://github.com/sstephenson/ruby-build.git $HOME/.rbenv/plugins/ruby-build
else
  echo "ruby-build installed"
fi

echo ""
echo "======================================="
echo "======= Verify rbenv installation ====="
echo "======================================="
echo ""

curl -fsSL https://github.com/rbenv/rbenv-installer/raw/master/bin/rbenv-doctor | bash
