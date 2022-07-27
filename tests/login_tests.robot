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
Cenario: POST realizar login com usuario inexistente 400
    [tags]      POSTLOGININEXISTENTE
    POST Invalido Endpoint /login
    Validar Status Code "401"
