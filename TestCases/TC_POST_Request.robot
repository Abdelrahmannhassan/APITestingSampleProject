*** Settings ***
Library    RequestsLibrary
Library    Collections


*** Variables ***
${base_Url}=    https://dummyjson.com/products

*** Test Cases ***
CustomerInformation
    Create Session    mysession     ${base_Url}

    ${body}=        Create Dictionary    title=Abdo
    ${header}=      Create Dictionary    Content-Type=application/json
    ${response}=    Post Request    mysession      /add     data=${body}        headers=${header}

    Log To Console    ${response.status_code}
    Log To Console    ${response.content}

    ${res_status}=      Convert To String    ${response.status_code}
    Should Be Equal    ${res_status}        200

    ${res_content}=     Convert To String    ${response.content}
    Should Contain        ${res_content}       Abdo