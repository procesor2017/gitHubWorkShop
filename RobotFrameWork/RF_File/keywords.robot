*** Settings ***
Library             SeleniumLibrary
Library             Collections
Library             RequestsLibrary
Library             JSONLibrary
Resource            variables.robot

*** Keywords ***
#----------------------- API ---------------------------------------------#
API Connect
    create session          api                 ${URL_API}
    ${response}             Get Request         api       /api.json
    Status Should be        200                 ${response}
    Set test variable       ${response.content}

Get Best Heroes
    ${jsonResponse}         To Json             ${response.content}
    log to console          ${jsonResponse}
    ${heroes}               Set variable        ${jsonResponse['Best Super heroe']}
    Set test variable       ${heroes}     

Heroes exists
    [Arguments]             ${nameOfHeroes}
    Should be true          """${nameOfHeroes}""" == """${heroes}"""

#------------------------------- Login ----------------------------------#
Start browser
    Open browser            ${URL_WEB}           ${BROWSER}

Input logIn and password
    Wait until element is visible       ${INPUT_USER_NAME}
    Input text                          ${INPUT_USER_NAME}      ${USER_NAME}
    Wait until element is visible       ${INPUT_PASSWORD}
    Input text                          ${INPUT_PASSWORD}       ${PASSWORD} 

Click on logIn
    Wait until element is visible       ${LOGIN}
    Click element                       ${LOGIN}