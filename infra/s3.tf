resource "aws_s3_bucket" "beanstalk_deplays" {
  bucket = "${var.nome}-deplays"
}

resource "aws_s3_bucket_object" "docker" {
    depends_on = [aws_s3_bucket.beanstalk_deplays]     # depende da criação do bucket para não ter erro
  bucket = "${var.nome}-deplays"
  key    = "${var.nome}.zip"
  source = "${var.nome}.zip"
  etag = filemd5 ("${var.nome}.zip")     # ação para 
  # filemd5 realiza um hash do arquivo, um tipo de versionamento, caso haja alteração, a hash tbm ér alterada
}