*** Settings ***
Documentation    Register Page
Library          SeleniumLibrary
Resource         header_component.robot

*** Variables ***
${HEADER}               css:.content h1
${WARNING}              css:.flash
${USERNAME INPUT}       css:input#username
${PASSWORD INPUT}       css:input#password
${FIRST NAME INPUT}     css:input#firstname
${LAST NAME INPUT}      css:input#lastname
${PHONE NUMBER INPUT}   css:input#phone
${REGISTER BUTTON}      css:input[type="submit"]

*** Keywords ***
Wait Until Register Page Is Loaded
    Wait Until Element Is Visible    ${HEADER}
    Check Register Page Is Open

Check Register Page Is Open
    element text should be    ${HEADER}    Register

Register
    [Arguments]     ${create_user_model}
    input text      ${USERNAME INPUT}       ${create_user_model.username}
    input text      ${PASSWORD INPUT}       ${create_user_model.password}
    input text      ${FIRST NAME INPUT}     ${create_user_model.firstname}
    input text      ${LAST NAME INPUT}      ${create_user_model.lastname}
    input text      ${PHONE NUMBER INPUT}   ${create_user_model.phone}
    click button    ${REGISTER BUTTON}

Check Warning Element Is Not Visible
    Element Should Not Be Visible    ${WARNING}

Wait Until Warning Element Is Visible
    Wait Until Element Is Visible    ${WARNING}

Check Warning Message
    [Arguments]    ${text}
    Element Text Should Be    ${WARNING}    ${text}

