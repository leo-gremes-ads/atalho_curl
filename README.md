## Atalho Curl

Repositório feito para diminuir e facilitar o envio de requisições HTTP via linha de comando através do ```curl```.  
A motivação veio da necessidade do envio de requisições nos projetos desenvolvidos na faculdade, principalmente o [TCC](https://github.com/cnfl-fateczl/tcc) (que está no começo e precisa de vários testes).

### Modo de usar
##### Obs.: Desenvolvido em bash para ser utilizado em ambientes Linux.
##### Obs2.: O script usa o 'jq' para formatar os json de saída, caso o ambiente não tenha o programa, instale ou edite as funções para retirar essa parte


1. Defina uma variável de sessão URI com o endereço da api.  
      ```
      URI='192.168.0.1:8080'
      ```
      Você pode conferir o valor armazenado na variável através do comando ```echo```  
      ```
      echo "$URI"
      ```
      Caso a variável não esteja definida, o endereço usado será ```localhost:8080```

   
2. Incorpore as funções do shellscript na sua sessão através do comando ```source```
      ```
      source atalho_curl.sh
      ```
3. Envie as requisições via comandos ```GET```, ```POST```, ```PUT``` e/ou ```DELETE```
    ```
    GET <endpoint>
    GET /produto

    POST <arquivo> <endpoint>
    POST post_produto.json /produto

    PUT <arquivo> <endpoint>
    PUT put_produto.json /produto/1

    DELETE <endpoint>
    DELETE /produto/1
    ```
    Note que as requisições POST e PUT necessitam de um arquivo .json

### Arquivos Exemplo
Os arquivos .json presentes nesse repositório são específicos para o projeto do TCC, contendo as chaves necessárias e valores sugeridos para cada requisição (A requisição PUT não exige todos os campos, atualizando apenas os campos presentes no json).
