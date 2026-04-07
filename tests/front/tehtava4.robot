*** Settings ***
Library    Browser    auto_closing_level=KEEP

*** Variables ***
${URL}       http://localhost:5173/paivakirja.html
${DATE}      2026-04-01
${WEIGHT}    88
${SLEEP}     8
${MOOD}      AUTOMATISOITU TESTImerkintä!

*** Test Cases ***
Täytä ja tallenna merkintä
    New Browser    chromium    headless=No
    New Page       ${URL}
    Get Text       h2 >> text=Lisää uusi merkintä    ==    Lisää uusi merkintä
    Fill Text      id=date      ${DATE}
    Fill Text      id=weight    ${WEIGHT}
    Fill Text      id=sleep     ${SLEEP}
    Fill Text      id=mood      ${MOOD}
    Click          button[type="submit"]
    Click          button.get_entries
    [Teardown]    Close Browser
