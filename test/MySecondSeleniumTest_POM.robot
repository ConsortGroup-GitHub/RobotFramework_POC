*** Settings ***
# Library             SeleniumLibrary
Library             OperatingSystem
Library             String

Resource    ../Resources/LoginKeywords.robot
Resource    ../Resources/HomePageKeywords.robot

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
SecondSeleniumTest
    Set Tags    sanity    smoke

    Open Browser and Go to the URL    chrome    ${URL}
    Log To Application    ${CREDENTIALS}[0]    ${LOGINDATA}[password]
    Check HomePage Header Text    Swag Labs
    Check that Social Networks Logos are Visible

    Add First Product on the Cart
    Check that cart number is    1
