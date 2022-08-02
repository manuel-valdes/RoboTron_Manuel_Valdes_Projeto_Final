* Settings *
Documentation               Keywords e variaveis para ações do endpoint de usuarios
Library                     ../library_python.py
Resource                    ../support/base.robot


* Keywords *
Gerar Dados Aleatorios
    ${dados_aleatorios}     Gerar Dados Aleatorios                  
    Log To Console          ${dados_aleatorios}

GET Endpoint /usuarios
    ${response}             GET On Session      serverest           /usuarios
    Set Global Variable     ${response}
    Log To Console          ${response.content}

GET Endpoint /usuarios/_id
    ${response}             GET On Session      serverest           /usuarios/${id_usuario}                     expected_status=anything
    Set Global Variable     ${response}
    Log To Console          ${response.content}

GET Endpoint /usuarios/_id ID Invalido
    ${response}             GET On Session      serverest           /usuarios/541                               expected_status=anything
    Set Global Variable     ${response}
    Log To Console          ${response.content}

POST Endpoint /usuarios
    ${response}             POST On Session     serverest           /usuarios                                    json=${payload}
    ${id_usuario}           Set Variable        ${response.json()["_id"]}
    Set Global Variable     ${id_usuario}
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Usuario Inicial
    &{payload}              Create Dictionary   nome=Marcos         email=fulano@qa.com       password=teste     administrador=true
    ${response}             POST On Session     serverest           /usuarios                 data=&{payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /usuarios Email Repetido
    ${response}             POST On Session     serverest           /usuarios         json=${email_repetido}     expected_status=anything
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /usuarios Sem Email
    ${response}             POST On Session     serverest           /usuarios         json=${user_sem_email}    expected_status=anything
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /usuarios Sem Nome
    ${response}             POST On Session     serverest           /usuarios         json=${user_sem_nome}     expected_status=anything
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /usuarios Sem Senha
    ${response}             POST On Session     serverest           /usuarios         json=${user_sem_senha}    expected_status=anything
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /usuarios Sem Administrador
    ${response}             POST On Session     serverest           /usuarios         json=${user_sem_adm}      expected_status=anything
    Log To Console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Endpoint /usuarios
    ${response}             PUT On Session      serverest           /usuarios/${response.json()["_id"]}         json=${payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Alterar Senha
    # ${nova_senha}           Gerar Dados Aleatorios                                  
    Set To Dictionary       ${payload}                              password=oooooooooo
    ${response}             PUT On Session      serverest           /usuarios/${response.json()["_id"]}         json=${payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Alterar Senha Invalida
    # ${nova_senha}           Gerar Dados Aleatorios                                  
    Set To Dictionary       ${payload}                              password=password com espaços 
    ${response}             PUT On Session      serverest           /usuarios/${response.json()["_id"]}         json=${payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Alterar Nome                               
    Set To Dictionary       ${payload}                              nome=Juca Ferreira
    ${response}             PUT On Session      serverest           /usuarios/${response.json()["_id"]}         json=${payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT Alterar Email                             
    Set To Dictionary       ${payload}                              email=emailfalso1234@gmail.com                
    ${response}             PUT On Session      serverest           /usuarios/${response.json()["_id"]}         json=${payload}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

PUT ID Invalido                             
    ${response}             PUT On Session      serverest           /usuarios/04I       json=${payload}         expected_status=anything
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios
    ${response}             DELETE On Session   serverest           /usuarios/${id_usuario}                     expected_status=anything
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /usuarios Invalido
    ${response}             DELETE On Session   serverest           /usuarios/99999
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

Validar Quantidade "${quantidade}"
    Should Be Equal         ${response.json()["quantidade"]}        ${quantidade}

Pegar Dados Usuario Estatico Valido
    ${json}                 Importar JSON Estatico                  _json_usuario_ex.json
    ${payload}              Set Variable                            ${json["user_valido"]}
    Set Global Variable     ${payload}

Pegar Dados Usuario Estatico Invalido
    ${json_invalido}        Importar JSON Estatico                  _json_usuario_ex.json
    ${email_repetido}       Set Variable                            ${json_invalido["user_invalido"]}
    Set Global Variable     ${email_repetido}  

Pegar Dados Usuario Estatico Sem Nome
    ${json_invalido}        Importar JSON Estatico                  _json_usuario_ex.json
    ${user_sem_nome}        Set Variable                            ${json_invalido["user_sem_nome"]}
    Set Global Variable     ${user_sem_nome}   

Pegar Dados Usuario Estatico Sem Email
    ${json_invalido}        Importar JSON Estatico                  _json_usuario_ex.json
    ${user_sem_email}       Set Variable                            ${json_invalido["user_sem_email"]}
    Set Global Variable     ${user_sem_email}

Pegar Dados Usuario Estatico Sem Senha
    ${json_invalido}        Importar JSON Estatico                  _json_usuario_ex.json
    ${user_sem_senha}       Set Variable                            ${json_invalido["user_sem_senha"]}
    Set Global Variable     ${user_sem_senha}

Pegar Dados Usuario Estatico Sem Administrador
    ${json_invalido}        Importar JSON Estatico                  _json_usuario_ex.json
    ${user_sem_adm}         Set Variable                            ${json_invalido["user_sem_administrador"]}
    Set Global Variable     ${user_sem_adm}

Validar Criar Usuario
    Should Be Equal         ${response.json()["message"]}           Cadastro realizado com sucesso
    Should Not Be Empty     ${response.json()["_id"]}

Criar Usuario e Armazenar ID
    POST Endpoint /usuarios
    Validar Criar Usuario
    ${id_usuario}           Set Variable        ${response.json()["_id"]}
    Log To Console          ID Usuario: ${id_usuario}
    Set Global Variable     ${id_usuario}