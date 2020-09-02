*** Settings ***
Library             SeleniumLibrary
Library             Collections
Library             RequestsLibrary
Library             JSONLibrary
Resource            RF_File/variables.robot
Resource            RF_File/keywords.robot

*** Test Cases ***
Find Api
    API Connect
    Get Best Heroes
    Heroes exists           Batman