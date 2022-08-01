* Settings *
Documentation       Arquivo de testes para o endpoint /login
Resource            ../keywords/login_keywords.robot
Suite Setup         Criar Sessao


* Test Cases *
#Casos válidos
Cenario: POST realizar login 200
    [tags]      POSTLOGIN
    POST Endpoint /login
    Validar Status Code "200"

#Casos inválidos
Cenario: POST realizar login com usuario inexistente 401
    [tags]      POSTLOGININEXISTENTE
    POST Invalido Endpoint /login
    Validar Status Code "401"

Cenario: POST login com senha invalida 401
    [tags]
    POST Endpoint /login Senha Invalida
    Validar Status Code "401"

Cenario: POST login sem senha 400
    [tags]
    POST Endpoint /login Sem Senha
    Validar Status Code "400"

Cenario: POST login sem email 400
    [tags]
    POST Endpoint /login Sem Email
    Validar Status Code "400"

Cenario: POST login com email invalido 400
    [tags]
    POST Endpoint /login Email Invalido
    Validar Status Code "400"

Cenario: POST login sem email e sem senha 400
    [tags]
    POST Endpoint /login Sem Email e Sem Senha
    Validar Status Code "400"