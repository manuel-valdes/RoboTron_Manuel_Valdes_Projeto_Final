* Settings *
Documentation               Keywords e variaveis para ações do endpoint de produtos
Resource                    ../support/base.robot


* Variables *
${token_auth}               Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZ1bGFub0BxYS5jb20iLCJwYXNzd29yZCI6InRlc3RlIiwiaWF0IjoxNjU3NjQzMTUyLCJleHAiOjE2NTc2NDM3NTJ9.K8zYu6CRw1oUWsOC40qybdH-ew8atZDKOozvAXircVc

* Keywords *
GET Endpoint /produtos
    ${response}             GET On Session          serverest               /produtos
    Set Global Variable     ${response}

GET Endpoint /produtos/_id
    ${response}             GET On Session          serverest               /usuarios/${id_produto}
    Set Global Variable     ${response}

POST Endpoint /produtos
    &{header}               Create Dictionary       Authorization=${token_auth}   
    ${response}             POST On Session         serverest               /produtos                           data=${produtos}            headers=${header}
    ${id_produto}           Set Variable            ${response.json()["_id"]}
    Log to console          Response: ${response.content}   
    Set Global Variable     ${response}
    Set Global Variable     ${id_produto}

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