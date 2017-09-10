lexer grammar CaseInsensitivityRuntimeLexer;

Abstract:             'abstract';
BoolType:           'boolean';
BoolConstant:    'true' | 'false';

WHITESPACE: [ \r\n\t]+ -> channel(HIDDEN);