*** Settings ***
Library             SeleniumLibrary
Library             Collections
Library             RequestsLibrary
Library             JSONLibrary
Resource            variables.robot

*** Keywords ***
API Connect
    create session          api                 ${URL_API}
    ${response}             Get Request         api             /
    Status Should be        200                 ${response}
    Set test variable       ${response.content}
    Log to console          ${response.content} 

Get Best Heroes
    Log to console          ${response.content} 
    ${jsonResponse}         To Json             ${response.content}
    ${heroes}               Set variables       ${jsonResponse[Best Super heroe]}
    Set test variable       ${heroes}     

Heroes exists
    [Arguments]             ${nameOfHeroes}
    Should be true          """${nameOfHeroes}""" == """${heroes}"""

