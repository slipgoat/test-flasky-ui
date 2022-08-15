*** Settings ***
Documentation    Log In Test Suite
Resource         ../resources/common_resources.robot
Suite Setup      Prepare User
Test Setup       Run Keywords    Open Browser To Index Page
Test Teardown    Close All Browsers


*** Test Cases ***
Log In User
    Check Logged Out State
    Go To Log In
    Wait Until Log In Page Is Loaded
    Log In                   ${user.username}    ${user.password}
    Wait Until User Infomation Page Is Loaded
    Check Logged In State    ${user.username}

Log Out User
    Go To Log In
    Wait Until Log In Page Is Loaded
    Log In    ${user.username}    ${user.password}
    Wait Until User Infomation Page Is Loaded
    Log Out
    Wait Until Index Page Is Loaded
    Check Logged Out State

Failure Log In With Wrong Credentials
    [Template]    Log In With Wrong Credentials Should Fail
    ${user.username}    wrongpassword
    wrongusername       ${user.password}

Fail Log In With Empty Field
    [Template]    Log In With Empty Field Should Fail
    ${user.username}    ${Empty}
    ${Empty}            ${user.password}

Fail Log In With Invalid Field
    [Template]    Log In With Invalid Field Should Fail
    ${user.username}    ${None}
    ${user.username}    ${SPACE}
    ${user.username}    !@#$%^&*()
    ${None}             ${user.password}
    ${SPACE}            ${user.password}
    !@#$%^&*()          ${user.password}


*** Keywords ***
Log In With Wrong Credentials Should Fail
    [Arguments]    ${username}    ${password}
    Go To Log In
    Wait Until Log In Page Is Loaded
    Log In    ${username}    ${password}
    Wait Until Login Error Page Is Loaded
    Error Details Message Should Be    You provided incorrect login details

Log In With Empty Field Should Fail
    [Arguments]    ${username}    ${password}
    Go To Log In
    Wait Until Log In Page Is Loaded
    Log In         ${username}    ${password}
    Check Log In Page Is Open

Log In With Invalid Field Should Fail
    [Arguments]    ${username}    ${password}
    Go To Log In
    Wait Until Log In Page Is Loaded
    Log In         ${username}    ${password}
    Check Log In Page Is Open

Prepare User
    &{user}=    Register User Via Api
    Set Suite Variable    ${user}
