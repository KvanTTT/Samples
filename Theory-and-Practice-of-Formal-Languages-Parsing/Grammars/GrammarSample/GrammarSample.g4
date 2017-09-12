grammar GrammarSample;

expr
    : expr '*' expr
    | expr '+' expr
  //| <assoc=right> expr '^' expr  // Right associativity rule 2^2^3
    | token '(' args ')'
    | token
    ;

args
    : expr (',' expr)*
    ;

token
    : ID
    | DIGIT
    ;

MULT: '*';
PLUS: '+';
LPAREN: '(';
RPAREN: ')';
COMMA: ',';
ID: [a-zA-Z]+;
DIGIT: [0-9]+;
SPACES: [ \r\n\t]+ -> channel(HIDDEN);

 