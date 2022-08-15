*** Settings ***
Documentation    Users Test Suite
Resource         ../resources/common_resources.robot
Suite Setup      Prepare User
Test Setup       Run Keywords    Open Browser To Index Page
...                              Wait Until Index Page Is Loaded
...                              Go To Log In
...                              Wait Until Log In Page Is Loaded
Test Teardown    Close All Browsers


*** Test Cases ***
Get User Information
    Log In                   ${user.username}    ${user.password}
    Wait Until User Infomation Page Is Loaded
    User Infomation Should Be    ${user}

Get User Information Without Log In
    Go To User Infomation Page
    #Possible expected result due to absence of requirements
    Wait Until Log In Page Is Loaded

*** Keywords ***
Prepare User
    &{user}=    Register User Via Api
    Set Suite Variable    ${user}
