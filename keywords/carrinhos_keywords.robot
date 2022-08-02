* Settings *
Documentation               Keywords e variaveis para ações do endpoint de carrinho
Resource                    ../support/base.robot

* Variables *
${token_auth}               Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZ1bGFub0BxYS5jb20iLCJwYXNzd29yZCI6InRlc3RlIiwiaWF0IjoxNjU3NjQzMTUyLCJleHAiOjE2NTc2NDM3NTJ9.K8zYu6CRw1oUWsOC40qybdH-ew8atZDKOozvAXircVc

* Keywords *
GET Endpoint /carrinhos
    ${response}             GET On Session      serverest           /carrinhos
    Log To console          ${response.content}
    Set Global Variable     ${response}

GET Endpoint /carrinhos/_id
    ${response}             GET On Session      serverest           /carrinhos/${id_carrinho}
    Log To console          ${response.content}
    Set Global Variable     ${response}

GET Carrinho Inexistente
    ${response}             GET On Session      serverest           /carrinhos/9999                                        expected_status=anything
    Log To console          ${response.content}
    Set Global Variable     ${response}

POST Endpoint /carrinhos
    &{header}               Create Dictionary       Authorization=${token_auth}
    ${response}             POST On Session         serverest       /carrinhos      json=${carrinho_valido}                 headers=&{header}       expected_status=anything
    Log To Console          Response: ${response.content}   
    Set Global Variable     ${response}

POST Endpoint /carrinhos Vazio
    &{header}               Create Dictionary       Authorization=${token_auth}
    ${response}             POST On Session         serverest       /carrinhos      json=${carrinho_sem_produtos}            headers=&{header}       expected_status=anything
    Log To Console          Response: ${response.content}   
    Set Global Variable     ${response}

DELETE Carrinho Cancelar Compra
    &{header}               Create Dictionary       Authorization=${token_auth}
    ${response}             DELETE On Session       serverest       /carrinhos/cancelar-compra                               headers=&{header}       expected_status=anything
    Log To Console          Response: ${response.content}   
    Set Global Variable     ${response}

DELETE Carrinho Concluir Compra
    &{header}               Create Dictionary       Authorization=${token_auth}
    ${response}             DELETE On Session       serverest       /carrinhos/concluir-compra                               headers=&{header}       expected_status=anything
    Log To Console          Response: ${response.content}   
    Set Global Variable     ${response}

Pegar Dados Carrinho Estatico Valido
    ${json}                 Importar JSON Estatico                  _json_carrinhos_ex.json
    ${carrinho_valido}      Set Variable                            ${json["carrinho_valido"]}
    Set Global Variable     ${carrinho_valido}

Pegar Dados Carrinho Estatico Sem Produtos
    ${json}                     Importar JSON Estatico              _json_carrinhos_ex.json
    ${carrinho_sem_produtos}    Set Variable                        ${json["carrinho_sem_produtos"]}
    Set Global Variable         ${carrinho_sem_produtos}

Validar Criar Carrinho
    Should Be Equal             ${response.json()["message"]}       Cadastro realizado com sucesso
    Should Not Be Empty         ${response.json()["_id"]}

Criar Carrinho e Armazenar ID
    POST Endpoint /carrinhos
    Validar Criar Carrinho
    ${id_carrinho}              Set Variable        ${response.json()["_id"]}
    Set Global Variable         ${id_carrinho}
    Log To Console              ID Carrinho: ${id_carrinho}