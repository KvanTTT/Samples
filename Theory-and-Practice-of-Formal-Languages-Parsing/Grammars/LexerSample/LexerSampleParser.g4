parser grammar LexerSampleParser;

options { tokenVocab = LexerSampleLexer; }

root
    : .*? EOF
    ;