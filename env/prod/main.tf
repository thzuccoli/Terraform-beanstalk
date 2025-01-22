module "Producao" {
    source = "../../infra"

    nome = "producao"
    descricao = "aplicacao-de-producao"
    max = 5
    ambiente = "ambiente-de-producao"
    maquina = "t2.micro"
}