*** Settings ***
Library    RequestsLibrary
Library    Collections

*** Variables ***
${base_URL}   https://www.boredapi.com/api/activity

*** Test Cases ***
Get_activityInfo
        Create Session    mysession   ${base_URL}
   ${response}=  Get Request       mysession    /api/activity

  #Log To Console     ${response.status_code}
  #Log To Console     ${response.content}
  #VALIDATIONS
  ${status_code}=  convert to string  ${response.status_code}
  Should Be Equal  ${status_code}  200

  #this method to handle list of items
  ${contentTypeValue}=  Get From Dictionary    ${response.headers}  Content-Type
  Should Be Equal  ${contentTypeValue}  application/json; charset=utf-8