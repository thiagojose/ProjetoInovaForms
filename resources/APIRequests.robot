*** Settings ***
Library    RequestsLibrary
Library    DateTime
Library    String
Library    Collections

*** Variables ***

# Dados gerais do projeto
${APITOKEN}     AioAuth YjI0MzUwM2QtMzAzZS00YmMxLTllZTUtM2U5ZTI1Yzc4NjM5

${IDPROJETO}    ITIEL
${IDCICLO}      placeholder

${APPPSTEARDOWNRESULTS}    resultsimports

# Dados gerais para comunicação com a API
${APIURL}       https://tcms.aioreports.com/aio-tcms
${CASEURI}      /api/v1/project/${IDPROJETO}/testcycle/${IDCICLO}/import/results
${CYCLEURI}     /api/v1/project/${IDPROJETO}/testcycle/detail
${APIALIAS}     EnvioXml
&{TYPE}         type=JUnit

&{HEADERS}        Authorization=${APITOKEN}
#...               Content-Type=multipart/form-data
#...               Content-Type=text/xml
...               accept=application/json;charset=utf-8

# Dados referentes à criação de ciclo
${JSONCICLO}    ${CURDIR}\\variables\\newcyclesimp.json

# Este local é referente ao xml a ser enviado após ser convertido para Xunit
${LOCALRESULTADO}   ${CURDIR}\\..\\results\\junitoutput.xml


# Dados referentes à criação de casos
${CREATENEWRUN}      true
${ADDCASETOCYCLE}    true
${CREATECASE}        true

&{CASOBODY}       createNewRun=${CREATENEWRUN}  addCaseToCycle=${ADDCASETOCYCLE}
...               jiraProjectId=${IDPROJETO}  testCycleId=${IDCICLO}
...               createCase=${CREATECASE}
...               file=${LOCALRESULTADO}


*** Keywords ***

Conecta na API do AioTests
    Create Session    ${APIALIAS}    ${APIURL}  headers=${HEADERS}  verify=True

Cria um novo ciclo e envia os cenários como casos de teste
# Ver se consigo usar a tag abaixo para adicionar mais campos no post request, improvável
#    Set Suite Metadata    Tag    xmllocation

### Precisam ser definidos aqui já que não pode chamar keyword na declaração de variável
### Ah, tem que ver pq a api tá considerando 1 dia no passado, coloquei increment=1, mas isso é gambiarra
	${hoje}         Get Current Date    result_format=%Y-%m-%d    increment=1 day
	${agora}        Get Current Date    result_format=%d-%m-%Y às %H:%M
#	${resultadotestes}    Replace String    ${CURDIR}\\..\\..\\results    \\    \\\\
	${resultadopastatestes}    Replace String    ${LOG FILE}    \\${APPPSTEARDOWNRESULTS}\\log.html    ${EMPTY}
    ${resultadopastatestes}    Replace String    ${resultadopastatestes}    \\    \\\\

#	Fail
### Formata dados para criação de um novo ciclo
	${ciclobody}    Format String    ${JSONCICLO}
...                                  TITULOCICLO=Execução realizada em ${agora} para o projeto ${IDPROJETO}
...                                  OBJETIVOCICLO=Verificação diária, resultados estão em: ${resultadopastatestes}
...                                  DATAINICIO=${hoje}
...                                  DATAFIM=${hoje}
# ...                                IDRESPONSAVEL=2
# ...                                IDPASTA=123
# ...                                IDCOMPONENTE=3
# ...                                IDRELEASE=3
# ...                                TAGAUTOMACAO=tag
# ...                                IDTAG=123456

	${ciclobody}    To Json    ${ciclobody}
	# Precisa ser um dicionário para referenciar o id nos parâmetros
	${projectiddict}    Create Dictionary    jiraProjectId=${IDPROJETO}

### Executa um post para criação do novo ciclo
	${postciclo}    Post Request     alias=${APIALIAS}    uri=${CYCLEURI}
...	                                 headers=${HEADERS}
...                                  params=${projectiddict}
...                                  json=${ciclobody}

	${ciclocriado}    To Json     ${postciclo.text}

### Referencia o ciclo no qual serão executados os casos de teste
    Set Global Variable    ${IDCICLO}    ${ciclocriado}[key]
    Set Global Variable    ${CASEURI}    /api/v1/project/${IDPROJETO}/testcycle/${IDCICLO}/import/results
	Set To Dictionary    ${CASOBODY}   testCycleId    ${IDCICLO}

### Prepara o xml gerado pelo robot para evio
    ${xmlfile}    Get File For Streaming Upload    ${LOCALRESULTADO}
	${arquivo}    Create Dictionary    file=${xmlfile}
...               type=text/xml

### Executa e atualiza o status dos casos
    ${postcaso}      Post Request    alias=${APIALIAS}    uri=${CASEURI}
...	                 headers=${HEADERS}
...                  data=${CASOBODY}
...                  files=${arquivo}
...                  params=${TYPE}
	# Log To Console    ${postcaso.text}
	# Log To Console    ${CASOBODY}
