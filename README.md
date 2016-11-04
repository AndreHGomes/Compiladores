
#PROJETO 2: CONSTRUCAO DE UM COMPILADOR



Nome do Projeto/Linguagem:
	F4A#

Membros do Grupo e papeis:
	Gerente de Projetos: Andre Henrique Gomes.
	Projetista da Linguagem: Andre Henrique Gomes.
	Arquiteto de Sistema: Andre Henrique Gomes.
	Testador: Andre Henrique Gomes.

Caracteristicas da Linguagem:

	Os tipos da linguagem proposta foram baseados nos tipos basicos da linguagem Java.
	
	Tipos:

		Integer: representa valores inteiros, caracterizado por  um numero sem ponto. Ex.: 		1, 2, 3, 99999.
		
		Double: representa valores com uma parte inteira e uma parte recional, 				caracterizado por numeros searados por um ponto. Ex.: 2.0, 9.8, 1.9878.

		String: reresenta um conjunto de caracteres, caracterizado por um conjunto de 			caracteres entre aspas duplas. Ex.: “Andre” , “123” , “I love Inthernet Explorer” .
		
		Char: representa um caracter apenas, caracterizado por um caracter entre aspas 			simples. Ex.: ‘a’ , ‘b’, ‘c’, ‘d’.

		Boolean: representam valores booleanos iguais a verdadeiro ou falso, são 			caracterizdos pelas palavras TRUE  e FALSE, escritas em letras maiusculas, 			respectivamente.

Tratamento de Tipos:

		Atribuicao: feita usando um identificador já declarado e um valor separados pelo 		sinal de  igualdade ( = ). Ex.: a = 4,  b = TRUE.

		Declaracao: define o tipo de uma variavel, segue a seguinte regra sintatica:
		<tipo> identificador ou <tipo> identificador1, identificador2,… , identificadorN.
		Ex.: <Integer> a, <Boolean> b, g, h.
		
		Coercao: quando possível a coecao e feita de maneira automatica e segue a regra de 		sempre respeitar o tipo do valor a esquerda da atribuicao. 
		Ex.:  <Integer> a
			a = 9.99999  == > a recebera o valor inteiro 9.


Escopo:
		
		A linguagem apresenta escopo estatico.


Tratamento de String:

		<Integer> tamanho = length(“String”);

		Retorna o tamanho da String passada como parametro, o tamanho e um inteiro.

		<String> string3 = concat(“String1”, “String2”);
		
		Retorna uma nova String igual a concatenacao das duas Strings passadas como 			parametro, respeitando a ordem dos parametros.


IF THEN ELSE:

		Representa um desvio condicional, segue a seguinte sintaxe:


		IF (condicao booleana) THEN {

			trecho de codigo 1;
		}
		ELSE {
			
			trecho de codigo 2;
		}


WHILE:

		Representa um loop com uma condicao de parada, a condicao e verificada a cada vez 		que o loop e efetuado.

		WHILE (condicao booleanda) {
			
			trecho de codigo;
		}

	
 Funcoes:

		Definidas segundo a seuinte regra sintatica:

		<tipo do retorno> identificador(parametro1, …, parametroN){
			
				trecho de codigo;
				return retorno;
		}

Operacoes matematica:

		Sao realizadas entre numeros do tipo Integer e/ou  Double, sendo soma representado 		pelo sinal +, subtracao representado pelo sinal -, multiplicacao pelo sinal *  e divisao 		pelo sinal /.

Operacoes de Comparacao:

		Servem para comparar duas variaveis do mesmo tipo e retornam um Boolean como 		resultado. As comparacoes podem ser: igual ===, diferente !=, maior do que >>, 			menor do que <<, maior igual >= ou menor igual <=.


Pontos a serem implementados no projeto:

		+1 pontos: proposta de nova linguagem (mínimo dois tipos, funções, laços e 			condicionais)
		+1 ponto: tratamento de strings
		+2 pontos: interpretador
