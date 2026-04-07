*** Settings ***
*** Settings ***
Library      Browser          auto_closing_level=KEEP
Library      CryptoLibrary    variable_decryption=True
Resource     Keywords.robot

*** Test Cases ***
Kivigymiin
    New Browser    chromium    headless=No
    New Page       http://localhost:5173/login.html

    Fill Text      id=login-username    ${Username}
    Fill Text      id=login-password    ${Password}
    Click          "Kirjaudu"
    Wait For Elements State    id=loginResponse    visible    timeout=1 s
