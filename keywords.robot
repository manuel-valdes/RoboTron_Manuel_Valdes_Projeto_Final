* Settings *
Documentation       Arquivo simples para requisições HTTP em APIs
Library             RequestsLibrary

* Variables *


* Test Cases *
Cenario: GET Todos os Usuarios 200
    Criar Sessao
    GET Endpoint /usuarios
    Validar Status Code "200"

* Keywords *
Criar Sessao
    Create Session          serverest           https://serverest.dev

GET Endpoint /usuarios
    ${response}             GET On Session      serverest       /usuarios
    Set Global Variable     ${response}

Validar Status Code "${statuscode}"
    Should Be True          ${response.status_code} == ${statuscode}