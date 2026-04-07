*** Settings ***
Library    Browser    auto_closing_level=KEEP

*** Test Cases ***
Kirjautuminen .env tunnuksilla
    Evaluate      __import__('dotenv').load_dotenv()
    ${USER}=      Evaluate    __import__('os').getenv('envTunnus')
    ${PASS}=      Evaluate    __import__('os').getenv('envSalis')
    New Browser   chromium    headless=No
    New Page      http://localhost:5173/login.html
    Fill Text     id=login-username    ${USER}
    Type Secret   id=login-password    $PASS
    [Teardown]    Close Browser
