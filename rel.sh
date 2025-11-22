#!/bin/bash

function rofi_input()
{
    declare resp
    resp=$(echo "" | rofi -dmenu -p "$1" -l 0)
    echo "$resp"
}

function input_prompt()
{
    local resp
    printf "$1" >&2
    read resp
    echo "$resp"
}

function pedido()
{
    declare mesa
    declare linha=3
    declare id
    declare qtd
    declare -a produtos
    declare produto
    declare lista=()

    produtos=`curl --silent -X GET localhost:8080/produto | jq -r '.[] | "\(.id)\t\(.nome)"'`

    printf "\nDigite o numero da mesa:\n> "
    read mesa
    #mesa=`rofi_input "Numero da mesa"`
    #mesa=$(input_prompt "Número da mesa: ")
    while true; do
        #produto=`echo "$produtos" | rofi -dmenu -i -p "Escolha o produto"`
        produto=$(echo "$produtos" | cut -f2 | fzf --prompt="Selecione o produto: ")
        if [ $? -ne 0 ]; then
            break
        fi
        id=`printf "%s" "$produtos" | grep "$produto$" | cut -f 1`
        #qtd=$(rofi_input "Qtd de $(printf "%s" "$produto" | cut -f 2)")
        printf "\nDigite a quantidadde de $(printf "%s" "$produto" | cut -f2)\n> "
        read qtd
        lista+=( "$(jo produtoId="$id" qtd="$qtd")" )
    done
    jo numeroMesa="$mesa" itens=$(jo -a "${lista[@]}") | jq > post.json
    cat post.json   
}

function produto()
{
    declare nome
    declare categoria
    declare preco
    declare lista=()
    declare ing
    declare id
    declare qtd
    declare ingredientes=$(curl --silent -X GET localhost:8080/ingrediente | jq -r '.[] | "\(.id)\t\(.nome)"')

    nome=$(rofi_input "Nome do produto")
    categoria=$(rofi_input "Categoria do produto")
    preco=$(rofi_input "Preço do produto")
    while true; do
        ing=$(printf "%s" "$ingredientes" | cut -f2 | rofi -dmenu -i -p "Escolha o ingrediente")
        if [ $? -ne 0 ]; then
            break
        fi
        id=$(printf "%s" "$ingredientes" | grep "$ing$" | cut -f1)
        qtd=$(rofi_input "Quantidade de $(printf "%s" "$ing" | cut -f2)")
        lista+=( "$(jo ingredienteId="$id" qtd="$qtd")" )
    done
    if [[ "${#lista[@]}" -eq 0 ]]; then
        jo nome="$nome" categoria="$categoria" preco="$preco" ingredientes=$(jo -a < /dev/null) | jq > post.json
    else
        jo nome="$nome" categoria="$categoria" preco="$preco" ingredientes=$(jo -a "${lista[@]}") | jq > post.json
    fi
    cat post.json
}

function ingrediente()
{
    declare nome
    declare un
    declare fornecedor

    nome=$(rofi_input "Nome do ingrediente")
    un=$(rofi_input "Unidade de Medida")
    fornecedor=$(rofi_input "Nome do fornecedor")
    jo nome="$nome" unDeMedida="$un" fornecedor="$fornecedor" | jq > post.json
    cat post.json
}