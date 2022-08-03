* Settings *
Documentation           Arquivo de testes para library Python
Library                 library_python.py
Library                 RequestsLibrary
Resource                ./support/base.robot
Resource                ./keywords/usuarios_keywords.robot
Resource                ./keywords/login_keywords.robot
Suite Setup             Criar Sessao

* Test Cases *
Cenario: Teste library 1
    [tags]                      GETVEZES
    ${json}                     Get Endpoint Usuarios Tantas Vezes          ${1}
    Log To Console              ${json}

Cenario: Teste library 2
    [tags]                      GETUSUARIOS
    ${users}                    Pegar Quantidade De Usuarios Cadastrados
    Log To Console              ${users}

Cenario: Teste library 3
    [tags]                      GETPRODUTOS
    ${products}                 Pegar Quantidade De Produtos Cadastrados
    Log To Console              ${products}

Cenario: Teste library 4
    [tags]                      RESETUSUARIOS
    ${resetar_usuarios}         Resetar Massa De Usuarios                   ${39}
    Log To Console              ${resetar_usuarios}

Cenario: Teste library 5
    [tags]                      IDPRODUTOS
    # Fazer Login e Armazenar Token
    ${resetar_produtos}         Resetar Massa De Produtos                   
    Log To Console              ${resetar_produtos}

Cenario: Teste library 6
    [tags]                      DADOS
    ${dados_aleatorios}         Gerar Dados Aleatorios                      ${12}
    Log To Console              ${dados_aleatorios}