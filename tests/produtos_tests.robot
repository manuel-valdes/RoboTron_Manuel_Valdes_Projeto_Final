* Settings *
Documentation       Arquivo de testes para o endpoint /produtos
Resource            ../keywords/produtos_keywords.robot
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao


* Test Cases *
# Casos válidos
Cenario 27: GET todos os produtos 200
    [tags]      27
    GET Endpoint /produtos
    Validar Status Code "200"

Cenario 28: GET produto por ID 200
    [tags]      28
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    Criar Um Produto e Armazenar ID
    GET Endpoint /produtos/_id
    Validar Status Code "200"
    DELETE Endpoint /produtos

Cenario 29: POST criar produto 201
    [tags]      29
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"
    DELETE Endpoint /produtos

Cenario 30: PUT editar produto 200
    [tags]      30
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    PUT Endpoint /produtos
    Validar Status Code "200"
    DELETE Endpoint /produtos

Cenario 31: DELETE excluir produto 200
    [tags]      31
    Criar Dados Produto Valido
    DELETE Endpoint /produtos
    Validar Status Code "200"

# Casos inválidos
Cenario 32: GET produto por ID incorreto 400
    [tags]      32
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    Criar Um Produto e Armazenar ID
    GET Endpoint /produtos/_id Incorreto
    Validar Status Code "400"
    DELETE Endpoint /produtos

Cenario 33: POST produto sem autorização 401
    [tags]      33
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    POST Endpoint /produtos Sem Autorizacao 
    Validar Status Code "401"

Cenario 34: POST produto sem nome 400
    [tags]      34
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    Pegar Dados Produto Estatico Sem Nome
    POST Produto Sem Nome 
    Validar Status Code "400"

Cenario 35: POST produto sem preco 400
    [tags]      35
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    Pegar Dados Produto Estatico Sem Preco
    POST Produto Sem Preco 
    Validar Status Code "400"

Cenario 36: POST produto sem descricao 400
    [tags]      36
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    Pegar Dados Produto Estatico Sem Descricao
    POST Produto Sem Descricao 
    Validar Status Code "400"

Cenario 37: POST produto sem quantidade 400
    [tags]      37
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    Pegar Dados Produto Estatico Sem Quantidade
    POST Produto Sem Quantidade 
    Validar Status Code "400"

Cenario 38: POST produto com quantidade invalida 400
    [tags]      38
    Criar Dados Produto Quantidade Invalida
    Fazer Login e Armazenar Token
    POST Produto Com Quantidade Invalida
    Validar Status Code "400"

Cenario 39: DELETE resetar massa de produtos 200
    [tags]      39
    Fazer Login e Armazenar Token
    Resetar Massa De Produtos
    Validar Status Code "200"