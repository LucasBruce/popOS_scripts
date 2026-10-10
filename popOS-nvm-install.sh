#!/bin/bash

# Instalar o curl, se ainda não estiver instalado
echo "Instalando o curl..."
sudo apt install -y curl

# Baixar e instalar o NVM
echo "Baixando e instalando o NVM..."
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
# curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

# Adicionar NVM ao ambiente
echo "Configurando o NVM no ambiente..."
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # Este comando carrega o NVM
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # Este comando carrega o nvm bash_completion

# Verificar se o NVM foi instalado corretamenteagoagoasdasdasdasdagorafaça uadsfasdfasdfsdfsadfsdfsadf
echo "Verificando a instalação do NVM..."
if command -v nvm > /dev/null 2>&1; then
    echo "NVM instalado com sucesso!"
else
    echo "Erro ao instalar o NVM. Verifique o script e tente novamente."
    exit 1
fi

# Instalar a versão desejada do Node.js
NODE_VERSION="22.13.0"
echo "Instalando o Node.js versão $NODE_VERSION..."
nvm install $NODE_VERSION

# Definir a versão instalada como padrão
echo "Definindo a versão $NODE_VERSION como padrão..."
nvm alias default $NODE_VERSION
nvm use $NODE_VERSION

# Verificar a instalação do Node.js e NPM
echo "Validando as versões instaladas..."
echo "Versão do Node.js:"
node -v
echo "Versão do NPM:"
npm -v

echo "Instalação e configuração do NVM e Node.js concluídas com sucesso!"