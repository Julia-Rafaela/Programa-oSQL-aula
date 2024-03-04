Exercícios:
1) Fazer em SQL Server os seguintes algoritmos:
a) Dado um número inteiro. Calcule e mostre o seu fatorial. (Não usar entrada superior a 12)
b) Dados A, B, e C de uma equação do 2o grau da fórmula AX2+BX+C=0. Verifique e mostre a
existência de raízes reais e se caso exista, calcule e mostre. Caso não existam, exibir mensagem.
c) Calcule e mostre quantos anos serão necessários para que Ana seja maior que Maria sabendo
que Ana tem 1,10 m e cresce 3 cm ao ano e Maria tem 1,5 m e cresce 2 cm ao ano.
d) Seja a seguinte série: 1, 4, 4, 2, 5, 5, 3, 6, 6, 4, 7, 7, ...
Escreva uma aplicação que a escreva N termos
e) Considerando a tabela abaixo, gere uma massa de dados, com 50 registros, para fins de teste
com as regras estabelecidas (Não usar constraints na criação da tabela)
Produto
Codigo Nome Valor Vencimento
INT (PK) VARCHAR(30) DECIMAL(7,2) DATE

• Código inicia em 50001 e incrementa de 1 em 1
• Nome segue padrão simples: Produto 1, Produto 2, Produto 3, etc.
• Valor, gerar um número aleatório* entre 10.00 e 100.00
• Vencimento, gerar um número aleatório* entre 3 e 7 e usando a função específica para
soma de datas no SQL Server, somar o valor gerado à data de hoje.

* Função RAND() gera números aleatórios entre 0 e 0,9999...
