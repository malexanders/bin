#!/bin/bash

ZSHRC=$HOME/.zshrc

echo ""
echo "======================================="
echo "======= Install Node JS ==============="
echo "======================================="
echo ""

if  [[ ! `brew ls --versions node` > /dev/null ]]; then
  echo "Installing node..."
  brew install node
  echo ""
  echo "$(which npm) -> $(npm -v)"
  echo "$(which node) -> $(node -v)"
else
  echo "$(which npm) -> $(npm -v)"
  echo "$(which node) -> $(node -v)"
fi

if [[ ! -d $HOME/.nvm ]]; then
  echo "Installing nvm..."
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.6/install.sh | bash

  # nvm command is a shell function declared in $HOME/.nvm/nvm.sh
  # Do this to make it available
  source $HOME/.nvm/nvm.sh

  echo ""
  echo "nvm: $(nvm --version)"
else

  # nvm command is a shell function declared in $HOME/.nvm/nvm.sh
  # Do this to make it available
  source $HOME/.nvm/nvm.sh

  echo "nvm: $(nvm --version)"
fi

if [[ ! `grep -e "\/.nvm" $ZSHRC` ]]; then
  echo "Adding nvm to PATH..."
  echo "" >> $HOME/.zshrc
  echo '# nvm setup' >> $HOME/.zshrc
  echo 'export NVM_DIR="$HOME/.nvm"' >> $HOME/.zshrc
  echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> $HOME/.zshrc  # This loads nvm
  echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> $HOME/.zshrc  # This loads nvm bash_completion
else
  echo "Not Adding nvm to PATH..."
fi
