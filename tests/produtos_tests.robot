* Settings *
Documentation       Arquivo de testes para o endpoint /produtos
Resource            ../keywords/produtos_keywords.robot
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao


* Test Cases *
Cenario: GET todos os produtos 200
    [tags]      GETPRODUTO
    GET Endpoint /produtos
    Validar Status Code "200"

Cenario: GET produto por ID 200
    [tags]      GETPRODUTOID
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    Criar Um Produto e Armazenar ID
    GET Endpoint /produtos/_id
    Validar Status Code "200"
    DELETE Endpoint /produtos

Cenario: GET produto por ID incorreto 400

Cenario: POST criar produto 201
    [tags]      POSTPRODUTO
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"
    DELETE Endpoint /produtos

Cenario: PUT editar produto 200
    [tags]      PUTPRODUTO
    Criar Dados Produto Valido
    POST Endpoint /produtos
    PUT Endpoint /produtos
    Validar Status Code "200"
    DELETE Endpoint /produtos

Cenario: DELETE excluir produto 200
    [tags]      DELETEPRODUTO
    Criar Dados Produto Valido
    DELETE Endpoint /produtos
    Validar Status Code "200"