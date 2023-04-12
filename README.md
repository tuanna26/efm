Encrypted Files Management
==========================

This project provides a simple way to encrypt, decrypt, protect, and show the content of files using GPG encryption, as well as listing all encrypted files stored in the secure location.

Features
--------

*   Encrypt files with GPG encryption
*   Decrypt encrypted files
*   Remove an encrypted file
*   Protect files by moving them to a secure location after encryption
*   Show the content of decrypted files
*   List all encrypted files stored in the secure location

Prerequisites
-------------

Before you start using this project, make sure you have GPG installed on your system. See [How to install GPG](install_GPG.md#installing-gpg)

Installation
------------
First, modify the RECIPIENT variable in `Makefile` file to set your desired recipient as the default value

Second, grant executable permission to the `setup.sh` script by running:

    chmod +x setup.sh

Then, to set up aliases for the provided functionality, run the `setup.sh` script. This will add the necessary aliases to your `.bashrc` or `.zshrc` file.

    ./setup.sh

After running the script, restart your terminal or run `source ~/.bashrc` or `source ~/.zshrc` to start using the aliases.

Usage
-----

The following aliases are provided for easy access to the project's functionality:

*   `encrypt`: Encrypt a file
*   `decrypt`: Decrypt an encrypted file
*   `protect`: Encrypt a file and move it to a secure location
*   `show_secret`: Show the content of a decrypted file and remove it afterward
*   `list_secret`: List all encrypted files stored in the secure location
*   `remove_secret`: Remove an encrypted file stored in the secure location

To use these aliases, simply run the corresponding command followed by the file name and (optionally) the recipient's email address for GPG encryption:

    encrypt file.txt
    decrypt file.txt.gpg
    protect file.txt
    show_secret file.txt.gpg
    remove_secret file.txt.gpg
    list_secret

If the recipient's email address is provided, it will be used for GPG encryption:

    encrypt file.txt recipient@example.com
    decrypt file.txt.gpg recipient@example.com
    protect file.txt recipient@example.com
    show_secret file.txt.gpg recipient@example.com
