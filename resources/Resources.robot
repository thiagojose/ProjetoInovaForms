*** Settings ***
Library     String
Library     SeleniumLibrary    run_on_failure=Nothing
Resource    CommonForms.robot
Resource    APIRequests.robot
Resource    variables/CommonVars.robot
Resource    POs/POCadastro.robot
Resource    POs/POCadastroProjeto.robot


*** Variables ***

${BROWSER}    chrome
${URL}        https://inovaforms.digitais.sistemaindustria.com.br/
${URL_CADASTRO}    https://inovaforms.digitais.sistemaindustria.com.br/registrar/

*** Keywords ***

Faz nada
    Pass Execution    template

Então é efetuado o login
    Input Text    ${NAMEUSERNAME}    ${EMAIL}
	Input Password    ${IDSENHA}    ${SENHA}
	Click Element    xpath=${XPATHLOGIN}

Então é encerrada a sessão
    Wait Until Page Contains Element    xpath=${XPATHLOGOUT}
    Click Link    xpath=${XPATHLOGOUT}


# Cenário 01 Cadastro: Cadastrar um novo usuário com sucesso


Dado que esteja na tela inicial do site InovaForms
    Wait Until Page Contains Element    tag=title
    Go to    ${URL}

Quando clicar em "Criar um novo Usuário"
    Click Element    xpath=${XPATHNOVOUSUARIO}

Então será redirecionado para a página de cadastro "${novo_usuario}"
    Wait Until Page Contains Element    tag=title
    Wait Until Page Contains    ${novo_usuario}

E ao preencher os campos corretamente e clicar em enviar
    Preencher campos de texto    campos=${DADOSCADASTRO}
	Preencher senha    campos=${DADOSSENHA1}
	Click Element    name=${NAMESUBMITCADASTRO}

Então será redirecionado para a página de login novamente
    Wait Until Page Contains Element    tag=title
    Page Should Contain Element    xpath=${XPATHLOGIN}


# Cenário 02 Cadastro: Falhar cadastro de um novo usuário com sucesso


E ao preencher os campos incorretamente e clicar em enviar
	Preencher campos de texto    campos=${DADOSCADASTROERRADOS}
	Preencher senha    campos=${DADOSSENHA2}
	Click Button    name=${NAMESUBMITCADASTRO}

Então serão exibidas "${erros}" mensagens de erro
    ${errosgerados}    Get Element Count    class=${CLASSEERRO}
    Should Be Equal As Integers    ${erros}    ${errosgerados}
