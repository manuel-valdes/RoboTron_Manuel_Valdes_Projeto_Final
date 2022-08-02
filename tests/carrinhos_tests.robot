* Settings *
Documentation       Arquivo de testes para o endpoint /carrinho
Resource            ../keywords/carrinhos_keywords.robot
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao


* Test Cases *
# Casos válidos
Cenario 40: GET carrinhos cadastrados 200
    [tags]      40
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenario 41: GET carrinho por ID 200
    [tags]      41
    Fazer Login e Armazenar Token
    Pegar Dados Carrinho Estatico Valido
    Criar Carrinho e Armazenar ID
    GET Endpoint /carrinhos/_id
    Validar Status Code "200"

Cenario 42: POST carrinho 201
    [tags]      42
    Fazer Login e Armazenar Token
    Pegar Dados Carrinho Estatico Valido
    POST Endpoint /carrinhos
    Validar Status Code "201"
    DELETE Carrinho Cancelar Compra

Cenario 43: DELETE carrinho cancelar compra 200
    [tags]      43
    Fazer Login e Armazenar Token
    DELETE Carrinho Cancelar Compra
    Validar Status Code "200"

Cenario 44: DELETE carrinho concluir compra 200
    [tags]      44
    Fazer Login e Armazenar Token
    POST Endpoint /carrinhos
    DELETE Carrinho Concluir Compra
    Validar Status Code "200"

#Casos inválidos
Cenario 45: GET carrinho inexistente 400
    [tags]      45
    GET Carrinho Inexistente
    Validar Status Code "400"

Cenario 46: POST carrinho sem produtos 400
    [tags]      46
    Pegar Dados Carrinho Estatico Sem Produtos
    POST Endpoint /carrinhos Vazio
    Validar Status Code "400"