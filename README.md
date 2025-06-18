# Script de Exclusão de Avaliações Duplicadas

Este repositório contém um script PL/SQL que realiza a exclusão de registros duplicados em duas tabelas relacionadas: uma tabela de **avaliações** e uma tabela de **histórico de avaliações**.

## Objetivo

O objetivo do script é **manter apenas o registro mais recente de cada avaliação**, excluindo as versões duplicadas e mantendo o banco de dados mais limpo e organizado.

## Como funciona

O script executa dois passos principais:

1. **Remove registros mais novos do histórico de avaliações**
   - Para cada entidade (ex: nota), ele identifica se existem várias avaliações.
   - Se existirem, ele apaga os registros mais novos duplicados da tabela de histórico.

2. **Remove registros antigos da tabela principal de avaliações**
   - Depois do histórico, ele faz o mesmo processo na tabela de avaliações principal.

## Tecnologias usadas

- Oracle PL/SQL
- Bloco `DECLARE ... BEGIN ... END` com cursores (`FOR`)
- Comandos `DELETE` e `ROWID` para maior precisão na exclusão

## Observações

- O nome das tabelas e colunas foi **modificado para versões genéricas**, apenas para fins didáticos.
- Esse script pode ser adaptado para qualquer sistema que armazene múltiplas versões de avaliações por entidade.

## Exemplo de uso

Você pode executar esse script em um banco Oracle usando uma ferramenta como:

- SQL Developer
- TOAD
- DBeaver
- Linha de comando (`sqlplus`)

---

> ⚠️ Atenção: Faça sempre um backup antes de executar scripts que fazem exclusões no banco de dados.

## Autor

Desenvolvido por Gabriel Lisboa 👨‍💻
