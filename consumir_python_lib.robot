* Settings *
Documentation           Arquivo de testes para library Python
Library                 library_python.py
Library                 RequestsLibrary
Resource                ./support/base.robot
Resource                ./keywords/usuarios_keywords.robot
Suite Setup             Criar Sessao

* Test Cases *
Cenario: Teste library 1
    ${json}                     Get Endpoint Usuarios Tantas Vezes          ${1}
    Log To Console              ${json}

Cenario: Teste library 2
    ${users}                    Pegar Quantidade De Usuarios Cadastrados
    Log To Console              ${users}

Cenario: Teste library 3
    ${products}                 Pegar Quantidade De Produtos Cadastrados
    Log To Console              ${products}

Cenario: Teste library 4
    [tags]              AAA
    ${resetar_usuarios}         Resetar Massa De Usuarios
    Log To Console              ${resetar_usuarios}

Cenario: Teste library 5
    [tags]
    ${resetar_produtos}         Resetar Massa De Produtos
    Log To Console              ${resetar_produtos}