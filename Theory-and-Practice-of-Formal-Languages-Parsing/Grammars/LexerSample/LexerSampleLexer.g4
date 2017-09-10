lexer grammar LexerSampleLexer;

TagOpen:  '<';
TagClose:  '>';
Identifier:   [A-Za-z][A-Za-z]+;
Slash: '/';
Comment: '<!--' .*? '-->';
Whitespace: [ \r\n\t]+ -> channel(HIDDEN);