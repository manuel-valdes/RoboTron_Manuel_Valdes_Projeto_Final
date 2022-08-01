* Settings *
Documentation               Keywords e variaveis para ações do endpoint de produtos
Resource                    ../support/base.robot


* Variables *
${token_auth}               Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZ1bGFub0BxYS5jb20iLCJwYXNzd29yZCI6InRlc3RlIiwiaWF0IjoxNjU3NjQzMTUyLCJleHAiOjE2NTc2NDM3NTJ9.K8zYu6CRw1oUWsOC40qybdH-ew8atZDKOozvAXircVc

* Keywords *
GET Endpoint /produtos
    ${response}             GET On Session          serverest               /produtos
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /produtos/_id
    ${response}             GET On Session          serverest               /produtos/${id_produto}
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

GET Endpoint /produtos/_id Incorreto
    ${response}             GET On Session          serverest               /produtos/999                       expected_status=anything
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

POST Endpoint /produtos
    &{header}               Create Dictionary       Authorization=${token_auth}   
    ${response}             POST On Session         serverest               /produtos                           data=${produtos}            headers=${header}
    ${id_produto}           Set Variable            ${response.json()["_id"]}
    Log to console          Response: ${response.content}   
    Set Global Variable     ${response}
    Set Global Variable     ${id_produto}

POST Endpoint /produtos Sem Autorizacao 
    ${response}             POST On Session         serverest               /produtos                           data=${produtos}            expected_status=anything            
    Log to console          Response: ${response.content}   
    Set Global Variable     ${response}

POST Produto Sem Nome
    &{header}               Create Dictionary       Authorization=${token_auth}   
    ${response}             POST On Session         serverest               /produtos                           data=${produto_sem_nome}    headers=${header}       expected_status=anything
    Log to console          Response: ${response.content}   
    Set Global Variable     ${response}

POST Produto Sem Descricao
    &{header}               Create Dictionary       Authorization=${token_auth}   
    ${response}             POST On Session         serverest               /produtos                           data=${produto_sem_descricao}    headers=${header}       expected_status=anything
    Log to console          Response: ${response.content}   
    Set Global Variable     ${response}

POST Produto Sem Preco
    &{header}               Create Dictionary       Authorization=${token_auth}   
    ${response}             POST On Session         serverest               /produtos                           data=${produto_sem_preco}   headers=${header}       expected_status=anything
    Log to console          Response: ${response.content}   
    Set Global Variable     ${response}

POST Produto Sem Quantidade
    &{header}               Create Dictionary       Authorization=${token_auth}   
    ${response}             POST On Session         serverest               /produtos                           data=${produto_sem_quantidade}   headers=${header}       expected_status=anything
    Log to console          Response: ${response.content}   
    Set Global Variable     ${response}

POST Produto Com Quantidade Invalida
    &{header}               Create Dictionary       Authorization=${token_auth}   
    ${response}             POST On Session         serverest               /produtos                           data=${produtos_invalidos}   headers=${header}       expected_status=anything
    Log to console          Response: ${response.content}   
    Set Global Variable     ${response}

PUT Endpoint /produtos
    &{header}               Create Dictionary       Authorization=${token_auth}
    ${response}             PUT On Session          serverest               /produtos/${id_produto}             data=${produtos}            headers=${header}                      
    Log to console          Response: ${response.content}
    Set Global Variable     ${response}

DELETE Endpoint /produtos
    &{header}               Create Dictionary       Authorization=${token_auth}  
    ${response}             DELETE On Session       serverest               /produtos/${id_produto}             headers=${header}
    Log to console          Response: ${response.content}   
    Set Global Variable     ${response}

Validar Criar Produto
   Should Be Equal         ${response.json()["message"]}                    Cadastro realizado com sucesso
   Should Not Be Empty     ${response.json()["_id"]}

Criar Um Produto e Armazenar ID
   POST Endpoint /produtos
   Validar Criar Produto
   ${id_produto}           Set Variable            ${response.json()["_id"]}
   Log To Console          ID Produto: ${id_produto}
   Set Global Variable     ${id_produto}

Pegar Dados Produto Estatico Sem Nome
    ${json_produtos}       Importar JSON Estatico                  _json_produtos_ex.json
    ${produto_sem_nome}    Set Variable                            ${json_produtos["produto_sem_nome"]}
    Set Global Variable    ${produto_sem_nome}

Pegar Dados Produto Estatico Sem Preco
    ${json_produtos}       Importar JSON Estatico                  _json_produtos_ex.json
    ${produto_sem_preco}   Set Variable                            ${json_produtos["produto_sem_preco"]}
    Set Global Variable    ${produto_sem_preco}

Pegar Dados Produto Estatico Sem Descricao
    ${json_produtos}            Importar JSON Estatico                  _json_produtos_ex.json
    ${produto_sem_descricao}    Set Variable                            ${json_produtos["produto_sem_descricao"]}
    Set Global Variable         ${produto_sem_descricao}

Pegar Dados Produto Estatico Sem Quantidade
    ${json_produtos}             Importar JSON Estatico                  _json_produtos_ex.json
    ${produto_sem_quantidade}    Set Variable                            ${json_produtos["produto_sem_quantidade"]}
    Set Global Variable          ${produto_sem_quantidade}