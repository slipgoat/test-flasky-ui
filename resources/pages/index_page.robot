*** Settings ***
Documentation    Index Page
Library          SeleniumLibrary
Resource         header_component.robot
Variables        ../test_data/common_const.py

*** Variables ***
${HEADER}   css:.content h1

*** Keywords ***
Open Browser To Index Page
    open browser   ${URL}    ${BROWSER}
    Wait Until Index Page Is Loaded

Wait Until Index Page Is Loaded
    wait until element is visible   ${HEADER}
    element text should be          ${HEADER}   index page
