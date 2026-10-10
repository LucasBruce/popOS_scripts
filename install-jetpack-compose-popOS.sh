#!/bin/bash
# =========================================================
# Script de instalação do Dart SDK para Pop!_OS / Ubuntu / Debian
# Método: baixar o pacote .deb diretamente, sem adicionar PPA
# =========================================================

set -e

echo "=== Iniciando instalação do Dart SDK (download direto do .deb) ==="

# 1. Detectar arquitetura
ARQ=$(dpkg --print-architecture)
echo "[1/4] Arquitetura detectada: $ARQ"

# 2. Obter o nome do pacote .deb mais recente (canal stable)
echo "[2/4] Consultando a versão mais recente do Dart SDK..."
PACKAGES_URL="https://storage.googleapis.com/download.dartlang.org/linux/debian/dists/stable/main/binary-${ARQ}/Packages"

# Extrai o nome do arquivo .deb a partir dos metadados do repositório oficial
DART_DEB_FILE=$(curl -sL "$PACKAGES_URL" | grep -A 20 "^Package: dart$" | grep "^Filename:" | head -1 | awk '{print $2}')

# Se a extração falhar, usa uma versão conhecida como alternativa
if [ -z "$DART_DEB_FILE" ]; then
    echo "Aviso: não foi possível obter a versão mais recente automaticamente. Usando versão alternativa."
    DART_DEB_FILE="pool/main/d/dart/dart_3.4.0-1_${ARQ}.deb"
fi

DART_DEB_NAME=$(basename "$DART_DEB_FILE")
DART_DEB_URL="https://storage.googleapis.com/download.dartlang.org/linux/debian/${DART_DEB_FILE}"

echo "       Será baixado: $DART_DEB_NAME"

# 3. Baixar o pacote .deb
echo "[3/4] Baixando..."
cd /tmp
wget -q --show-progress "$DART_DEB_URL" -O "$DART_DEB_NAME"

# 4. Instalar
echo "[4/4] Instalando..."
sudo dpkg -i "$DART_DEB_NAME" || sudo apt-get install -f -y

# 5. Configurar PATH (Pop!_OS usa .bashrc com mais frequência)
DART_BIN="/usr/lib/dart/bin"
if ! grep -q "$DART_BIN" ~/.bashrc 2>/dev/null; then
    echo "export PATH=\"\$PATH:$DART_BIN\"" >> ~/.bashrc
    echo "PATH adicionado ao ~/.bashrc"
fi

# Limpeza
rm -f "/tmp/$DART_DEB_NAME"

echo ""
echo "=== Instalação concluída! ==="
echo "Execute o comando abaixo para aplicar o PATH:"
echo "  source ~/.bashrc"
echo "Depois verifique com:"
echo "  dart --version"