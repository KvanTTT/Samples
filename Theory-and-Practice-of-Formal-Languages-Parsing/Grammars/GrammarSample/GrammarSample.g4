grammar GrammarSample;

expr
    : expr '*' expr
    | expr '+' expr
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

