*** Settings ***
Library      Browser          auto_closing_level=KEEP
Library      CryptoLibrary    variable_decryption=True
Resource     Keywords.robot

*** Test Cases ***
Kivigymiin
    New Browser    chromium    headless=No
    New Page       http://localhost:5173/login.html

    Fill Text      id=login-username    ${Username}
    Sleep    0.67s
    Fill Text      id=login-password    ${Password}
    Click          "Kirjaudu"
    Sleep   1s
    [Teardown]    Close Browser
