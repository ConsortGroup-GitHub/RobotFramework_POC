*** Settings ***
Library             SeleniumLibrary
Variables    ../Pages/LoginPage.py

*** Keywords ***


Open Browser and Go to the URL
    [Arguments]    ${my_browser}    ${my_URL}
    Open Browser    ${my_URL}    ${my_browser}
    Wait Until Element Is Visible    ${txt_InputLogin}    


Enter Username
    [Arguments]    ${username}
    Input Text    ${txt_InputLogin}    ${username}


Enter Password
    [Arguments]    ${password}
    Input Text    ${txt_InputPassword}    ${password}

Click on Login
    Click Button    ${btn_Login}

Log To Application
    [Arguments]    ${username}    ${password}
    Input Text    ${txt_InputLogin}    ${username}
    Input Text    ${txt_InputPassword}    ${password}
    Click Button    ${btn_Login}
    Sleep    1s