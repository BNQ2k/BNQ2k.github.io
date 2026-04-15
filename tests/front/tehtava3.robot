*** Settings ***
Library     Browser    auto_closing_level=KEEP
Resource    Keywords.robot

*** Test Cases ***
Test Web Form
    New Browser    chromium    headless=No
    New Page       https://www.selenium.dev/selenium/web/web-form.html
    Get Title      ==    Web form
    Type Text      [name="my-text"]        ${Username}    delay=0.1 s
    Type Secret    [name="my-password"]    $Password      delay=0.1 s
    Type Text      [name="my-textarea"]    ${Message}     delay=0.1 s
    Select Options By     .form-select    value  2      delay=2 s
    Type Text    [name="my-datalist"]    ${US_city}     delay=0.1 s
    Sleep   1s
    Uncheck Checkbox     id=my-check-1
    Sleep   0.2s
    Check Checkbox      id=my-check-2
    Sleep   0.2s
    Check Checkbox     id=my-radio-2
    Sleep   0.2s
    Fill Text       [name="my-date"]    ${Date}
    Sleep   2s
    [Teardown]    Close Browser
