-- Cria o banco de dados (se não existir, embora o docker-compose já faça isso)
CREATE DATABASE IF NOT EXISTS radius_db;
USE radius_db;

-- ------------------------------
-- AQUI VEM O CONTEÚDO COMPLETO DO ARQUIVO schema.sql do FreeRADIUS
-- ------------------------------

-- Exemplo: Estrutura mínima de radcheck
CREATE TABLE `radcheck` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(64) NOT NULL DEFAULT '',
  `attribute` varchar(64) NOT NULL DEFAULT '',
  `op` char(2) NOT NULL DEFAULT ':=',
  `value` varchar(253) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `username` (`username`(32))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- E as demais tabelas: radreply, radgroupcheck, radgroupreply, radacct...