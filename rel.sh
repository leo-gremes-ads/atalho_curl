#!/bin/bash

function rofi_input()
{
    declare resp
    resp=$(echo "" | rofi -dmenu -p "$1" -l 0)
    echo "$resp"
}

function rofi_pedido()
{
    declare cliente
    declare id
    declare qtd
    declare -a produtos
    declare produto
    declare lista=()

    produtos=`curl --silent -X GET localhost:8080/produto | jq -r '.[] | "\(.id)\t\(.nome)"'`

    echo "$prdutos"
    cliente=`rofi_input "Nome do cliente"`
    while true; do
        produto=`echo "$produtos" | rofi -dmenu -i -p "Escolha o produto"`
        #produto=$(echo "$produtos" | fzf --prompt="Selecione o produto: ")
        if [ $? -ne 0 ]; then
            break
        fi
        id=`printf "%s" "$produto" | cut -f 1`
        qtd=$(rofi_input "Qtd de $(printf "%s" "$produto" | cut -f 2)")
        lista+=( "$(jo produtoId="$id" qtd="$qtd")" )
    done
    jo cliente="$cliente" itens=$(jo -a "${lista[@]}") | jq > post.json
    cat post.json   
}

function rofi_produto()
{
    declare nome
    declare preco

    nome=$(rofi_input "Nome do produto")
    preco=$(rofi_input "Preço do produto")
    jo nome="$nome" precoProduto="$preco" | jq > post.json
    cat post.json
}