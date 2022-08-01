* Settings *
Documentation               Keywords e variaveis para ações do endpoint de carrinho
Resource                    ../support/base.robot

* Variables *
${token_auth}               Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJlbWFpbCI6ImZ1bGFub0BxYS5jb20iLCJwYXNzd29yZCI6InRlc3RlIiwiaWF0IjoxNjU3NjQzMTUyLCJleHAiOjE2NTc2NDM3NTJ9.K8zYu6CRw1oUWsOC40qybdH-ew8atZDKOozvAXircVc

* Keywords *
GET Endpoint /carrinhos
    ${response}             GET On Session      serverest           /carrinhos
    Set Global Variable     ${response}

POST Endpoint /carrinhos
    &{header}               Create Dictionary       Authorization=${token_auth}
    ${response}             POST On Session         serverest       /carrinhos      data=${payload}                         headers=&{header}       expected_status=anything
    Log to console          Response: ${response.content}   
    Set Global Variable     ${response}

POST Endpoint /carrinhos Vazio
    &{header}               Create Dictionary       Authorization=${token_auth}
    ${response}             POST On Session         serverest       /carrinhos      data=${carrinho_sem_produtos}            headers=&{header}       expected_status=anything
    Log to console          Response: ${response.content}   
    Set Global Variable     ${response}

Pegar Dados Carrinho Estatico Valido
    ${json}                 Importar JSON Estatico                  _json_carrinhos_ex.json
    ${payload}              Set Variable                            ${json["carrinho_valido"]}
    Set Global Variable     ${payload}

Pegar Dados Carrinho Estatico Sem Produtos
    ${json}                     Importar JSON Estatico              _json_carrinhos_ex.json
    ${carrinho_sem_produtos}    Set Variable                        ${json["carrinho_sem_produtos"]}
    Set Global Variable         ${carrinho_sem_produtos}