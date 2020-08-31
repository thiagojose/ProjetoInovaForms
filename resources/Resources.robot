*** Settings ***
Library     String
Library     SeleniumLibrary    run_on_failure=Nothing
Resource    CommonForms.robot
Resource    APIRequests.robot
Resource    variables/CommonVars.robot
Resource    POs/POPagina1.robot


*** Variables ***

${BROWSER}    chrome
${URL}        http://127.0.0.1:8000/

*** Keywords ***

Faz nada
    Pass Execution    template
