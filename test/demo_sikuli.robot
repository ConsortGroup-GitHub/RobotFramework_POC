*** Settings ***
Documentation       Sikuli With Robot RobotFramework    http://rainmanwy.github.io/robotframework-SikuliLibrary/doc/SikuliLibrary.html

Library             SikuliLibrary
Library             SeleniumLibrary
Library             OperatingSystem

Suite Setup         Run Keywords    Start Sikuli Process    AND    Initialize All Images
Suite Teardown      Stop Remote Server
Test Setup          Open Browser    ${URL}    ${BROWSER}
Test Teardown       Close Browser

*** Variables ***
${URL}                  https://robotsparebinindustries.com/#/
${BROWSER}              chrome
${HEADER_IMAGE}         robot_logo.png
${USERNAME_IMAGE}       username_text.png
${PASSWORD_IMAGE}       password_text.png
${LOGIN_IMAGE}          login_button.png
${LOGOUT_IMAGE}         logout_button.png
${FIRSTNAME_IMAGE}      firstname_text.png
${LASTNAME_IMAGE}       lastname_text.png

*** Test Cases ***
TestSikuli
    Check Header If Exists
    Input Username And Password
    Input Firstname And Lastname
    Logout From Website

*** Keywords ***
Initialize All Images
    
    # Add Image Path    C:/Users/david.nowak/VSCode Projects/RobotFramework_POC/test/Sikuli_Images
    Add Image Path    ${CURDIR}${/}Sikuli_Images

Check Header If Exists
    Exists    ${HEADER_IMAGE}

Input Username And Password
    SikuliLibrary.Input Text    ${USERNAME_IMAGE}    maria
    SikuliLibrary.Input Text    ${PASSWORD_IMAGE}    thoushallnotpass
    
    Element Should Be Visible    //button[@type="submit"]

    Click    ${LOGIN_IMAGE}

Input Firstname And Lastname
    Wait For Image    ${LOGOUT_IMAGE}    ${LOGIN_IMAGE}    5
    SikuliLibrary.Input Text    ${FIRSTNAME_IMAGE}    David
    SikuliLibrary.Input Text    ${LASTNAME_IMAGE}    Nowak    


Logout From Website
    Exists    ${LOGOUT_IMAGE}
    Click    ${LOGOUT_IMAGE}
