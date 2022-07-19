* Settings *
Documentation               Keywords e variaveis para ações do endpoint de carrinho
Resource                    ../support/base.robot


* Keywords *
GET Endpoint /carrinhos
    ${response}             GET On Session      serverest                     /carrinhos
    Set Global Variable     ${response}