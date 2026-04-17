*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${BASE_URL}    http://localhost:3000/api
${USER}        benjamin.lepisto@metropolia.fi
${PASS}        Benkku2505

*** Test Cases ***
Käyttäjälistaus tokeninilla
    Create Session    backend    ${BASE_URL}
    ${resp}=    GET On Session    backend    /users    expected_status=401
    Status Should Be    401    ${resp}

Kirjautuminen tunnuksilla
    &{data}=    Create Dictionary    username=${USER}    password=${PASS}
    ${resp}=    POST On Session    backend    /users/login    json=${data}
    Status Should Be    200    ${resp}

    # Otetaan token talteen ja testataan haku
    ${token}=    Set Variable    ${resp.json()}[token]
    &{headers}=    Create Dictionary    Authorization=Bearer ${token}
    ${resp_me}=    GET On Session    backend    /users/me    headers=${headers}
    Status Should Be    200    ${resp_me}
