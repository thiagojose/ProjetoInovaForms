*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    ../libraries/Utils.py

*** Keywords ***


#NAO FUNCIONA
Preencher todos os campos
    [Arguments]    ${campos}    ${url}
	${elementostotal}    Get Element Count    tag=${INPUT}
	FOR    ${indice}    IN RANGE    1    ${elementostotal} + 1
		${campo}    Set Variable    //${INPUT}\[${indice}\]
        Preencher campos de texto complexo    ${campo}   ${campos}
    END

Preencher campos de texto complexo
	[Arguments]    ${campo}    ${campos}
	${tipocampo}    Get Element Attribute    ${campo}    type
	${evaluatetext}    comparaStrings    ${tipocampo}    ${TEXT}
	Run Keyword If    ${evaluatetext}
...    Input Text    ${campo}    ${campos}[${TEXT}]

# FIM NAO FUNCIONA

Preencher campos de texto
    [Arguments]    ${campos}
	FOR    ${id}    ${campo}  IN    &{campos}
	    Input Text    ${id}    ${campo}
	END

Preencher campos de select
    [Arguments]    ${campos}
	FOR    ${id}    ${label}  IN    &{campos}
        Select From List By Label    ${id}    ${label}
    END

Preencher senha
    [Arguments]    ${campos}
	FOR    ${id}    ${senha}  IN    &{campos}
        Input Password    ${id}    ${senha}
    END

Preencher checkbox
    [Arguments]    ${campos}
	FOR    ${id}    ${checkbox}  IN    &{campos}
        Select Checkbox    ${id}
    END

Preencher radiobutton
	[Arguments]    ${campos}
    FOR    ${id}    ${radio}  IN    &{campos}
	    Select Radio Button    ${id}    ${radio}
	END

#Cria Dicionário

Atualiza dicionário
    [Arguments]  ${dicio}  ${chave}  ${novachave}  ${valorchave}
	Remove From Dictionary    ${DICIO}    ${CHAVE}
    Set To Dictionary    ${DICIO}    ${NOVACHAVE}    ${VALORCHAVE}

# Retorno de uso opcional, talvez remova depois
    Return From Keyword    ${DICIO}
