#!/bin/bash

# Instalar o SDKMAN
echo "Instalando o SDKMAN..."

curl -s "https://get.sdkman.io" | bash

# Configurar o SDKMAN no shell
echo "Configurando o SDKMAN no shell..."
source "$HOME/.sdkman/bin/sdkman-init.sh"

# Validar a instalação do SDKMAN
echo "Validando a instalação do SDKMAN..."
sdk version

echo "Instalação do SDKMAN concluída com sucesso!"