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


# Cenário 01 Cadastro Usuário: Cadastrar um novo usuário com sucesso

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


# Cenário 02 Cadastro Usuário: Falhar cadastro de um novo usuário com sucesso

E ao preencher os campos incorretamente e clicar em enviar
	Preencher campos de texto    campos=${DADOSCADASTROERRADOS}
	Preencher senha    campos=${DADOSSENHA2}
	Click Button    name=${NAMESUBMITCADASTRO}

Então serão exibidas "${erros}" mensagens de erro
    ${errosgerados}    Get Element Count    class=${CLASSEERRO}
    Should Be Equal As Integers    ${erros}    ${errosgerados}


# Cenário 01 Cadastro Projeto: Serão preenchidos os campos do projeto para o cadastro

Dado que esteja na tela de criação de projetos
    Page Should Contain    ${TEXTOPAGINAPROJETO}

Quando clicar em adicionar projeto
    Click Element    xpath=${XPATHADICIONARPROJETO}

Então serão exibidos e preenchidos os campos para descrever o projeto
    Wait Until Page Contains    ${TEXTONOVOPROJETO}
	Preencher campos de texto    campos=${DADOSPROJETO}
    Click Element    ${XPATHPROJETOANALISE}
	Preencher campos de select    campos=${DADOSPROJETOSELECT}

# Cenário 02 Cadastro Projeto: Incluir dados da Empresa

Quando clicar em Incluir dados da empresa
    Scroll Element Into View    ${XPATHICLUIREMPRESA}
	Mouse Over       ${XPATHICLUIREMPRESA}
    Click Element    xpath=${XPATHICLUIREMPRESA}

Então será exibido a tela de seleção de empresas
    Wait Until Page Contains Element    xpath=${XPATHINCLUIREMPRESA2}

E ao clicar em adicionar empresa
    Click Element    ${XPATHINCLUIREMPRESA2}

Então será exibido o formulário para incluir os dados da empresa
    ${randomcnpj}    Generate Random String    length=14    chars=[NUMBERS]
	Atualiza dicionário    dicio=${DADOSEMPRESA}    chave=${NAMECNPJEMPRESA}
...                        novachave=${NAMECNPJEMPRESA}    valorchave=${randomcnpj}
    Atualiza dicionário    dicio=${DADOSEMPRESA}    chave=${NAMEEMPRESAINSCM}
...                        novachave=${NAMEEMPRESAINSCM}    valorchave=${randomcnpj}
    Atualiza dicionário    dicio=${DADOSEMPRESA}    chave=${NAMEEMPRESAINSCES}
...                        novachave=${NAMEEMPRESAINSCES}    valorchave=${randomcnpj}
    Preencher campos de texto    campos=${DADOSEMPRESA}
	Preencher campos de select    campos=${DADOSEMPRESASELECT}
	Click Element    xpath=${XPATHEMPFILIAISOPEN}
	Click Element    xpath=${XPATHEMPRFILIAISCHECK}
	Click Element    ${XPATHEMPRESAINCCNAE}
	Click Element    ${XPATHEMPRESAALGUMCNAE}

E ao clicar em "Incluir dados da empresa"
    Click Element    ${XPATHADICIONAREMPRESA}

Então esta será incluída no formulário de cadastro geral
    Page Should Contain    ${TEXTO}
