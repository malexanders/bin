#!/bin/bash -x

# Create new shell script and open in atom
if [[ $1 ]]; then
  if [[ ! -e $1 ]]; then
    echo "#!/bin/bash" >> $1
    chmod u+x $1
    atom $1
    exit 0
  else
    echo "Error: File already exists!"
    exit 1
  fi
else
  echo "Error: Expecting a filename as the first argument"
  exit 1
fi
