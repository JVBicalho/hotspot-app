#!/bin/bash

# --- Configuração do clients.conf (MikroTik) ---
sed -e "s/{{ MIKROTIK_IP }}/$MIKROTIK_IP/g" \
    -e "s/{{ RADIUS_SECRET }}/$RADIUS_SECRET/g" \
    /etc/freeradius/3.0/clients.conf.template > /etc/freeradius/3.0/clients.conf

# --- Configuração do sql.conf (Conexão DB) ---
sed -e "s/{{ DB_HOST }}/$DB_HOST/g" \
    -e "s/{{ DB_NAME }}/$DB_NAME/g" \
    -e "s/{{ DB_USER }}/$DB_USER/g" \
    -e "s/{{ DB_PASS }}/$DB_PASS/g" \
    /etc/freeradius/3.0/mods-available/sql.template > /etc/freeradius/3.0/mods-available/sql

# --- Configuração do default (Habilitar SQL no fluxo) ---
# Adiciona a linha "sql" nos blocos 'authorize', 'authenticate' e 'accounting'
sed -i '/authorize {/a \        sql' /etc/freeradius/3.0/sites-enabled/default
sed -i '/authenticate {/a \        sql' /etc/freeradius/3.0/sites-enabled/default
sed -i '/accounting {/a \        sql' /etc/freeradius/3.0/sites-enabled/default

# Executa o FreeRADIUS
/usr/sbin/freeradius -f -l stdout