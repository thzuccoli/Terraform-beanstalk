resource "aws_elastic_beanstalk_application" "aplicacao_beanstalk" {
  name        = var.nome
  description = var.descricao
}

resource "aws_elastic_beanstalk_environment" "ambiente_beanstalk" {
  name                = var.ambiente
  application         = aws_elastic_beanstalk_application.aplicacao_beanstalk.name
  solution_stack_name = "64bit Amazon Linux 2023 v4.4.2 running Docker"     # ferramenta que irá rodar no beanstalk

  setting {
    namespace = "aws:autoscaling:launchconfiguration"       # configuração das maquinas
    name      = "InstanceType"       # recurso configuravel sera instancia
    value     = var.maquina      # tipo da maquina em forma de variavel
  }

  setting {
    namespace = "aws:autoscaling:asg"       # configuração de autoscalling
    name      = "MaxSize"       # maximo de instancia que poderá ser criado no autoscalling group
    value     = var.max      # limite de maquinas para a escalabilidade conforme a necessidade da aplicação
  }

  setting {
    namespace = "aws:autoscaling:launchconfiguration"       # configuração de autoscalling
    name      = "IamInstanceProfile"       # instancia de perfil criada no arquivo role.tf
    value     = aws_iam_instance_profile.beanstalk_ec2_profile.name     # recurso referente ao perfil da instancia criada no arquivo role.tf
  }
}

resource "aws_elastic_beanstalk_application_version" "default" {
    depends_on = [aws_elastic_beanstalk_environment.ambiente_beanstalk, 
    aws_elastic_beanstalk_application.aplicacao_beanstalk, 
    aws_s3_bucket_object.docker]
  name        = var.ambiente
  application = var.nome
  description = var.descricao
  bucket      = aws_s3_bucket.beanstalk_deplays.id
  key         = aws_s3_bucket_object.docker.id
}