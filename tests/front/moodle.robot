*** Settings ***
Library      Browser    auto_closing_level=KEEP
Library      CryptoLibrary    variable_decryption=True
Resource     Keywords.robot

*** Test Cases ***
Login to Moodle
    New Browser    chromium    headless=No
    New Page       https://moodle.metropolia.fi

    ${PageTitle}=    Get Title
    Should Be Equal As Strings    ${PageTitle}    Etusivu | Moodle

    # Klikataan "Kirjaudu"
    Click          xpath=(//a[@href='https://moodle.metropolia.fi/login/index.php' and text()='Kirjaudu'])[1]

    # Valitaan Metropolia-kirjautuminen
    Wait For Elements State    xpath=//div[@class='text_to_html' and text()='Metropolia']    visible
    Click          xpath=//div[@class='text_to_html' and text()='Metropolia']

    # Syötetään tunnukset (nämä löytyvät Keywords.robotista)
    Fill Text      id=username    ${Username}
    Fill Secret    id=password    $Password

    # Yritetään kirjautua (tämä epäonnistuu testeissä, mikä on ok)
    Click With Options    "Login"    delay=2 s
