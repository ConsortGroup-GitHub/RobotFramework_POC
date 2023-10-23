*** Settings ***
Library    Browser
Library    OperatingSystem

*** Test Cases ***
Example Test
    
    New Page    https://www.saucedemo.com/
    Fill Text    //input[@name="user-name"]    standard_user
    Fill Text    //input[@name="password"]    secret_sauce
    Click    //input[@name="login-button"]

    Get Text    //div[@class='app_logo']    should be    Swag Labs
    Get Text    //div[@class='app_logo']    contains    ag L
    Get Text    //div[@class='app_logo']    should start with    Swag
    Get Text    //div[@class='app_logo']    should end with    Labs

    Get Element States    //li[@class='social_twitter']    validate    visible
    Get Element States    //li[@class='social_facebook']    validate    visible
    Get Element States    //li[@class='social_linkedin']    validate    visible
    

