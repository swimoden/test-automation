
# ** Settings ***
# Documentation  Register
# Resource  ../resources/setup_teardown.resource
# Resource  ../resources/keywords.resource
# Suite Setup  Open the application
# Suite Teardown  Clean up the test suite

# *** Test Cases ***
# I visit a model and back to menu
#  As User I login in app
#  I can navigate to List Brand
#  I can navigate to List of models  Audi
#  I can navigate to the details of the model  Audi  A5 Coupe
#  I go back to menu from model details



# *** Keywords ***
# As User I login in app
#  I can Open Menu
#  I select Profile Item
#  I set user Information  testAuto@test.com  testtest
#  Click Element  xpath=//XCUIElementTypeButton[@name="LOGIN"]
#  I should sees profile screen  Mohamd Amine  testAuto@test.com  
#  [Teardown]  I go back to menu

# I set user Information
#  [Arguments]  ${user_email}  ${user_password}
#  Input Text  accessibility_id=e-mail  ${user_email}
#  Input Text  accessibility_id=password  ${user_password}


