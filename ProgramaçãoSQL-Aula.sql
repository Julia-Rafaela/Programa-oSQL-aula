-- 1) Fazer em SQL Server os seguintes algoritmos:
-- a) Dado um número inteiro. Calcule e mostre o seu fatorial. (Não usar entrada superior a 12)
 
DECLARE @n INT,
        @fat INT,
		@aux INT

SET @n = 1
SET @fat = 1

WHILE (@n BETWEEN 1 AND 12)
BEGIN 
    SET @fat = @fat * @n
    SET @n = @n + 1
    PRINT @fat
    PRINT @n
END
-- b) Dados A, B, e C de uma equação do 2o grau da fórmula AX2+BX+C=0. Verifique e mostre a
--existência de raízes reais e se caso exista, calcule e mostre. Caso não existam, exibir mensagem.
 
DECLARE @A FLOAT, @B FLOAT, @C FLOAT
DECLARE @delta FLOAT, @raizDelta FLOAT
DECLARE @x1 FLOAT 
DECLARE @x2 FLOAT
SET @A = 1
SET @B = -3
SET @C = 2
SET @delta = @B * @B - 4 * @A * @C
IF @delta > 0
BEGIN
    SET @raizDelta = SQRT(@delta)
    SET @x1 = (-@B + @raizDelta) / (2 * @A)
    SET @x2 = (-@B - @raizDelta) / (2 * @A)
    PRINT 'Existem duas raízes reais:'
    PRINT 'x1 = ' + CAST(@x1 AS VARCHAR(50))
    PRINT 'x2 = ' + CAST(@x2 AS VARCHAR(50))
END
ELSE IF @delta = 0
BEGIN
    SET @x1 = -@B / (2 * @A)
    PRINT 'Existe uma raiz real:'
    PRINT 'x = ' + CAST(@x1 AS VARCHAR(50))
END
ELSE
BEGIN
    PRINT 'Não existem raízes reais.'
END
 
-- c) Calcule e mostre quantos anos serão necessários para que Ana seja maior que Maria sabendo
--que Ana tem 1,10 m e cresce 3 cm ao ano e Maria tem 1,5 m e cresce 2 cm ao ano.
DECLARE @Ana DECIMAL(5,2),
        @Maria DECIMAL(5,2),
        @count INT

SET @Ana = 1.10
SET @Maria = 1.50
SET @count = 0

WHILE (@Ana<= @Maria)
BEGIN 
    SET @Maria = @Maria + 0.02  
    SET @Ana = @Ana + 0.03     
    SET @count = @count + 1
END

PRINT CAST(@count AS VARCHAR(MAX)) + ' anos'
 
--d) Seja a seguinte série: 1, 4, 4, 2, 5, 5, 3, 6, 6, 4, 7, 7, ...

DECLARE @num VARCHAR
DECLARE @num2 VARCHAR
DECLARE @cont1 INT

SET @num = 1
SET @num2 = 4
SET @cont1 = 1
WHILE (@cont1 < 5)
BEGIN
    PRINT @num + ','+ @num2 + ',' + @num2
    SET @num = @num + 1
	SET @num2 = @num2 + 1
	SET @cont1 = @cont1 + 1
END

--e) Considerando a tabela abaixo, gere uma massa de dados, com 50 registros, para fins de teste
--com as regras estabelecidas (Não usar constraints na criação da tabela)
CREATE DATABASE aulaprogsql
GO
USE aulaprogsql
GO
CREATE TABLE produto(
codigo		INT			 NOT NULL,
nome	    VARCHAR(30)	 NOT NULL,
valor       DECIMAL(7,2) NOT NULL,
vencimento  DATE         NOT NULL
PRIMARY KEY (codigo)
)
DECLARE @qtd INT = 1
DECLARE @codigo INT = 50001
 
WHILE (@qtd <= 50)
BEGIN
    DECLARE @nome VARCHAR(30)
    DECLARE @valor DECIMAL(7,2)
    DECLARE @vencimento DATE
 
    SET @nome = 'Produto ' + CAST(@qtd AS VARCHAR(5))
    SET @valor = RAND() * (100 - 10) + 10
    SET @vencimento = DATEADD(DAY, CAST(RAND() * (7 - 3) + 3 AS INT), GETDATE())

 
    INSERT INTO produto (Codigo, Nome, Valor, Vencimento) VALUES (@codigo, @nome, @valor, @vencimento)
 
    SET @qtd = @qtd + 1
    SET @codigo = @codigo + 1
END
 
SELECT Codigo, Nome, 'R$ ' + CAST(CAST(Valor AS DECIMAL(7,2)) AS VARCHAR(8)) AS Data_Vencimento, CONVERT(VARCHAR, Vencimento, 103) AS Vencimento
FROM produto