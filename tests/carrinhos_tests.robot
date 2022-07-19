* Settings *
Documentation       Arquivo de testes para o endpoint /carrinho
Resource            ../keywords/carrinhos_keywords.robot
Suite Setup         Criar Sessao


* Test Cases *
Cenario: GET carrinhos cadastrados 200
    [tags]      GETCARRINHO
    GET Endpoint /carrinhos
    Validar Status Code "200"
    Printar Conteudo Response