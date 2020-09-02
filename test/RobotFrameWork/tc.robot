*** Settings ***
Library             SeleniumLibrary
Library             Collections
Library             RequestsLibrary
Resource            RF_File/variables.robot
Resource            RF_File/keywords.robot

*** Test Cases ***
Find Api
    [Tags]                  TC01    API
    API Connect
    Get Best Heroes
    Heroes exists           Batman

LogIn to webPage
    [Tags]                  TC02    WEB
    Start browser
    Input logIn and password
    Click on logIn
    Validate Klingon language