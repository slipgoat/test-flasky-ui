*** Settings ***
Documentation    Header Component
Library          SeleniumLibrary

*** Variables ***
${HEADER}           css:nav > h1 > a
${REGISTER LINK}    css:nav > ul a[href="/register"]
${LOG IN LINK}      css:nav > ul a[href="/login"]
${LOG OUT LINK}     css:nav > ul a[href="/logout"]
${USERNAME}         css:nav > ul span

*** Keywords ***
Go To Index Page
    Click Element   ${HEADER}

Go To Register
    Click Link  ${REGISTER LINK}

Go To Log In
    Click Link  ${LOG IN LINK}

Log Out
    Click Link  ${LOG OUT LINK}

Check Logged Out State
    Element Should Be Visible       ${REGISTER LINK}
    Element Should Be Visible       ${LOG IN LINK}
    Element Should Not Be Visible   ${LOG OUT LINK}
    Element Should not Be Visible   ${USERNAME}

Check Logged In State
    [Arguments]                     ${username value}
    Element Should Not Be Visible   ${REGISTER LINK}
    Element Should Not Be Visible   ${LOG IN LINK}
    Element Should Be Visible       ${LOG OUT LINK}
    Element Should Be Visible       ${USERNAME}
    Logged In Username Should Be    ${username value}

Logged In Username Should Be
    [Arguments]               ${username value}
    element text should be    ${USERNAME}   ${username value}

