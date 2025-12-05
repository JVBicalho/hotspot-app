# Imagem base do FreeRADIUS
FROM freeradius/freeradius:latest

# Instala o cliente MySQL e dependências para a conexão com o DB
RUN apt-get update && apt-get install -y \
    libmysqlclient-dev \
    vim \
    && rm -rf /var/lib/apt/lists/*

# Habilita o módulo SQL
RUN ln -sf /etc/freeradius/3.0/mods-available/sql /etc/freeradius/3.0/mods-enabled/sql

# Define o script de inicialização
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Configurações customizadas serão montadas via volume no docker-compose
# Copia um script que lida com a substituição de variáveis
COPY clients.conf /etc/freeradius/3.0/clients.conf.template
COPY sql.conf /etc/freeradius/3.0/mods-available/sql.template
COPY default /etc/freeradius/3.0/sites-enabled/default.template

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]