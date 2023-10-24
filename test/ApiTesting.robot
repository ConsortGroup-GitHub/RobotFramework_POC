*** Settings ***
Library    JSONLibrary
Library    RequestsLibrary
Library    Collections

*** Variables ***
# SCALAR Variable :
${Base_URL}              https://reqres.in/api

*** Test Cases ***
Quick Get Request Test
    Create Session    mysession    ${Base_URL}/users?page=2
    ${response}    GET On Session    mysession    /    expected_status=200

    # Log To Console    ${response}
    # Log to Console    ${response.status_code}
    # Log To Console    ${response.content}
    # Log To Console    ${response.headers}
    Log    ${response.json()}

    Status Should Be    200

    # Simple Data Validation
    ${per_page_value}=    Get Value From Json    ${response.json()}    $.per_page
    Should Be Equal As Integers    ${per_page_value[0]}    6
    
    # Complex Data Validation
    ${First_Firstname_value}=    Get Value From Json    ${response.json()}    $.data[0].first_name
    Should Be Equal As Strings    ${First_Firstname_value[0]}    Michael
    
    ${First_Lastname_value}=    Get Value From Json    ${response.json()}    $.data[0].last_name
    Should Be Equal As Strings    ${First_Lastname_value[0]}    Lawson

    # Validation on Header
    ${ContentTypeValue}=    Get From Dictionary    ${response.headers}    Content-Type
    Should Be Equal    ${ContentTypeValue}    application/json; charset=utf-8
