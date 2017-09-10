parser grammar IslandsParser;

options { tokenVocab = IslandsLexer; }

htmlDocument
    : htmlElement* EOF
    ;

htmlElement
    : OPEN NAME htmlAttribute* CLOSE
      htmlContent
      OPEN SLASH NAME CLOSE
    | OPEN NAME htmlAttribute* (SLASH_CLOSE | CLOSE)
    | script
    ;

htmlContent
    : HTML_TEXT? (htmlElement HTML_TEXT?)*
    ;

htmlAttribute
    : NAME (EQUALS ATTRIBUTE)?
    ;

script
    : SCRIPT_OPEN SCRIPT_BODY+ SCRIPT_CLOSE
    ;