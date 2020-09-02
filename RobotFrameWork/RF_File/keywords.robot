*** Settings ***
Library             SeleniumLibrary
Library             Collections
Library             RequestsLibrary
Library             JSONLibrary
Resource            variables.robot

*** Keywords ***
API Connect
    create session          api                 ${URL_API}
    ${response}             Get Request         api       /api.json
    Status Should be        200                 ${response}
    Set test variable       ${response.content}

Get Best Heroes
    ${jsonResponse}         To Json             ${response.content}
    log to console          ${jsonResponse}
    ${heroes}               Set variable       ${jsonResponse['Best Super heroe']}
    Set test variable       ${heroes}     

Heroes exists
    [Arguments]             ${nameOfHeroes}
    Should be true          """${nameOfHeroes}""" == """${heroes}"""

