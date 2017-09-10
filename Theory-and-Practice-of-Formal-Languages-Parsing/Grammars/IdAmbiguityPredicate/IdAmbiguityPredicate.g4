grammar IdAmbiguityPredicate;

varDeclaration
    : identifier {_input.Lt(-1).Text=="var"}? identifier ('=' expression)? ';'
    ;

expression
    : ID
    | DIGIT
    ;

identifier
    : ID
    ;

ID: [a-z]+;
DIGIT: [0-9]+;
SEMI: ';';
WHITESPACE: [ \r\n\t]+ -> channel(HIDDEN);
