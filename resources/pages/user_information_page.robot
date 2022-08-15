*** Settings ***
Documentation    User Information Page
Library          SeleniumLibrary
Resource         header_component.robot
Variables        ../test_data/common_const.py

*** Variables ***
${HEADER}          css:.content h1
${USERNAME}        css:td#username
${FIRST NAME}      css:td#firstname
${LAST NAME}       css:td#lastname
${PHONE NUMBER}    css:td#phone

*** Keywords ***
Go To User Infomation Page
    Go To    ${URL}user

Wait Until User Infomation Page Is Loaded
    wait until element is visible   ${HEADER}
    element text should be          ${HEADER}   User Information

User Infomation Should Be
    [Arguments]    ${user}
    Element Text Should Be    ${USERNAME}        ${user.username}
    Element Text Should Be    ${FIRST NAME}      ${user.firstname}
    Element Text Should Be    ${LAST NAME}       ${user.lastname}
    Element Text Should Be    ${PHONE NUMBER}    ${user.phone}

