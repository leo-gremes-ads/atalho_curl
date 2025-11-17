#!/bin/bash

function rel_pedido()
{
	declare cliente
	declare id
	declare qtd
	declare lista=()

	printf "Informe o nome do cliente: "
	read cliente
	while true; do
		printf "Informe o id do produto: "
		read id
		if [ $? -ne 0 ]; then
			break
		fi
		printf "Informe a quantidade: "
		read qtd
		lista+=( "$(jo produtoId="$id" qtd="$qtd")" )
		echo '----- produto adicionado ------'
	done
	jo cliente="$cliente" itens="$(jo -a ${lista[@]})" | jq > rel_pedido.json
	cat rel_pedido.json
}
