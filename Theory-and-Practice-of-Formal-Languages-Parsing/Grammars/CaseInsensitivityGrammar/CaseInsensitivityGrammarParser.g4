parser grammar CaseInsensitivityGrammarParser;

options { tokenVocab = CaseInsensitivityGrammarLexer; }

rootRule
    : .*? EOF
    ;

