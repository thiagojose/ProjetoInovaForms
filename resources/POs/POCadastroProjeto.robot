*** Variables ***




${XPATHADICIONARPROJETO}    //a[@href="/projetos/cadastrar"]

${TEXTOPAGINAPROJETO}       Meus projetos
${TEXTONOVOPROJETO}         Novo projeto

# DADOS GERAIS DE CADASTRO

${IDPROJETOCARGO}           cargo_coordenador
${PROJETOCARGO}             ${TEXTO}

${IDPROJETOLATTES}          link_coordenador
${PROJETOLATTES}            ${URLGEN}

${IDPROJETOHORASSEM}        horas_dedicadas_coordenador
${PROJETOHORASSEM}          1

${IDPROJETORESP}            coordenador_resposabilidades
${PROJETORESP}              ${TEXTO}

${IDPROJETOTITULO}          titulo
${PROJETOTITULO}            ${TEXTO}

${IDPROJETOPCHAVES}         palavra_chave
${PROJETOPCHAVES}           ${TEXTO}

${IDPROJETOOBJETIVO}        objetivo
${PROJETOOBJETIVO}          ${TEXTO}

${IDPROJETOSETORSELECT}     setor
${PROJETOSETORSELECT}       Automotivo

${IDPROJETORELEVANCIA}      relevancia
${PROJETORELEVANCIA}        ${TEXTO}

${IDPROJETOINOVASELECT}     tipo_inovacao
${PROJETOINOVASELECT}       Processo

${IDPROJINOVAGRAUSELECT}    grau_inovacao
${PROJINOVAGRAUSELECT}      Radical

${IDPROJETOMETODOLOGIA}     metodologia
${PROJETOMETODOLOGIA}       ${TEXTO}

${IDPROJETOIMPACTO}         impactos
${PROJETOIMPACTO}           ${TEXTO}

${NAMEPROJETOVIABITEC}      visibilidade_tecnica
${PROJETOVIABITEC}          ${TEXTO}

${NAMEPROJETOVIABIECO}      visibilidade_economica
${PROJETOVIABIECO}          ${TEXTO}

${IDPROJETORECURSOST}       recursosTerceiros
${PROJETORECURSOST}         1

${IDPROJETORECURSOSP}       recursosProprios
${PROJETORECURSOSP}         1

${NAMEPROJETODESAFIOSP}     desafio_bolsistas
${PROJETODESAFIOSP}         ${TEXTO}

${XPATHPROJETOANALISE}      //form/div/div[7]/div[1]/div[1]/label[@for="analise_iel_sim"]

${NAMEPROJREGIONALSELECT}   regional_iel
${PROJREGIONALSELECT}       Alagoas - ( AL )


&{DADOSPROJETO}    ${IDPROJETOCARGO}=${PROJETOCARGO}  ${IDPROJETOLATTES}=${PROJETOLATTES}
...                ${IDPROJETOHORASSEM}=${PROJETOHORASSEM}  ${IDPROJETORESP}=${PROJETORESP}
...                ${IDPROJETOTITULO}=${PROJETOTITULO}  ${IDPROJETOPCHAVES}=${PROJETOPCHAVES}
...                ${IDPROJETOOBJETIVO}=${PROJETOOBJETIVO}  ${IDPROJETORELEVANCIA}=${PROJETORELEVANCIA}
...                ${IDPROJETOMETODOLOGIA}=${PROJETOMETODOLOGIA}  ${IDPROJETOIMPACTO}=${PROJETOIMPACTO}
...                ${NAMEPROJETOVIABITEC}=${PROJETOVIABITEC}  ${NAMEPROJETOVIABIECO}=${PROJETOVIABIECO}
...                ${IDPROJETORECURSOST}=${PROJETORECURSOST}  ${IDPROJETORECURSOSP}=${PROJETORECURSOSP}
...                ${NAMEPROJETODESAFIOSP}=${PROJETODESAFIOSP}

&{DADOSPROJETOSELECT}    ${IDPROJETOSETORSELECT}=${PROJETOSETORSELECT}
...                      ${IDPROJETOINOVASELECT}=${PROJETOINOVASELECT}
...                      ${IDPROJINOVAGRAUSELECT}=${PROJINOVAGRAUSELECT}
...                      ${NAMEPROJREGIONALSELECT}=${PROJREGIONALSELECT}

${XPATHENVIARPROJETO}       //form/div/button[@class="pp-btn pp-enabled"]

# DADOS CADASTRO DE Empresa

${XPATHICLUIREMPRESA}      //*[@id="link-empresa-selecionada"]
${IDINCLUIREMPRESA}        link-empresa-selecionada
${XPATHINCLUIREMPRESA2}    //*[@id="container-empresa-select"]/div/footer/button


${NAMENOMEEMPRESA}           nome_fantasia
${NOMEEMPRESA}               ${TEXTO}

${NAMECNPJEMPRESA}           cnpj
${CNPJEMPRESA}               11111111111111

${NAMERAZAOSOCIAL}           razao_social
${RAZAOSOCIAL}               ${TEXTO}

${NAMETIPOEMPSELECT}         tipo_empresa
${TIPOEMPSELECT}             Matriz

${NAMEEMPRESAENDERECO}       endereco
${EMPRESAENDERECO}           ${TEXTO}

${NAMEEMPRESAUFSELECT}       uf
${EMPRESAUFSELECT}           Minas Gerais - ( MG )

${IDEMPRESACEP}              cep
${EMPRESACEP}                32222222

${NAMEEMPRESACIDADE}         cidade
${EMPRESACIDADE}             ${TEXTO}

${NAMEEMPRESAINSCM}          inscricao_municipal
${EMPRESAINSCM}              ${TEXTO}

${NAMEEMPRESAINSCES}         inscricao_estadual
${EMPRESAINSCES}             ${TEXTO}

${NAMEEMPRESALINKCNPQ}       link_cnpq
${EMPRESALINKCNPQ}           ${URLGEN}

${NAMEEMPRESANFUNC}          numero_funcionarios
${EMPRESANFUNC}              5

${NAMEEMPRESASITE}           site
${EMPRESASITE}               ${URLGEN}

${NAMEEMPRESAPORTESELECT}    porte
${EMPRESAPORTESELECT}        Grande empresa: Receita operacional bruta anual ou renda anual: Maior que R$ 300 milhões

${NAMEEMPRESAFUNDACAO}       ano_fundacao
${EMPRESAFUNDACAO}           10101990

${NAMEEMPRESAMISSAO}         missao
${EMPRESAMISSAO}             ${TEXTO}

${NAMEEMPRESAVISAO}          visao
${EMPRESAVISAO}              ${TEXTO}

${XPATHEMPRFILIAISCHECK}     //*[@id="checkbox-estados-filiais"]/div[13]/label
${XPATHEMPFILIAISOPEN}       //*[@id="form-cadastrar-empresa"]/a

${NAMEEMPHISTORICOINOVA}     historico_inovacao
${EMPHISTORICOINOVA}         ${TEXTO}

${XPATHEMPRESAINCCNAE}       //*[@id="form-cadastrar-empresa"]/span/div/a/span

${XPATHEMPRESAALGUMCNAE}     //*[@id="cnae-empresa-6"]/a/div/div

&{DADOSEMPRESA}    ${NAMENOMEEMPRESA}=${NOMEEMPRESA}  ${NAMECNPJEMPRESA}=${CNPJEMPRESA}
...                ${NAMERAZAOSOCIAL}=${RAZAOSOCIAL}  ${NAMEEMPRESAENDERECO}=${EMPRESAENDERECO}
...                ${IDEMPRESACEP}=${EMPRESACEP}  ${NAMEEMPRESACIDADE}=${EMPRESACIDADE}
...                ${NAMEEMPRESAINSCM}=${EMPRESAINSCM}  ${NAMEEMPRESAINSCES}=${EMPRESAINSCES}
...                ${NAMEEMPRESALINKCNPQ}=${EMPRESALINKCNPQ}  ${NAMEEMPRESANFUNC}=${EMPRESANFUNC}
...                ${NAMEEMPRESANFUNC}=${EMPRESANFUNC}  ${NAMEEMPRESASITE}=${EMPRESASITE}
...                ${NAMEEMPRESAFUNDACAO}=${EMPRESAFUNDACAO}  ${NAMEEMPRESAMISSAO}=${EMPRESAMISSAO}
...                ${NAMEEMPRESAVISAO}=${EMPRESAVISAO}  ${NAMEEMPHISTORICOINOVA}=${EMPHISTORICOINOVA}

&{DADOSEMPRESASELECT}    ${NAMETIPOEMPSELECT}=${TIPOEMPSELECT}
...                      ${NAMEEMPRESAUFSELECT}=${EMPRESAUFSELECT}
...                      ${NAMEEMPRESAPORTESELECT}=${EMPRESAPORTESELECT}


${XPATHADICIONAREMPRESA}     //*[@id="form-cadastrar-empresa"]/footer/button

#
