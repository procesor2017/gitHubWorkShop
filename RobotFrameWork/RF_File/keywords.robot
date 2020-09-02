*** Settings ***
Library             SeleniumLibrary
Library             Collections
Library             RequestsLibrary
Resource            variables.robot

*** Keywords ***
API Connect
    create session      api              ${URL_API}
    ${response}         Get Request     api         /
    Status Should be    200     ${response}


