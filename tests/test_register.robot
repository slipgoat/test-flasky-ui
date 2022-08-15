*** Settings ***
Documentation    Register Test Suite
Resource         ../resources/common_resources.robot
Test Setup       Run Keywords    Open Browser To Index Page
...                              Go To Register
...                              Wait Until Register Page Is Loaded
Test Teardown    Close All Browsers

*** Test Cases ***
Register User
    &{user} =   Prepare User Model For Registration
    Register    ${user}
    Wait Until Log In Page Is Loaded

Fail Register Existing User
    Check Warning Element Is Not Visible
    &{user} =   Prepare User Model For Registration
    Register     ${user}
    Wait Until Log In Page Is Loaded
    Go To Register
    Wait Until Register Page Is Loaded
    Register     ${user}
    Wait Until Warning Element Is Visible
    Check Warning Message    User ${user.username} is already registered.

Fail Register With Empty Field
    [Template]    Register With Empty Field Should Fail
    username
    password
    firstname
    lastname
    phone

Fail Register With Invalid Field
    [Template]    Register With Invalid Field Should Fail
    username    ${None}
    username    ${SPACE}
    username    !@#$%^&*()
    password    ${None}
    password    ${SPACE}
    password    !@#$%^&*()
    firstname   ${None}
    firstname   ${SPACE}
    firstname   !@#$%^&*()
    lastname    ${None}
    lastname    ${SPACE}
    lastname    !@#$%^&*()
    phone       ${None}
    phone       ${SPACE}
    phone       !@#$%^&*()
    phone       abcdefg

*** Keywords ***
Register With Empty Field Should Fail
    [Arguments]    ${field}
    &{user} =   Prepare User Model For Registration  ${field}=${Empty}
    Register     ${user}
    Check Register Page Is Open
    Check Warning Element Is Not Visible

Register With Invalid Field Should Fail
    [Arguments]    ${field}    ${value}
    &{user} =   Prepare User Model For Registration  ${field}=${value}
    Register     ${user}
    Check Register Page Is Open
    Check Warning Element Is Not Visible
    [Teardown]    Run Keywords    Go To Register
    ...                           Wait Until Register Page Is Loaded