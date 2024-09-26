-- Primeiro, removendo a tabela se já existir
DROP TABLE ALUNO;

-- Criando a tabela aluno
CREATE TABLE ALUNO (
    ra NUMBER PRIMARY KEY,
    nome VARCHAR2(30)
);

-- Bloco PL/SQL para inserir dados
    
    DECLARE 
        vRa NUMBER := &ra;
        vNome VARCHAR2(30) := '&nome';
    
    BEGIN
        INSERT INTO aluno (ra, nome) VALUES (
            vRa,
            vNome
        );
        
        COMMIT;
        
    END;
    
//--------------------------------------//

CREATE OR REPLACE PROCEDURE prd_insert_aluno (
    p_ra aluno.ra%TYPE,
    p_nome aluno.nome%TYPE
) IS
BEGIN
    INSERT INTO aluno (ra, nome) VALUES (
        p_ra,
        p_nome
    );

    COMMIT;
END;

//--------------------------------------//

SELECT * FROM ALUNO;

CALL prd_insert_aluno(1111, 'DFADFASDF');
EXEC prd_insert_aluno(556688, 'SDFASDFASD');
EXECUTE prd_insert_aluno(46465, 'DKDKJSSF');

BEGIN
PF178.prd_insert_aluno(145588, 'FAFSFSDAGDSAFS');
END;


//--------------------------------------//

    CREATE OR REPLACE PROCEDURE PRD_UPDATE_ALUNO (
        P_RA ALUNO.RA%TYPE,
        P_NOME ALUNO.NOME%TYPE
        ) IS
    BEGIN
        UPDATE ALUNO
        SET
            NOME = P_NOME
        WHERE
            RA = P_RA;
            
        COMMIT;
    
    END;


//--------------------------------------//


select count(1) from tabela_de_vendas;

select * from tabela_de_vendas;

CREATE TABLE tabela_de_vendas as select * from pf1788.tabela_vendas;

//EXERCICIO: FAZER UM DELETE COM TABELA DE VENDAS COM COMMIT A CADA 200 REGISTROS

CREATE OR REPLACE PROCEDURE prd_delete_many IS
    contador NUMBER := 0;
    
BEGIN
    FOR X IN(
        SELECT
            *
        FROM
            tabela_de_vendas
            ) LOOP
                DELETE FROM tabela_de_vendas
                WHERE
                ordernumber = x.ordernumber;
                
                IF MOD(contador, 200) = 0 THEN
            COMMIT;
        END IF;
        contador := contador + 1;
        END LOOP;
    END;
/

//--------------------------------------//

//EXERCICIO: CRIA PRECEDURE PARA CRIA UM NOVO PEDIDO

DROP TABLE pedido;

SELECT * FROM pedido;

CREATE OR REPLACE PROCEDURE prd_pedido (
    p_cod_pedido             pedido.cod_pedido%TYPE,
    p_cod_pedido_relacionado pedido.cod_pedido_relacionado%TYPE,
    p_cod_cliente            pedido.cod_cliente%TYPE,
    p_cod_usuario            pedido.cod_usuario%TYPE,
    p_cod_vendedor           pedido.cod_vendedor%TYPE,
    p_dat_pedido             pedido.dat_pedido%TYPE,
    p_dat_cancelamento       pedido.dat_cancelamento%TYPE,
    p_dat_entrega            pedido.dat_entrega%TYPE,
    p_val_total_pedido       pedido.val_total_pedido%TYPE,
    p_val_desconto           pedido.val_desconto%TYPE,
    p_seq_endereco_cliente   pedido.seq_endereco_cliente%TYPE,
    p_status                 pedido.status%TYPE
) AS
BEGIN
    INSERT INTO pedido VALUES (
        p_cod_pedido,
        p_cod_pedido_relacionado,
        p_cod_cliente,
        p_cod_usuario,
        p_cod_vendedor,
        p_dat_pedido,
        p_dat_cancelamento,
        p_dat_entrega,
        p_val_total_pedido,
        p_val_desconto,
        p_seq_endereco_cliente,
        p_status
    );

    COMMIT;
END;

//--------------------------------------//

































