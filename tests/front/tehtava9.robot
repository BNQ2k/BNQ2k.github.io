*** Settings ***
Library    RequestsLibrary

*** Variables ***
${BASE_URL}    http://localhost:3000

*** Test Cases ***
Onko palvelin pystyssä?
    [Documentation]    Testataan, että backend vastaa peruspyyntöön (200 OK)
    Create Session    oma_api    ${BASE_URL}
    ${vastaus}=       GET On Session    oma_api    /
    Should Be Equal As Strings    ${vastaus.status_code}    200

Käyttäjälistaus (API)
    [Documentation]    Testataan, että /api/users vaatii autentikaation (401 Unauthorized)
    Create Session    oma_api    ${BASE_URL}
    # Odotamme 401-virhettä, koska emme lähetä tokenia
    ${vastaus}=       GET On Session    oma_api    /api/users    expected_status=401
    Should Be Equal As Strings    ${vastaus.status_code}    401
