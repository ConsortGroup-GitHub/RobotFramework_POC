*** Settings ***
Library             SeleniumLibrary
Library             OperatingSystem
Library             String

Test Setup    Run Keywords
...    Login With Valid Credentials
...    Click On Login Button

Suite Teardown      Close Browser

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
Login With Valid Credentials And Logout
        
    Click Element    //button[@id="react-burger-menu-btn"]
    Wait Until Element Is Visible    //*[@id="logout_sidebar_link"]
    Click Element    //*[@id="logout_sidebar_link"]


Add Products into cart
    
    Click Element    //button[@name="add-to-cart-sauce-labs-backpack"]
    Click Element    //button[@name="add-to-cart-sauce-labs-bike-light"]
    Click Element    xpath=(//div[@class="inventory_item_name "])[3]
    Click Element    //button[@name="add-to-cart-sauce-labs-bolt-t-shirt"]
    Element Text Should Be    //span[@class="shopping_cart_badge"]    3


    Click Element    //button[@id="react-burger-menu-btn"]
    Wait Until Element Is Visible    //*[@id="logout_sidebar_link"]
    Click Element    //*[@id="logout_sidebar_link"]

*** Keywords ***
Login With Valid Credentials
    
    Open Browser    ${URL}    chrome
    
    Wait Until Element Is Visible    name:user-name
    Input Text    //input[@name="user-name"]    ${CREDENTIALS}[0]
    Input Text    //input[@name="password"]    ${LOGINDATA}[password]

Click On Login Button
    Click Element    //input[@name="login-button"]