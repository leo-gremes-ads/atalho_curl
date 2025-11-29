#!/bin/bash

function pedido()
{
    declare mesa
    declare linha=3
    declare id
    declare qtd
    declare -a produtos
    declare produto
    declare lista=()

    produtos=`curl --silent -X GET localhost:8080/produto | jq -r '.[] | "\(.id)\t\(.nome)\t\(.categoria)"'`

    printf "\nDigite o numero da mesa:\n> "
    read mesa
    while true; do
        produto=$(echo "$produtos" | cut -f2-3 | column -t -s $'\t' | fzf --prompt="Selecione o produto: ")
        if [ $? -ne 0 ]; then
            break
        fi
        produto=$(printf "$produto" | sed 's/  \+/\t/g' | cut -f1)
        id=$(printf "%s" "$produtos" | grep -P "$produto\t" | cut -f1)
        printf "\nDigite a quantidadde de $(printf "%s" "$produto")\n> "
        read qtd
        lista+=( "$(jo produtoId="$id" qtd="$qtd")" )
    done
    printf "\n========== post.json ===========\n"
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
    declare ingredientes=$(curl --silent -X GET localhost:8080/ingrediente | jq -r '.[] | "\(.id)\t\(.nome)\t\(.unDeMedida)"')

    printf "\nNome do produto\n> "
    read nome
    printf "\nCategoria do produto\n> "
    read categoria
    printf "\nPreço do produto\n> "
    read preco
    while true; do
        ing=$(printf "%s" "$ingredientes" | cut -f2 | fzf --prompt="Selecione o ingrediente: ")
        if [ $? -ne 0 ]; then
            break
        fi
        id=$(printf "$ingredientes" | grep -P "$ing\t" | cut -f1)
        printf "\nQuantidade de %s (%s)\n> " "$ing" "$(printf "$ingredientes" | grep -P "$ing\t" | cut -f3)"
        read qtd
        lista+=( "$(jo ingredienteId="$id" qtd="$qtd")" )
    done
    printf "\n========== post.json ===========\n"
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

    printf "\nNome do ingrediente\n> "
    read nome
    printf "\nUnidade de medida\n> "
    read un
    printf "\nNome do fornecedor\n> "
    read fornecedor
    printf "\n========== post.json ===========\n"
    jo nome="$nome" unDeMedida="$un" fornecedor="$fornecedor" | jq > post.json
    cat post.json
}