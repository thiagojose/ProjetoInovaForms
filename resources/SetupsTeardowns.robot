*** Settings ***
Library    String
Resource    APIRequests.robot

*** variables ***

${BROWSER}    chrome
${OPTIONS}    add_argument("--disable-dev-shm-usage"); add_argument("--headless"); add_argument("--no-sandbox")

*** Keywords ***

Abrir navegador
    Open Browser    ${URL}   ${BROWSER}    alias=${BROWSER}
#...                 options=${OPTIONS}
	Maximize Browser Window

Fechar navegador
    Run Keyword If Test Failed    Screenshot Personalizada
    Close Browser

Abrir navegador e logar
    Open Browser    ${URL}   ${BROWSER}    alias=${BROWSER}
#...                 options=${OPTIONS}
	Maximize Browser Window
	Então é efetuado o login

Deslogar e fechar o navegador
    Então é encerrada a sessão
	Run Keyword If Test Failed    Screenshot Personalizada
	Close Browser

Setus individuais
    Faz nada

Envia os resultados para o Jira
    Conecta na API do AioTests
    Cria um novo ciclo e envia os cenários como casos de teste


Screenshot Personalizada
	${agora}        Get Current Date    result_format=%d-%m-%Y-%H.%M.%S.%f
	${nome teste}    Split String    ${TEST NAME}    :
    Capture Page Screenshot    screenshot-${nome teste}[0]-${agora}.png
