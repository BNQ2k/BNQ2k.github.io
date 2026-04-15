*** Settings ***
Library     Browser    auto_closing_level=KEEP
Library     CryptoLibrary    variable_decryption=True
Resource    Keywords.robot

*** Variables ***
${Username}     benkku
${Password}    crypt:krMYJMtGn3WwevcerwBXbrpn95soN9XIigQygBv9e3u8pIwbwhyOipTZ9WDPNjdARGI85vYr4TFu
${Message}      Capybara
${US_city}      Seattle
${Date}     10/11/2005

