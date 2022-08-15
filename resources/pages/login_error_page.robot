*** Settings ***
Documentation    Login Error Page
Library          SeleniumLibrary
Resource         header_component.robot

*** Variables ***
${HEADER}           css:.content h1
${ERROR_DETAILS}    css:.content p

*** Keywords ***
Wait Until Login Error Page Is Loaded
    wait until element is visible   ${HEADER}
    element text should be          ${HEADER}   Login Failure

Error Details Message Should Be
    [Arguments]    ${error message}
    Element Text Should Be    ${ERROR_DETAILS}  ${error message}
