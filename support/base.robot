* Settings *
Documentation               Arquivo simples para requisições HTTP em APIs
Library                     RequestsLibrary
Library                     Collections
Library                     OperatingSystem
Resource                    ./common/common.robot
Resource                    ./fixtures/dynamics.robot
Resource                    ./variables/serverest_variables.robot


* Keywords *
Criar Sessao
    Create Session          serverest           ${base_uri}