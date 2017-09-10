grammar IdAmbiguityGrammar;

varDeclaration
    : VAR identifier ('=' expression)? ';'
    ;

expression
    : ID
    | DIGIT
    ;

identifier
    : ID
    // Other conflicted tokens
    | VAR
    ;

VAR: 'var';
ID: [a-z]+;
DIGIT: [0-9]+;
SEMI: ';';
WHITESPACE: [ \r\n\t]+ -> channel(HIDDEN);
