*** Variables ***

${IDNOME}           nomeCoordenador
${NOME}             Fulano

${IDTELEFONE}       telefone
${TELEFONE}         3112344321

${IDCPF}            cpf
${CPF}              ${CPF_ESTATICO}

${NAMESENHA1}       password1
${SENHA1}           ${SENHA}

${NAMESENHA2}       password2
${SENHA2}           ${SENHA}

&{DADOSCADASTRO}    ${IDNOME}=${NOME}  ${IDTELEFONE}=${TELEFONE}
...                 ${IDCPF}=${CPF}  ${NAMEEMAIL}=${EMAIL}

&{DADOSCADASTROERRADOS}    ${IDNOME}=${EMPTY}  ${IDTELEFONE}=${EMPTY}
...                        ${IDCPF}=${EMPTY}  ${NAMEEMAIL}=${EMPTY}

&{DADOSSENHA1}             ${NAMESENHA1}=${SENHA1}  ${NAMESENHA2}=${SENHA2}
&{DADOSSENHA2}             ${NAMESENHA1}=${EMPTY}  ${NAMESENHA2}=${EMPTY}


${NAMESUBMITCADASTRO}      button
