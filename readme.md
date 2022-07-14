![](https://github.com/manuel-valdes/RoboTron_Manuel_Valdes_Projeto_Final/blob/develop/images/compass.png)

# 👾 Introdução

<div align=justify>

O Robot Framework é uma tecnologia amplamente utilizada para o desenvolvimento e automação de cenários de teste. Sua integração com a linguagem de programação Python possibilita a criação e execução de inúmeros testes de maneira simples e eficiente. A estrutura do Robot é baseada no conceito de KDT - Keyword Driven Testing -, através do qual os profissionais de QA podem criar cenários complexos por meio de palavras-chave específicas. Além disso, existem diversas bibliotecas que podem ser importadas e utilizadas em conjunto com o framework, ampliando o horizonte de possibilidades para aqueles que desejam se aventurar no universo dos testes. 

Como parte do projeto final do Programa de Bolsas da Compass.uol, recebi o desafio de aumentar a cobertura de testes da API pública [ServeRest](https://serverest.dev/) no contexto do back-end (testes de integração). Para isso, acompanhei uma série de aulas e tutoriais guiados pela equipe de QA da Compass, nos quais desenvolvi conceitos de lógica, boas práticas, sintaxe Git, Python e Robot, além de uma noção geral de estrutura de software e de metodologias ágeis. 

Ao longo dos próximos parágrafos, descreverei como fazer a instalação de todas as ferramentas necessárias para a execução de testes estruturados em Robot na sua própria máquina. Ainda, explicarei como funciona o código de maneira geral e quais resultados podem se esperar ao interagir com o repositório remoto do qual este README faz parte. Vale ressaltar que este documento busca explicar de maneira detalhada cada passo do processo, com o objetivo de ser o mais acessível possível para aqueles que estão tendo seu primeiro contato com o universo do Quality Assurance. Para quem deseja navegar entre os tópicos, considere o índice abaixo para acessar diretamente seus principais pontos de interesse: 

- [Instalações](#instalacao)
    - [VSCode](#vscode)
    - [Git](#git)
    - [Python](#python)
    - [Node.js](#node)
    - [Robot](#robot)
- [Baixando o repositório](#baixar-repositorio)
    - [Git Clone](#git-clone)
- [Interagindo com os arquivos no VSCode](#arquivos-vscode)
- [Rodando os testes no CMD](#cmd)
- [Ferramentas e extensões utilizadas](#ferramentas)
- [Referências](#referencias)
- [Agradecimentos](#agradecimentos)

# 💻 Instalações<a name="instalacao"></a>

Diversas ferramentas são necessárias para possibilitar a mágica por trás dos panos. Algumas delas simplesmente precisam estar instaladas no seu computador. Outras têm um papel ativo na forma com que interagimos com o código e executamos os cenários de teste. É importante ter em mente que seu computador vai fazer exatamente o que ele for instruído a fazer, portanto tente seguir os próximos passos com bastante atenção. Vai te poupar muito tempo (acredite em mim). 

Tentei estruturar o processo de instalação do mais básico para o mais "complexo". Todos eles são simples, mas alguns requerem que você simplesmente clique em um par de botões enquanto outros pedem um pouco mais de cuidado. Sem mais delongas, passamos ao primeiro.

## VSCode<a name="vscode"></a>

O [Visual Studio Code](https://code.visualstudio.com/) nada mais é que uma IDE (Integrated Development Environment), que por sua vez é uma palavra chique para "editor de textos". O VSCode facilita a visualização do código e integra diversas funcionalidade em um único ambiente. É através dele que seremos capazes de ler, editar e manipular nosso código. Sua instalação é extremamente simples. Acesse o [site oficial da plataforma](https://code.visualstudio.com/) e clique no botão "Download for Windows (Stable Build)". Siga os passos indicados no instalador, crie um atalho na Área de Trabalho (se achar necessário, eu particularmente acredito que facilita o acesso) e conclua o processo de instalação.

Em teoria, você já está pronto para explorar tudo que o VSCode tem a oferecer, porém antes de seguirmos para o próximo tópico, gostaria de aproveitar este espaço para indicar algumas extensões que facilitarão muito a sua vida. Você só vai entender a importância delas um pouco mais para a frente, mas para não ficar indo e voltando entre tópicos, prefiro centralizar tudo que se refere ao VSCode nesta seção. 

Para instalar extensões no VSCode, simplesmente clique em sua respectiva aba (aquela dos quadradinhos, no lado esquerdo superior da tela) e utilize a barra de pesquisas para encontrar as seguintes extensões:

    1. Robot Framework Intellisense - extensão que suporta o Robot no VSCode
    2. Tabnine AI Autocomplete - completa expressões e funções comuns da linguagem de programação que você está usando
    3. Matherial Icon Theme - permite que apareça uma imagenzinha do lado do seu arquivo indicando de que tipo ele é (.py, .robot, .png, etc.)

Também recomendo que você procure algum tema que você goste na aba de extensões. No VSCode, os temas são paletas de cores que facilitam a visualização de diferentes componentes do código e da própria IDE. Claro, não é nada obrigatório (mas deixa tudo mais legal).

## Git<a name="git"></a>

O Git é a principal tecnologia de versionamento do mercado. Através dele, equipes de dezenas de pessoas podem trabalhar no mesmo projeto de desenvolvimento sem gerar conflitos destrutivos ou perder informações e funcionalidades cruciais do sistema. O GitHub, site no qual nos encontramos neste momento, é basicamente uma plataforma de hospedagem de código que permite que, através de comandos Git, repositórios locais (aqueles que estão no seu computador) sejam armazenados de maneira remota, ou seja, na internet. 
  
Para que isso seja possível, é necessário que o Git esteja instalado na sua máquina. Os primeiros passos são simples: 

    1. Acesse o [site oficial do Git](https://git-scm.com/)
    2. Clique em "Download for Windows"
    3. Execute o arquivo 
    4. Siga todos os passos indicados no instalador 
  
OBS: O instalador passa por diversas páginas, mas as principais opções são padronizadas e já estão marcadas. Clique "Next" em tudo.

</div>