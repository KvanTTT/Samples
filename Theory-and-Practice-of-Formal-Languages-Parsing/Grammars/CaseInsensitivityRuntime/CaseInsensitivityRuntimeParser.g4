parser grammar CaseInsensitivityRuntimeParser;

options { tokenVocab = CaseInsensitivityRuntimeLexer; }

rootRule
    : .*? EOF
    ;

