How to use GPG
=======================================
- [How to use GPG](#how-to-use-gpg)
  - [Installing GPG](#installing-gpg)
  - [Creating a GPG Key Pair](#creating-a-gpg-key-pair)
  - [Exporting and Importing Public Keys](#exporting-and-importing-public-keys)
  - [Searching for a Key on a Keyserver](#searching-for-a-key-on-a-keyserver)
  - [Importing a Key from a Keyserver](#importing-a-key-from-a-keyserver)
  - [Sending Your GPG Key to a Keyserver](#sending-your-gpg-key-to-a-keyserver)
  - [Verifying the Key's Fingerprint](#verifying-the-keys-fingerprint)
  - [Using GPG to Encrypt and Decrypt Files](#using-gpg-to-encrypt-and-decrypt-files)

## Installing GPG
- On MacOS

    ```
    brew install gpg
    ```
- On Linux
    ```
    sudo apt-get install gnupg
    ```
    _This command will work on Debian-based Linux distributions like Ubuntu, but the specific command may be different on other Linux distributions._
- On Windows
    - Go to the [Gpg4win download page](https://gpg4win.org/download.html) and download the latest version of Gpg4win.
    - Run the installer and follow the prompts to install Gpg4win.

## Creating a GPG Key Pair

1. In Terminal, enter the following command to generate a new GPG key pair:
    ```
    gpg --full-generate-key
    ```
2. Follow the prompts to set up your key pair. You'll need to enter a name and email address for your key, as well as choose a passphrase.

3. Once your key pair has been generated, you can view it by running the following command:
    ```
    gpg --list-keys
    ```
## Exporting and Importing Public Keys

1. To export your public key, run the following command:
    ```
    gpg --export --armor [email address] > [filename].asc
    ```

    _Replace [email address] with the email address associated with your GPG key, and [filename] with the name you want to give your exported key file._

2. To import someone else's public key, save their key file (usually with a .asc extension) to your computer, then run the following command:
    ```
    gpg --import [filename].asc
    ```

    _Replace [filename] with the name of the key file you saved._

## Searching for a Key on a Keyserver

1. Open a terminal window.

2. Use the following command to search for a key on a keyserver:
   ```
   gpg --search-keys [name or email address]
    ```
    _Replace [name or email address] with the name or email address associated with the key you're searching for._
3. If the key is found, you should see it listed in the search results. Make a note of the key ID.

## Importing a Key from a Keyserver

1. Open your GPG keyring by running the following command in the terminal:
    ```
    gpg --list-keys
    ```
    If the keyserver you found the key on is not the default keyserver configured for your GPG keyring, add the keyserver to your list of keyserver options by running the following command:
    ```
    gpg --keyserver [keyserver URL] --recv-keys [key ID]
    ```
    _Replace [keyserver URL] with the URL of the keyserver you found the key on, and [key ID] with the ID of the key you want to import._

2. Import the key by running the following command:
    ```
    gpg --recv-keys [key ID]
    ```
    _Replace [key ID] with the ID of the key you want to import._

3. Verify that the key was imported by running the following command:
    ```
    gpg --list-keys
    ```

## Sending Your GPG Key to a Keyserver


1. Open a terminal window and run the following command to send your GPG key to a keyserver:
    ```
    gpg --keyserver [keyserver URL] --send-keys [key ID]
    ```
    _Replace [key ID] with the ID of the key you want to send to the keyserver._
2. If the keyserver you want to send the key to is not the default keyserver configured for your GPG keyring, add the keyserver to your list of keyserver options by running the following command:

    ```
    gpg --keyserver [keyserver URL] --send-keys [key ID]
    ```
    _Replace [keyserver URL] with the URL of the keyserver you want to send the key to, and [key ID] with the ID of the key you want to send._
3. Verify that the key was sent to the keyserver by searching for it using the keyserver's web interface or by running the following command:
   ```
   gpg --search-keys [name or email address]
    ```
    _Replace [name or email address] with the name or email address associated with the key you just sent to the keyserver._

## Verifying the Key's Fingerprint

1. Once you've imported the key, you should verify its fingerprint to make sure it hasn't been tampered with.

2. Run the following command to display the fingerprint of the key:
    ```
    gpg --fingerprint [key ID]
    ```
    _Replace [key ID] with the ID of the key you imported._

3. Compare the fingerprint displayed in the terminal with the fingerprint provided by the key owner. If they match, the key is valid.
## Using GPG to Encrypt and Decrypt Files

1. To encrypt a file using your GPG key, run the following command:
    ```
    gpg --encrypt --recipient [email address] [filename]
    ```

    _Replace [email address] with the email address of the person you want to encrypt the file for, and [filename] with the name of the file you want to encrypt._

2. To decrypt a file that has been encrypted with your GPG key, run the following command:
    ```
    gpg --decrypt [filename]
    ```

    _Replace [filename] with the name of the encrypted file you want to decrypt. If the file was encrypted for multiple recipients, you may need to enter your passphrase to decrypt it._


