###### First detect which OS it is running
plataform="$(uname | tr  '[:upper:]' '[:lower:]')"
architecture="$(uname -m)"

if [[ $plataform == 'Linux' ]]; then 
	echo 'Running on linux'
else 
	echo "Running not on linux, running on: $plataform"
fi

####### Check Download git if not installed
if ! [ -x "$(command -v git)" ]; then
	echo 'Git Not Installed. Installing ...'
	if [[ $plataform == 'linux' ]]; then
		apt update && apt install git
	elif [[ $plataform == 'darwin' ]]; then
		brew install git
	else
		echo "Not a UNIX based system, this script isn't available for your platform"
		exit 1
	fi
fi

####### Download main dev tools

# Install platform different programs
if [[ $plataform == 'linux' ]];then
	# Download Node for neovim Coc support
	curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
	apt-get install nodejs

	# For downloading neovim on raspberrypi it is necessary to install snap for most upto date
	if [[ $architecture == 'armv7l' ]]; then
		apt install snapd
		snap install core
		snap install nvim --classic
	else
		apt -y install neovim

	fi
else 
	brew install neovim
fi

# Install rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

####### Clone the nvim config file from github to ~/.config/nvim
mkdir ~/.config/nvim
git clone https://github.com/Pedro4064/nvim_dotfiles.git ~/.config/nvim
