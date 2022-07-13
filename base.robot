* Settings *
Documentation       Arquivo simples para requisições HTTP em APIs
Library             RequestsLibrary
Resource            ./usuarios_keywords.robot
Resource            ./login_keywords.robot
Resource            ./produtos_keywords.robot

* Variables *


* Test Cases *
Cenario: GET todos os usuarios 200
    [tags]      GET
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"
    Printar Conteudo Response

Cenario: POST cadastrar usuario 201
    [tags]      POST
    Criar Sessao
    POST Endpoint /usuarios
    Validar Status Code "201"
    Validar Se Mensagem Contem "sucesso"

Cenario: PUT editar usuario 200
    [tags]      PUT
    Criar Sessao
    PUT Endpoint /usuarios
    Validar Status Code "200"

Cenario: DELETE deletar usuario 200
    [tags]      DELETE
    Criar Sessao
    DELETE Endpoint /usuarios
    Validar Status Code "200"

Cenario: POST realizar login 200
    [tags]      POSTLOGIN
    Criar Sessao
    POST Endpoint /login
    Validar Status Code "200"

Cenario: POST criar produto 201
    [tags]      POSTPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"

Cenario: DELETE Excluir Produto 200
    [tags]      DELETEPRODUTO
    Criar Sessao
    Fazer Login e Armazenar Token
    Criar um Produto e Armazenar ID
    DELETE Endpoint /produtos
    Validar Status Code "200"

Cenario: POST Criar Usuario de Massa Estatica 201
    [tags]      POSTUSUARIOESTATICO
    Criar Sessao
    Criar Usuario Estatico Valido
    Validar Status Code "201"

* Keywords *
Criar Sessao
    Create Session          serverest           http://localhost:3000/
