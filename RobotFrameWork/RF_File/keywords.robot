***Settings***
Library             SeleniumLibrary
Library             RequestLibrary
Library             JSONLibrary
Resource            variables.robot

***Keywords***
API Connect
    create session      my_session              ${URL_API}
    ${headers}=         Create Dictionary       Accept=application/json     Content-Type=application/json   charset=utf-8

    ${response}=        Get Request             my_session                  my-endpoint                     headers=${headers}
	Log to console      ${response.status_code}