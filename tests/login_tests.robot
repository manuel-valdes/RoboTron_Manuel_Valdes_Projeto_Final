* Settings *
Documentation       Arquivo de testes para o endpoint /login
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao


* Test Cases *
#Casos válidos
Cenario 1: POST realizar login 200
    [tags]      1
    POST Endpoint /login
    Validar Status Code "200"

#Casos inválidos
Cenario 2: POST realizar login com usuario inexistente 401
    [tags]      2
    POST Invalido Endpoint /login
    Validar Status Code "401"

Cenario 3: POST login com senha invalida 401
    [tags]      3
    POST Endpoint /login Senha Invalida
    Validar Status Code "401"

Cenario 4: POST login sem senha 400
    [tags]      4
    POST Endpoint /login Sem Senha
    Validar Status Code "400"

Cenario 5: POST login sem email 400
    [tags]      5
    POST Endpoint /login Sem Email
    Validar Status Code "400"

Cenario 6: POST login com email invalido 400
    [tags]      6
    POST Endpoint /login Email Invalido
    Validar Status Code "400"

Cenario 7: POST login sem email e sem senha 400
    [tags]      7
    POST Endpoint /login Sem Email e Sem Senha
    Validar Status Code "400"