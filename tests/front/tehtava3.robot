*** Settings ***
Library     Browser    auto_closing_level=KEEP
Resource    Keywords.robot

*** Variables ***
${UPLOAD_FILE}      ${CURDIR}/testfile.txt

*** Test Cases ***
Test Web Form - Kaikki kentät
    New Browser    chromium    headless=No
    New Page       https://www.selenium.dev/selenium/web/web-form.html
    Get Title      ==    Web form

    # 1. Tekstikenttä
    Type Text      [name="my-text"]        ${Username}    delay=0.1 s

    # 2. Salasana
    Type Secret    [name="my-password"]    $Password

    # 3. Textarea
    Type Text      [name="my-textarea"]    ${Message}

    # 4. Dropdown (select) - valitaan "Two"
    Select Options By    [name="my-select"]    value    2
    Get Selected Options    [name="my-select"]    value    ==    2

    # 5. Dropdown (datalist)
    Fill Text    [name="my-datalist"]    New York
    Get Property    [name="my-datalist"]    value    ==    New York

    # 6. File input
    Upload File By Selector    [name="my-file"]    ${UPLOAD_FILE}

    # 7. Checkbox
    Get Checkbox State    \#my-check-1    ==    checked
    Get Checkbox State    \#my-check-2    ==    unchecked
    Check Checkbox    \#my-check-2
    Get Checkbox State    \#my-check-2    ==    checked

    # 8. Radio button
    Get Checkbox State    \#my-radio-1    ==    checked
    Check Checkbox    \#my-radio-2
    Get Checkbox State    \#my-radio-2    ==    checked
    Get Checkbox State    \#my-radio-1    ==    unchecked

    # 9. Color picker
    Fill Text    [name="my-colors"]    #000000
    Get Attribute    [name="my-colors"]    value    ==    #000000

    # 10. Date picker
    Fill Text    [name="my-date"]    2025-01-15
    Get Attribute    [name="my-date"]    value    ==    2025-01-15


    # 11. Lähetä lomake
    Click With Options    button    delay=2 s
    Get Text    id=message    ==    Received!
