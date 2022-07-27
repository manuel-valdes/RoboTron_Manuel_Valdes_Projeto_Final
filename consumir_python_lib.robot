* Settings *
Documentation           Arquivo de testes para library Python
Library                 library_python.py
Library                 RequestsLibrary
Resource                ./support/base.robot
Resource                ./keywords/usuarios_keywords.robot
Suite Setup             Criar Sessao

* Test Cases *
Cenario: Teste library 1
    ${json}             Get Endpoint Usuarios Tantas Vezes          ${1}
    Log To Console      ${json}

Cenario: Teste library 2
    ${users}            Pegar Quantidade De Usuarios Cadastrados
    Log To Console      ${users}

Cenario: Teste library 3
    ${products}         Pegar Quantidade De Produtos Cadastrados
    Log To Console      ${products}

Cenario: Teste library 4
    [tags]              AAA
    ${resetar_usuarios}         Resetar Massa De Usuarios
    Log To Console              ${resetar_usuarios}

# Cenario: DELETE usuarios criados
#     [tags]              OPA
#     ${usuariodoido}         Resetar Massa De Usuarios
#     FOR    ${INDEX}     IN RANGE    ${usuariodoido}
#         # IF
#         # Set Global Variable     ${rinoceronte}
#         # ${count}                Set Variable        0
#         # ${count}    =+ 1
#         # DELETE Endpoint /usuarios       
#         # Log To Console          ${response.content}
#         Log To Console          ${rinoceronte}
#     END
#     # ${response}             DELETE On Session   serverest           /usuarios/      
#     # Log to console          ${usuariodoido[0]}
#     # Set Global Variable     ${response}