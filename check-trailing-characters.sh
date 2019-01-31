#!/bin/bash

find . -name "*.qml" -exec grep -Hn  "[[:blank:]]$" {} \; | grep -v build
find . -name "*.h" -exec grep -Hn  "[[:blank:]]$" {} \; | grep -v build
find . -name "*.cpp" -exec grep -Hn  "[[:blank:]]$" {} \; | grep -v build

# Executar: kate `./check-trailing-characters.sh` &
# Depois procurar no kate, usando expressoes regulares, por: ^\s+$
# Remover todos os espacos/linhas em branco
