grammar Errors;

root
    : declaration* EOF
    ;

declaration
    : CLASS ID '{'  '}'
    | funcDeclaration
    ;

funcDeclaration
    : INT ID '(' arg (',' arg)+ ')' '{' '}'
    ;

arg
    : ID
    ;

CLASS: 'class';
LCURLY: '{';
RCURLY: '}';
LPAREN: '(';
RPAREN: ')';
INT: 'int';
ASSIGNE: '=';
SEMI: ';';
ID: [a-zA-Z][a-zA-Z0-9]*;
DIGIT: [0-9]+;
WHITESPACE: [ \r\n\t]+ -> channel(HIDDEN);
COMMENT: '//' ~[\r\n]* -> channel(HIDDEN);

