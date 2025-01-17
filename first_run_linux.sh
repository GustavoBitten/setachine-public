spacer() {
    echo "----------------------------------------"
}

# Update package list
# echo "Updating package list..."
# sudo apt update -qq

spacer

# Install basic tools
# echo "Installing basic tools..."
# sudo apt install -y -qq curl git zsh build-essential python3-pip jq unzip
# echo "Basic tools installation completed"

spacer


# Install Oh My Zsh if not already installed
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Installing Oh My Zsh..."
    RUNZSH=no sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
    echo "Oh My Zsh is already installed"
fi

# Set Zsh as default shell if it's not already
if [ "$SHELL" != "$(which zsh)" ]; then
    echo "Setting Zsh as default shell..."
    chsh -s $(which zsh)
else
    echo "Zsh is already the default shell"
fi



# Check and set Git user name if not already configured
if [ -z "$(git config --global user.name)" ]; then
    git config --global user.name "Gustavo Bittencourt"
else
    git config --global user.name
    echo "Git user.name is already configured"
fi

spacer


# Check and set Git user email if not already configured
if [ -z "$(git config --global user.email)" ]; then
    git config --global user.email "gustavoduarte1999@hotmail.com"
else
    git config --global user.email
    echo "Git user.email is already configured"
fi

spacer

# Configure Git pull behavior
if [ "$(git config --global pull.rebase)" != "false" ]; then
    echo "Setting Git pull behavior to merge..."
    git config --global pull.rebase false
    echo "Git pull behavior is now configured to merge"
else
    echo "Git pull behavior is already configured to merge"
fi

spacer


# Install GitHub CLI if not already installed
if ! which gh > /dev/null 2>&1; then
    echo "Installing GitHub CLI..."
    curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
    sudo apt update
    sudo apt install -y gh
    echo "GitHub CLI installation completed"
else
    echo "GitHub CLI is already installed"
    gh --version
fi

# Login to GitHub CLI if not already authenticated
if ! gh auth status >/dev/null 2>&1; then
    echo "Logging in to GitHub..."
    gh auth login --web --hostname github.com -p ssh
else
    echo "Already logged in to GitHub"
fi

spacer


# Install AWS CLI v2
if ! which aws > /dev/null 2>&1; then
    echo "Installing AWS CLI..."
    # curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
    # unzip /tmp/awscliv2.zip -d /tmp
    # sudo /tmp/aws/install
else
    echo "AWS CLI is already installed"
    aws --version
fi

spacer


# Check and install Docker if not already installed
if ! which docker > /dev/null 2>&1; then
    echo "Installing Docker..."
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
    sudo apt update
    sudo apt install -y docker-ce docker-ce-cli containerd.io
    sudo groupadd -f docker
    sudo usermod -aG docker $USER
    sudo systemctl enable docker
    sudo systemctl start docker
    newgrp docker
    echo "Docker installation completed"
    
    echo "Testing Docker installation..."
    docker run hello-world
    echo "Docker installation test completed"
else
    echo "Docker is already installed"
    docker --version
fi

spacer


# Install tfenv if not already installed
if ! which tfenv > /dev/null 2>&1; then
    echo "Installing tfenv..."
    git clone --depth=1 https://github.com/tfutils/tfenv.git ~/.tfenv
    sudo ln -s ~/.tfenv/bin/* /usr/local/bin
    echo "tfenv installation completed"
    echo "Installing latest stable version of Terraform..."
    tfenv install latest
    tfenv use latest
    echo "Terraform installation completed"
else
    echo "tfenv is already installed"
fi

spacer


# Install latest stable version of Terraform using tfenv
if ! which terraform > /dev/null 2>&1; then
    echo "Installing latest stable version of Terraform..."
    tfenv install latest
    tfenv use latest
else
    echo "Terraform is already installed"
    terraform --version
fi

spacer

