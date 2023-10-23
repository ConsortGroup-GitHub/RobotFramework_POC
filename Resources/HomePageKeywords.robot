*** Settings ***
Library             SeleniumLibrary
Variables    ../Pages/HomePage.py

*** Keywords ***


Check HomePage Header Text
    [Arguments]    ${Header_Text}
    Element Should Be Visible    ${txt_Header_HomePage}
    Element Text Should Be    ${txt_Header_HomePage}    ${Header_Text}

Check that Social Networks Logos are Visible
    Scroll Element Into View    ${logo_Twitter}
    
    Element Should Be Visible    ${logo_Twitter}
    Element Should Be Visible    ${logo_Facebook}
    Element Should Be Visible    ${logo_LinkedIn}

Add First Product on the Cart
    Click Button    ${btn_Add_First_Product_To_Cart}

Check that cart number is
    [Arguments]    ${Nb_Of_Products}
    Element Text Should Be    ${Logo_cart_value}    ${Nb_Of_Products}

