*** Settings ***
Library             SeleniumLibrary
Library             OperatingSystem
Library             String

Suite Setup         Log    I am inside Test Suite Setup
Suite Teardown      Log    I am inside Test Suite Teardown
Test Setup          Log    I am inside Test Case Setup
Test Teardown       Log    I am inside Test Case Teardown

*** Variables ***
# SCALAR Variable :
${URL}              https://www.saucedemo.com/
# LIST Variable
@{CREDENTIALS}      standard_user    locked_out_user    problem_user    performance_glitch_user
# DICTIONARY Variable
&{LOGINDATA}        username=standard_user    password=secret_sauce
# ENVIRONMENT Variables : accessibles via %{} avec les noms des variables d'environnements présentes sur la machine
# BUILT-IN Variables : https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html#built-in-variables


*** Test Cases ***
FirstSeleniumTest
    Set Tags    sanity

    Open Browser    ${URL}    chrome
    Wait Until Element Is Visible    id:user-name

    LoginKeyword

    Element Should Be Visible    //div[@class='app_logo']
    
    Run Keyword And Continue On Failure    ContinueOnFailureKeyword    # le test se poursuit et il sera en échec.
    Run Keyword And Ignore Error    IgnoreFailureKeyword    # le test se poursuit et il sera considéré comme OK ==> Peu conseillé !
    Run Keyword And Warn On Failure    WarnOnFailureKeyword    # le test se poursuit et il sera Passed, avec un Warning qui apparaîtra en tête de rapport.

    Element Text Should Be    //div[@class='app_logo']    Swag Labs

    LogoutKeyword

    Close Browser

    Log    This test was executed by %{username} on %{os}
    Log    Executed Test was ${TEST_NAME} and associated Tags are @{TEST TAGS}


*** Keywords ***
LoginKeyword
    
    # Set Log Level    TRACE
    
    Log    ${CREDENTIALS}[0]
    Log    "Mon 2nd Credential est : " ${CREDENTIALS}[1]    TRACE    html=${False}    console=${True}
    Log To Console    ${CREDENTIALS}[2]

    Input Text    //input[@name="user-name"]    ${CREDENTIALS}[0]
    Input Text    //input[@name="password"]    ${LOGINDATA}[password]
    Click Element    //input[@name="login-button"]

LogoutKeyword
    Click Element    //button[@id="react-burger-menu-btn"]
    # Nécessité d'attendre que le menu apparaisse avant de clique sur "Logout" :
    Wait Until Element Is Visible    //*[@id="logout_sidebar_link"]



    Element Should Be Enabled    //*[@id="logout_sidebar_link"]

    Element Attribute Value Should Be    //div[@class='app_logo']    class    app_logo
    Element Attribute Value Should Be    //*[@id="logout_sidebar_link"]    id    logout_sidebar_link

    Location Should Be    https://www.saucedemo.com/inventory.html
    Location Should Contain    inventory.html

    Title Should Be    Swag Labs



    Element Should Be Visible    //*[@id="logout_sidebar_link"]
    # Element Should Not Be Visible    //*[@id="logout_sidebar_link"]    L'élément LOGOUT est bel et bien VISIBLE !



    Click Element    //*[@id="logout_sidebar_link"]

ContinueOnFailureKeyword
    Element Should Contain    //div[@class='app_logo']    wag L

IgnoreFailureKeyword
    Element Should Contain    //div[@class='app_logo']    wag L

WarnOnFailureKeyword
    Element Should Contain    //div[@class='app_logo']    wag l
