*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    ../libraries/Utils.py

*** Keywords ***


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

Muitos cliques seguidos
    [Arguments]    ${campos}
	FOR    ${id}    IN    @{campos}
	    Scroll Element Into View    ${id}
		Click Element    ${id}
	END


#Cria Dicionário

Atualiza dicionário
    [Arguments]  ${dicio}  ${chave}  ${novachave}  ${valorchave}
	Remove From Dictionary    ${DICIO}    ${CHAVE}
    Set To Dictionary    ${DICIO}    ${NOVACHAVE}    ${VALORCHAVE}

# Retorno de uso opcional, talvez remova depois
    Return From Keyword    ${DICIO}
