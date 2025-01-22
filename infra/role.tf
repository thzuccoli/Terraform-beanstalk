resource "aws_iam_role" "beanstalk_ec2_role" {
  name = "beanstalk-ec2-role"

  # Terraform's vai pegar toda a policy abaixo e transformar no arquivo json
  # Terraform expression result to valid JSON syntax.
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })
}

resource "aws_iam_role_policy" "beanstalk_ec2_policy" {
  name = "beanstalk-ec2-policy"
  role = aws_iam_role.beanstalk_ec2_role.id

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "cloudwatch:PutMetricData",     # permissão para gravar as metricas no cloudwatch
          "ds:CreateComputer",         # permissao para criar o recurso computacional
          "ds:DescribeDirectories",        # permissão para modificiar, alterar os diretorios das instancias EC2
          "ec2:DescribeInstanceStatus",     # permissao para pegar os status das instancias EC2   
          "logs:*",            # permissão para ter acesso aos logs (problema na aplicação)
          "ssm:*",    # permissao para modificiar recursos computacionais (imagens, tipo de instancias e etc)  
          "ec2messages:*",       # permissao para comunicação entre maquinas EC2
          "s3:*",          # permissão para todas as funcionalidades do S3
          "ecr:GetAuthorizationToken",     # permissão para logar atraves de token no ECR
          "ecr:BatchCheckLayerAvailability",     # permissão para pegar as camadas da imagens 
          "ecr:GetDownloadUrlForLayer",     # Retorna um link do S3 (onde a Amazon guarda os arquivos) que direciona para os layers da imagem. Apenas os layers da imagem desejada podem ser acessados.   
          "ecr:GetRepositoryPolicy",   # Retorna as permisões do repositório desejado, no caso da nossa aplicação, se o repositório for privado e não tivermos permisão para acessar, teremos um erro que faz sentido.
          "ecr:DescribeRepositories",   # Retorna informações do repositório, como data da criação, tipo de criptografia, e mais algumas configurações.
          "ecr:ListImages",   # Retorna uma lista com todas as imagens dentro do repositório, podendo usar filtros para achar uma imagem escolhida.
          "ecr:DescribeImages",   # Retorna metadados das imagens no repositório, como data da criação da imagem, tamanho da imagem, o ID de registro, entre outras.
          "ecr:BatchGetImage",        # importação da imagem para a aplicação
        ]
        Effect   = "Allow"
        Resource = "*"
      },
    ]
  })
}

resource "aws_iam_instance_profile" "beanstalk_ec2_profile" {
  name = "beanstalk-ec2-profile"
  role = aws_iam_role.beanstalk_ec2_role.name
}