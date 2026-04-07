*** Settings ***
Library    Browser         auto_closing_level=KEEP
Library    CryptoLibrary   variable_decryption=True    key_path=${CURDIR}/private_key.pvk

*** Test Cases ***
Kirjautuminen kryptatuilla tunnuksilla
    Evaluate       __import__('dotenv').load_dotenv()
    ${ENC_USER}=   Evaluate    __import__('os').getenv('MY_CRYPT_USER')
    ${ENC_PASS}=   Evaluate    __import__('os').getenv('MY_CRYPT_PASS')
    New Browser    chromium    headless=No
    New Page       http://localhost:5173/login.html
    Fill Text      id=login-username    ${ENC_USER}
    Fill Text      id=login-password    ${ENC_PASS}
    [Teardown]    Close Browser
