#!/bin/sh

echo "Installing Mario Dotfiles"
echo "We'll install:"

### Instalando Git e coisas básicas
#xcode-select --install
# Try the AppleScript automation method rather than relying on manual .xip / .dmg download & mirroring
# Note: Apple broke automated Xcode installer downloads.  Now requires manual Apple ID sign-in.
# Source: https://web.archive.org/web/20211210020829/https://techviewleo.com/install-xcode-command-line-tools-macos/
xcode-select -p &> /dev/null
if [ $? -ne 0 ]; then
  xcode-select --install
  sleep 1
  osascript <<-EOD
    tell application "System Events"
	  tell process "Install Command Line Developer Tools"
	    keystroke return
        click button "Agree" of window "License Agreement"
	  end tell
	end tell
EOD
else
  echo "Xcode CLI tools OK"
fi

# echo "Checking Xcode CLI tools"
# # Only run if the tools are not installed yet
# # To check that try to print the SDK path
# xcode-select -p &> /dev/null
# if [ $? -ne 0 ]; then
#   echo "Xcode CLI tools not found. Installing them..."
#   touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress;
#   PROD=$(softwareupdate -l |
#     grep "\*.*Command Line" |
#     tail -n 1 | sed 's/^[^C]* //')
#   softwareupdate -i "$PROD" --verbose;
# else
#   echo "Xcode CLI tools OK"
# fi

### Setup dos dotfiles
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig


