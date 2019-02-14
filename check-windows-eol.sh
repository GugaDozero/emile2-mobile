#!/bin/bash

find . -name "*.qml" -exec file {} \; | grep CRLF | grep -v build | cut -d":" -f1
find . -name "*.h" -exec file {} \; | grep CRLF | grep -v build | cut -d":" -f1
find . -name "*.cpp" -exec file {} \; | grep CRLF | grep -v build | cut -d":" -f1

# Executar dos2unix nos arquivos encontrados
