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
${URL}                      https://www.caisse-epargne.fr/se-connecter/identifier
${BROWSER}                  chrome

${ID_IMAGE}                 id_txt.png
${PERSONAL_SPACE_IMAGE}     personal_space_btn.png
${VALIDATE_IMAGE}           validation_btn.png
${0_IMAGE}                  0_nb.png
${1_IMAGE}                  1_nb.png
${2_IMAGE}                  2_nb.png
${3_IMAGE}                  3_nb.png
${4_IMAGE}                  4_nb.png
${5_IMAGE}                  5_nb.png
${6_IMAGE}                  6_nb.png
${7_IMAGE}                  7_nb.png
${8_IMAGE}                  8_nb.png
${9_IMAGE}                  9_nb.png


*** Test Cases ***
TestSikuli
    Check Acceptations
    Go To Personal Space
    Enter Customer ID And Validate
    Input Secret Code


*** Keywords ***
Initialize All Images
    Add Image Path    ${CURDIR}${/}Sikuli_Images_CE

Check Acceptations
    Maximize Browser Window
    Scroll Element Into View    //button[@id="consent_prompt_submit"]
    Click Element    //button[@id="consent_prompt_submit"]

Go To Personal Space
    Exists    ${PERSONAL_SPACE_IMAGE}
    Click    ${PERSONAL_SPACE_IMAGE}

Enter Customer ID And Validate
    Exists    ${ID_IMAGE}
    SikuliLibrary.Input Text    ${ID_IMAGE}    2420034439
    Exists    ${VALIDATE_IMAGE}
    Click    ${VALIDATE_IMAGE}

Input Secret Code
    Wait For Image    ${1_IMAGE}    ${VALIDATE_IMAGE}    5

    # Sleep    2 seconds
    
    Click    ${0_IMAGE}
    Click    ${1_IMAGE}
    Click    ${2_IMAGE}
    Click    ${3_IMAGE}
    Click    ${4_IMAGE}
    Click    ${5_IMAGE}
    Click    ${6_IMAGE}
    Click    ${7_IMAGE}
