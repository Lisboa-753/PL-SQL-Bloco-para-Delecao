DECLARE
BEGIN
    -- Exclusão da tabela filha HISTORICO_AVALIACAO
    FOR I IN (
        SELECT HA.ROWID AS ROW_ID
          FROM SCHEMA_EXEMPLO.HISTORICO_AVALIACAO HA
         WHERE HA.ID_AVALIACAO IN (
                                   SELECT MAX(A.ID_AVALIACAO)
                                     FROM SCHEMA_EXEMPLO.AVALIACAO A
                                    WHERE EXISTS (
                                                      SELECT 1
                                                        FROM SCHEMA_EXEMPLO.AVALIACAO A2
                                                       WHERE A2.ID_ENTIDADE = A.ID_ENTIDADE
                                                         AND A2.ID_AVALIACAO <> A.ID_AVALIACAO
                                                  )
                                    GROUP BY A.ID_ENTIDADE
                                )
    )
    LOOP
        DELETE FROM SCHEMA_EXEMPLO.HISTORICO_AVALIACAO WHERE ROWID = I.ROW_ID;
    END LOOP;


    -- Exclusão da tabela principal AVALIACAO
    FOR J IN (
        SELECT A.ROWID AS ROW_ID
          FROM SCHEMA_EXEMPLO.AVALIACAO A
         WHERE A.ID_AVALIACAO IN (
                                   SELECT MAX(A1.ID_AVALIACAO)
                                     FROM SCHEMA_EXEMPLO.AVALIACAO A1
                                    WHERE EXISTS (
                                                      SELECT 1
                                                        FROM SCHEMA_EXEMPLO.AVALIACAO A2
                                                       WHERE A2.ID_ENTIDADE = A1.ID_ENTIDADE
                                                         AND A2.ID_AVALIACAO <> A1.ID_AVALIACAO
                                                  )
                                    GROUP BY A1.ID_ENTIDADE
                                )
    )
    LOOP
        DELETE FROM SCHEMA_EXEMPLO.AVALIACAO WHERE ROWID = J.ROW_ID;
    END LOOP;

END;
/
