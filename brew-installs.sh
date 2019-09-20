#!/bin/sh

# #!/usr/bin/env bash
# chmod a+x brew.sh

# https://computers.tutsplus.com/tutorials/perfect-configurations-with-homebrew-and-cask--cms-20768

# Install command-line tools using Homebrew.
echo "Starting bootstrapping"

# Check for Homebrew, install if we don't have it
if test ! $(which brew); then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
echo "Updating Homebrew..."
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`.
brew install bash
brew install bash-completion2

# Switch to using brew-installed bash as default shell
if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
  echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/bash;
fi;

# Install `wget` with IRI support.
echo "Installing wget..."
brew install wget

# Install more recent versions of some macOS tools.
echo "Installing vim ..."
brew install vim
# brew install homebrew/php/php56 --with-gmp

# Install font tools.
#brew tap bramstein/webfonttools
#brew install sfnt2woff
#brew install sfnt2woff-zopfli
#brew install woff2

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
echo "Installing coreutils, moreutils, findutils..."
brew install coreutils
echo "Installing GNU core utilities..."
brew tap homebrew/dupes
brew install coreutils
brew install gnu-sed
brew install gnu-tar
brew install gnu-indent
brew install gnu-which 
brew install gnu-grep

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, g-prefixed
echo "Installing findutils..."
brew install findutils

# Install some CTF tools; see https://github.com/ctfs/write-ups.
# brew install aircrack-ng
# brew install bfg
# brew install binutils
# brew install binwalk
# brew install cifer
# brew install dex2jar
# brew install dns2tcp
# brew install fcrackzip
# brew install foremost
# brew install hashpump
# brew install hydra
# brew install john
# brew install knock
# brew install netpbm
# brew install nmap
# brew install pngcheck
# brew install socat
# brew install sqlmap
# brew install tcpflow
# brew install tcpreplay
# brew install tcptrace
# brew install ucspi-tcp # `tcpserver` etc.
# brew install xpdf
# brew install xz

brew tap homebrew/services

# Install other useful binaries.
#brew install exiv2
brew install git
brew install git-lfs
brew install imagemagick 
brew install ssh-copy-id
brew install tree
brew install webkit2png
brew install wget


# Install Brew Cask 
brew tap phinze/cask
brew install brew-cask

# brew packages
brew install git
brew install gradle
brew install openssl
brew install ruby

# Install Mac Apps

# https://caskroom.github.io/search
brew cask install 1password
# brew cask install adium
brew cask install android-file-transfer
brew cask install anaconda
brew cask install alfred
brew cask install aton
# brew cask install appcleaner
# brew cask install appcode
brew cask install authy
brew cask install charles
# brew cask install clion
# brew cask install cronnix
brew cask install dash
brew cask install discord
brew cask install docker
brew cask install dropbox
brew cask install firefox
brew cask install google-chrome
brew cask install google-drive
brew cask install daisydisk
brew cask install istat-menus
brew cask install iterm2
# brew cask install keepingyouawake
brew cask install mailplane
brew cask install mysql
# brew cask install postgres
brew cask install postman
brew cask install pycharm
brew install python
brew install python3
brew cask install spotify
brew cask install signal
# brew cask install razorsql
brew cask install skitch
brew cask install slack
brew cask install the-unarchiver
brew cask install telegram
brew cask install transmit
brew cask install p7zip
brew cask install tower #git client
brew cask install unrarx
brew cask install virtualbox
brew cask install visual-studio-co
brew cask install vlc
brew cask install whatsapp
brew cask install wireshark


# Remove outdated versions from the cellar.
brew cleanup
