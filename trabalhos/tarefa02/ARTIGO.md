Aluno: Lucas d’Amaral Pires
Matrícula: 201420507811

### Introdução

Prolog é uma linguagem de programação lógica criada na França. Criada no início da década de 70 era usada principalmente na Europa e no Japão, com seu crescimento passou a ser a linguagem de programação lógica mais utilizada nos dias de hoje. Prolog é uma linguagem de programação que foge do modelo normal pois não trabalha tanto com números e contas mas sim com símbolos. 
Prolog vem do nome francês '*pro*grammation en *log*ique'.

Um programa em Prolog é basicamente definir um banco de dados de informações (*facts*) e regras (*rules*) que precisam ser seguidas. Estas informações então são guardadas. No terminal o usuário pode fazer *querys*, um tipo de pergunta, ao centro de informações. Prolog então checa a resposta a partir das regras e fatos dados e caso seja verdadeiro retorna a resposta true, caso contrário retorna false e caso seja uma atribuição retorna o valor da variável.

### Origens e Influências

Prolog foi primeira idealizado na França no início da década 70 e seu primeiro prótopio foi criado em 1972 por Alain Colmerauer and Phillipe Roussel usando a teoria criada por Robert Kowalski.
Foi influenciada pelas clausulas de Horn. Estas podem ser vistas na própria programação Prolog. Ao passar dos anos foram adicionados diversos funções a linguagem Prolog, porém é valído mencionar que por sua maior parte não há muita diferença entre uma versão moderna Prolog e a versão de 1972.
A estrutura básica do Prolog continua a mesma e não há nenhuma linguagem de programação derivada de Prolog até os dias de hoje.

### Classificação

Prolog é uma linguagem de programação lógica. Nela é possível fazer declarações de sentenças de fatos e regras que devem ser obedecidos. Todas as suas sentenças são em formatos lógicos.

Exemplos de fatos:
    
    a.                          Isso deve ser lido como a é verdadeiro
    pai(joao,paulo).            Isso pode ser lido como Joao é pai de Paulo.

Um exemplo de regra é:

    h :- a, b.                  Isso deve ser lido como "h é verdadeiro se a e b forem verdadeiros. 
    
Prolog apresenta um conjunto de instruções e regras dinâmicos, o que significa que durante a excução é possível adicionar regras ou excluí-las. Adicionar fatos ou excluí-los. Essa linguagem não apresenta tipos de variáveis. Ela trabalha somente com estruturas lógicas. 

Prolog é uma linguagem mais usada em inteligência artificial. Não é uma linguagem famosa e por ser muito diferente das linguagens de alto nível convencionais não apresenta uma grande quantidade de programadores que a utilizam. Isso limita onde é usada, porém podemos citar que é útil em sistemas de busca e problemas de backtraking.

### Comparação de Prolog com outras linguagens

Escrever um programa em prolog pode ser fácil e rápido. Tendo um conjunto de regras que o seu problema tem que obdecer é fácil traduzir isso para uma estrutura de regra em Prolog. Tendo um conjunto de fatos como verdadeiros e fácil traduzir para Prolog.

Ler um programa em Prolog não é fácil. Tendo um conjunto de fatos e regras é difícil descobrir quais eram as intenções do programador. Literalmente temos um documento com vários fatos e como esse fatos interegem entre si. Quase que como uma investigação policial, para entender um programa em Prolog precisamos saber ligar os fatos as regras para saber a história toda.

Antes de comparar as linguagens de programação, vamos destacar algumas particularidades do Prolog:
- Toda varíavel tem de começar com _ ou letra maiuscula
- Qualquer outra dado inicia-se com letra minúscula
- Usa somente sentenças de fatos e regras
- Tem como padrão resolver os problemas pelo uso de backtraking
- Finaliza a linha com um ponto final

Prolog é muito diferente de qualquer outro tipo de linguagem de programação. Não apresenta as estruturas comuns.
Por exemplo:

Prolog:

    add(X,Y,Z) :- Z is X+Y.
    
Terminal:

    ?- add(2,3,Z).
    Z = 5.
    ?- add(2,3,5).
    true.
    ?- add(2,3,4).
    false.

Também é importante destacar que para resolver problemas lógicos Prolog utiliza automaticamente o Backtraking. Como vemos no exemplo a seguir:

Prolog:

    mae(monica,juliana).
    mae(pedro,julia).
    mae(juliana,julia).
    pai(rafael,alfredo).
    pai(arthur,juliana).
    pais(X,Y):- pai(X,Y).
    pais(X,Y):- mae(X,Y).

Terminal:

    ?- pais(X,Y).
    X = rafael,
    Y = alfredo ;
    X = juliana,
    Y = arthur ;
    X = monica,
    Y = juliana ;
    X = pedro,
    Y = julia ;
    X = juliana,
    Y = julia.

A seguir faremos uma comparação de um programa em Prolog com um programa em C que tem a mesmas função. Neste caso dizer se um dia é ensolarado.

Prolog:
  
    ensolarado.


Terminal:

    ?- ensolarado.
    true.

C:

    int main()
    {
      int ensolarado;
      ensolarado = 1;
      if(ensolarado)
        printf("true");
      else
        printf("false");
    }

Saída: 

    true

### Conclusão

Prolog é uma um linguagem muito diferente das outras linguagens de programação oferecendo uma maneira única de realizar algumas ações de maneira rápida e eficaz. Ela usa sentenças lógicas. Não é importante a ordem que é escrito as regras e os fatos.
Basicamente um programa em Prolog é um banco de dados de fatos que tem leis que demonstram como os fatos vão interagir entre si, cabe ao usário então fazer perguntas para o programa e este responde de acordo com as informações fornecidas. 


### Bibliografia

*https://www.w3.org/2005/rules/wg/wiki/Pure_Prolog*

*http://www.doc.gold.ac.uk/~mas02gw/prolog_tutorial/prologpages/index.html#menu*

*http://www.cse.unsw.edu.au/~billw/dictionaries/prolog/dynamic.html*

*https://bernardopires.com/2013/10/try-logic-programming-a-gentle-introduction-to-prolog/*

*http://www.learnprolognow.org/lpnpage.php?pageid=online*

*https://www.cleverism.com/skills-and-tools/prolog/*

*http://www.mta.ca/~rrosebru/oldcourse/371199/prolog/history.html*

*http://cs.union.edu/~striegnk/learn-prolog-now/html/node39.html*
