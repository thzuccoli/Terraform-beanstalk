FROM python:3                 
# imagem base da aplicação em python

ENV PYTHONDONTWRITEBYTECODE=1
# ação de melhorar a performance do python

ENV PYTHONUNBUFFERED=1
# jogar todas as saidas do python para o console (evitar travamento)

WORKDIR /home/ubuntu/tcc/
# diretorio de trabalho

COPY . /home/ubuntu/tcc/
# ação copiar todo o conteudo da pasta clientes-leo-api para o workdir

RUN pip install -r requirements.txt
# instalação das dependencias conforme info denttro arquivo

RUN sed -i "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \['*'\]/" setup/settings.py
# substituição da linha para permitir que acessamos de qualquer lugar (final da linha informa o caminho + arquivo a ser alterado)
# [] para não ser considerado caracterer especial, precisamos inserir a barra invertida

RUN python manage.py migrate
# configurando o banco de dados

RUN python manage.py loaddata clientes.json
# carregar os dados do banco

ENTRYPOINT python manage.py runserver 0.0.0.0:8000
# ação de iniciar o servidor atraves do comando do python no docker

EXPOSE 8000
# expondo o container na porta 8000