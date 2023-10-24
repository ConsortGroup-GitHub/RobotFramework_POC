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
Login With Valid Credentials
    
    Open Browser    ${URL}    chrome

    Wait Until Element Is Visible    name:user-name
    Input Text    //input[@name="user-name"]    ${CREDENTIALS}[0]
    Input Text    //input[@name="password"]    ${LOGINDATA}[password]
    Click Element    //input[@name="login-button"]

    Close Browser


Login With Valid Credentials And Logout
    
    Open Browser    ${URL}    chrome

    Wait Until Element Is Visible    name:user-name
    Input Text    //input[@name="user-name"]    ${CREDENTIALS}[0]
    Input Text    //input[@name="password"]    ${LOGINDATA}[password]
    Click Element    //input[@name="login-button"]

    Click Element    //button[@id="react-burger-menu-btn"]
    Wait Until Element Is Visible    //*[@id="logout_sidebar_link"]
    Click Element    //*[@id="logout_sidebar_link"]

    Close Browser

Add Products into cart
    
    Open Browser    ${URL}    chrome

    Wait Until Element Is Visible    name:user-name
    Input Text    //input[@name="user-name"]    ${CREDENTIALS}[0]
    Input Text    //input[@name="password"]    ${LOGINDATA}[password]
    Click Element    //input[@name="login-button"]

    Click Element    //button[@name="add-to-cart-sauce-labs-backpack"]
    Click Element    //button[@name="add-to-cart-sauce-labs-bike-light"]
    Click Element    xpath=(//div[@class="inventory_item_name "])[3]
    Click Element    //button[@name="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Text Should Be    //span[@class="shopping_cart_badge"]    3


    Click Element    //button[@id="react-burger-menu-btn"]
    Wait Until Element Is Visible    //*[@id="logout_sidebar_link"]
    Click Element    //*[@id="logout_sidebar_link"]

    Close Browser

