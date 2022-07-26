* Settings *
Documentation           Arquivo de testes para library Python
Library                 library_python.py


* Test Cases *
Cenario: Teste library 1
    ${json}             Get Endpoint Usuarios Tantas Vezes          ${1}
    Log To Console      ${json}

Cenario: Teste library 2
    ${users}            Pegar Quantidade De Usuarios Cadastrados
    Log To Console      ${users}