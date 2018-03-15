/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install node
npm install -g ganache-cli
nohup ganache-cli --account="0x1636e10756e62baabddd4364010444205f1216bdb1644ff8f776f6e2982aa9f5,1" &