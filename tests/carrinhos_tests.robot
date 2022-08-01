* Settings *
Documentation       Arquivo de testes para o endpoint /carrinho
Resource            ../keywords/carrinhos_keywords.robot
Suite Setup         Criar Sessao


* Test Cases *
# Casos válidos
Cenario 33: GET carrinhos cadastrados 200
    [tags]      GETCARRINHO
    GET Endpoint /carrinhos
    Validar Status Code "200"

Cenario 34: POST carrinho 201
    [tags]      POSTCARRINHO
    Pegar Dados Carrinho Estatico Valido
    POST Endpoint /carrinhos
    Validar Status Code "200"

#Casos inválidos
Cenario 35: POST carrinho sem produtos 400
    [tags]      CARRINHOSEMPRODUTOS
    Pegar Dados Carrinho Estatico Sem Produtos
    POST Endpoint /carrinhos Vazio
    Validar Status Code "400"