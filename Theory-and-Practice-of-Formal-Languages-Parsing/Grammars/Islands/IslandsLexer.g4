lexer grammar IslandsLexer;

channels { HtmlText }

SCRIPT_OPEN: '<script' .*? '>' ->pushMode(SCRIPT);
OPEN: '<' -> pushMode(TAG);
HTML_TEXT: ~'<'+ -> channel(HtmlText);

mode SCRIPT;

//SCRIPT_BODY: .*? '</script>';
SCRIPT_BODY: ~[<]+;
SCRIPT_CLOSE:   '</script>' -> popMode;
SCRIPT_DUMMY:         '<' -> type(SCRIPT_BODY);

mode TAG;

CLOSE: '>' -> popMode;
SLASH_CLOSE: '/>' -> popMode;
SLASH: '/';
EQUALS: '=' -> pushMode(ATTRIBUTE_MODE);
NAME: [a-z]+;
WHITESPACE: [ \t\r\n] -> channel(HIDDEN);

mode ATTRIBUTE_MODE;

ATTRIBUTE: ('"' ~[<"]* '"'
                    | '\'' ~[<']* '\'') -> popMode;