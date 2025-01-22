module "Producao" {
    source = "../../infra"

    nome = "Producao"
    descricao =  "aplicacao de producao"
    max = 5
    maquina = "t2.micro" 
    ambiente = "ambiente-de-producao"
}