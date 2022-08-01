* Settings *
Documentation       Arquivo de testes para o endpoint /produtos
Resource            ../keywords/produtos_keywords.robot
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao


* Test Cases *
# Casos válidos
Cenario 21: GET todos os produtos 200
    [tags]      GETPRODUTO
    GET Endpoint /produtos
    Validar Status Code "200"

Cenario 22: GET produto por ID 200
    [tags]      GETPRODUTOID
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    Criar Um Produto e Armazenar ID
    GET Endpoint /produtos/_id
    Validar Status Code "200"
    DELETE Endpoint /produtos

Cenario 23: POST criar produto 201
    [tags]      POSTPRODUTO
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    POST Endpoint /produtos
    Validar Status Code "201"
    DELETE Endpoint /produtos

Cenario 24: PUT editar produto 200
    [tags]      PUTPRODUTO
    Criar Dados Produto Valido
    POST Endpoint /produtos
    PUT Endpoint /produtos
    Validar Status Code "200"
    DELETE Endpoint /produtos

Cenario 25: DELETE excluir produto 200
    [tags]      DELETEPRODUTO
    Criar Dados Produto Valido
    DELETE Endpoint /produtos
    Validar Status Code "200"

# Casos inválidos
Cenario 26: GET produto por ID incorreto 400
    [tags]      OI
    Fazer Login e Armazenar Token
    Criar Dados Produto Valido
    Criar Um Produto e Armazenar ID
    GET Endpoint /produtos/_id Incorreto
    Validar Status Code "400"
    DELETE Endpoint /produtos

Cenario 27: POST produto sem autorização 401
    [tags]      ISSOAI
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    POST Endpoint /produtos Sem Autorizacao 
    Validar Status Code "401"

Cenario 28: POST produto sem nome 400
    [tags]      AAA
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    Pegar Dados Produto Estatico Sem Nome
    POST Produto Sem Nome 
    Validar Status Code "400"

Cenario 29: POST produto sem preco 400
    [tags]      OOO
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    Pegar Dados Produto Estatico Sem Preco
    POST Produto Sem Preco 
    Validar Status Code "400"

Cenario 30: POST produto sem descricao 400
    [tags]      III
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    Pegar Dados Produto Estatico Sem Descricao
    POST Produto Sem Descricao 
    Validar Status Code "400"

Cenario 31: POST produto sem quantidade 400
    [tags]      UUU
    Criar Dados Produto Valido
    Fazer Login e Armazenar Token
    Pegar Dados Produto Estatico Sem Quantidade
    POST Produto Sem Quantidade 
    Validar Status Code "400"

Cenario 32: POST produto com quantidade invalida 400
    [tags]      LAA
    Criar Dados Produto Quantidade Invalida
    Fazer Login e Armazenar Token
    POST Produto Com Quantidade Invalida
    Validar Status Code "400"