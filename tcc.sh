#!/bin/bash

URL='localhost:8080'

nova_lista_produtos()
{
    declare nome
    declare categoria
    declare descricao
    declare preco
    declare i=1
    declare lista=()

    while true; do
        printf "[$i] Digite o nome do produto: "
        read nome
        if [ $? -ne 0 ]; then
            break
        fi
        printf "[$i] Digite a categoria do produto: "
        read categoria
        printf "[$i] Digite a descricao do produto: "
        read descricao
        printf "[$i] Digite o preco do produo: "
        read preco
        lista+=( "$(jo nome="$nome" categoria="$categoria" descricao="$descricao" precoProduto="$preco")" )
        i=$((i + 1))
        echo '--- Produto Adicionado ---'
    done
    jo -a "${lista[@]}" | jq > post.json
    cat post.json
}

novo_pedido()
{
    declare mesa
    declare id
    declare qtd
    declare obs
    declare i=1

    printf "Digite o numero da mesa: "
    read mesa
    while true; do
        printf "[item $i] Digite o id do produto: "
        read id
        if [ $? -ne 0 ]; then
            break
        fi
        printf "[item $i] Digite a quantidade: "
        read qtd
        printf "[item $i] Digite a observacao: "
        read obs
        i=$((i + 1))
        lista+=( "$(jo produtoId="$id" quantidade="$qtd" observacao="$obs")" )
        echo '--- Item adicionado ao pedido ---'
    done
    jo mesa="$mesa" itens="$(jo -a "${lista[@]}")" | jq > post.json
    cat post.json
}

novo_cardapio()
{
    declare nome
    declare desc
    declare status
    declare ids

    printf "Digite o nome do cardapio: "
    read nome
    printf "Digite a descricao do cardapio: "
    read desc
    printf "Digite o status: (1 - disponivel, 2 - nao disponivel)"
    read status
    printf "Insira os ids dos produos separados por espaco: "
    read ids
    jo nome="$nome" descricao="$desc" statusDisponivel@"$status" produtosIds="$(jo -a $ids)" | jq > post.json
    cat post.json
}

novo_fornecedor()
{
    declare razao
    declare email
    declare cnpj
    declare telefone
    declare endereco

    printf "Digite a Razao Social: "
    read razao
    printf "Digite o CNPJ: "
    read cnpj
    printf "Digite o endereco: "
    read endereco
    printf "Digite o e-mail: "
    read email
    printf "Digite o telefone: "
    read telefone
    jo razaoSocial="$razao" cnpj="$cnpj" endereco="$endereco" email="$email" telefone="$telefone" | jq > post.json
    cat post.json
}