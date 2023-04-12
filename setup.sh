#!/bin/bash

# Get the absolute path of the script's directory
SCRIPT_DIR=$(dirname $(realpath $0))

# Add aliases to the user's .bashrc or .zshrc file
if [ -f ~/.bashrc ]; then
    RC_FILE=~/.bashrc
elif [ -f ~/.zshrc ]; then
    RC_FILE=~/.zshrc
else
    echo "Unable to find .bashrc or .zshrc file. Please create one of them first."
    exit 1
fi

ALIASES=("encrypt" "decrypt" "protect" "show_secret" "list_secret" "remove_secret")

for ALIAS in "${ALIASES[@]}"; do
    if grep -q "alias $ALIAS=" $RC_FILE; then
        sed -i "s|alias $ALIAS=.*|alias $ALIAS='\"$SCRIPT_DIR/encrypt_decrypt.sh\" $ALIAS'|" $RC_FILE
    else
        echo "alias $ALIAS='\"$SCRIPT_DIR/encrypt_decrypt.sh\" $ALIAS'" >> $RC_FILE
    fi
done

echo "Aliases for encrypt, decrypt, protect, show_secret, list_secret, and remove_secret have been added or updated in your $RC_FILE file."
echo "Please restart your terminal or run 'source $RC_FILE' to start using the aliases."
