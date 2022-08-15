*** Settings ***
Documentation    Log In Page
Library          SeleniumLibrary
Resource         header_component.robot

*** Variables ***
${HEADER}           css:.content h1
${USERNAME INPUT}   css:input#username
${PASSWORD INPUT}   css:input#password
${LOG IN BUTTON}    css:input[type="submit"]

*** Keywords ***
Wait Until Log In Page Is Loaded
    wait until element is visible   ${HEADER}
    Check Log In Page Is Open

Check Log In Page Is Open
    element text should be    ${HEADER}    Log In

Log In
    [Arguments]     ${username}  ${password}
    input text      ${USERNAME INPUT}   ${username}
    input text      ${PASSWORD INPUT}   ${password}
    click button    ${LOG IN BUTTON}

