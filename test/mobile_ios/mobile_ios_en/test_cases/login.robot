
** Settings ***
Documentation  Register
Resource  ../resources/setup_teardown.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite

*** Test Cases ***
As User I login in app
  I can Open Menu

*** Keywords ***
I can Open Menu
  No Operation  

I select Profile Item
  No Operation  

I navigate to register page
  No Operation  

I Type a false Information and failed register
  No Operation

I Type a true Information and register
  No Operation  


