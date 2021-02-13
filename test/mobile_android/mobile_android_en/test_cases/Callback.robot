** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
# Test Teardown  Run Keyword If Test Failed  Relod Application and Login
Force Tags  Android  Android_en  Callback  Callback_En

*** Variables ***

*** Test Cases ***
I Succeed to make a Request callback from brand
  [Tags]  Android_En_callback_brand
  As User I login in app
  I can navigate to List Brand
  I can navigate to List of models  Changan
  I can navigate to the details of the model  Changan  CS 85 
  I can make a Request Callback  Mohamd Amine  66771100
  I go back to menu from model detail

I make a Request callback from brand using wrong information
  [Tags]  Android_En_callback_brand
  I can navigate to List Brand
  I can navigate to List of models  Changan
  I can navigate to the details of the model  Changan  CS 85 
  I make a Request Callback using wrong information  Mohamd Amine  6677 
  I go back to menu from model detail

I Succeed to make a Request callback from Recently Viewed
  [Tags]  Android_En_callback_Recently_Viewed1
  I visit a model and back to menu  Changan  CS 85 
  I select mode From Recently Viewed
  I can make a Request Callback  Mohamd Amine  66770000
  I go back to menu from model details Recently Viewed 

I Succeed to make a Request callback from Recently Viewed using wrong information
  [Tags]  Android_En_callback_Recently_Viewed
  I visit a model and back to menu  Changan  CS 85
  I select mode From Recently Viewed
  I make a Request Callback using wrong information  Mohamd Amine  6677
  I go back to menu from model details Recently Viewed

I Succeed to make a Request callback from FAVORITES
  [Tags]  Android_En_callback_From_Favorites
  Delete all client favorites  testAuto@test.com  testtest
  As User I login in app
  I visit a model add it to favorites and back to menu  Audi  A6
  I can Open Menu
  I select favorites Item
  I select mode From favorites List  A6
  I can make a Request Callback  Mohamd Amine  66770000
  I go back to menu from model details favorites

I Succeed to make a Request callback from FAVORITES using wrong informations
  [Tags]  Android_En_callback_From_Favorites
  Delete all client favorites  testAuto@test.com  testtest
  As User I login in app
  I visit a model add it to favorites and back to menu  Audi  A6
  I can Open Menu
  I select favorites Item
  I select mode From favorites List  A6
  I make a Request Callback using wrong information  Mohamd Amine  6677
  I go back to menu from model details favorites


I Succeed to make a Request finance callback from brand using wrong informations
  [Tags]  Android_En_Finance
  I can navigate to List Brand
  I can navigate to List of models  Audi
  I can navigate to the details of the model  Audi  A5 Coupe
  I can make a Request finance Callback using wrong informations  100  2 Year  Mohamd Amine  6677  123456789012
  I go back to menu from model finance callback details  


I Succeed to make a Request finance callback from brand
  [Tags]  Android_En_Finance
  I can navigate to List Brand
  I can navigate to List of models  Audi
  I can navigate to the details of the model  Audi  A5 Coupe
  I can make a Request finance Callback  100  2 Year  Mohamd Amine  66770000  123456789012
  I go back to menu from model finance callback details  




*** Keywords ***
I cannot proceed Callback Request
  Wait Until Page Contains  Error
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn


I should see success pop up
  Wait Until Element Is Visible  xpath=//*[@text='Done SuccessFully']
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
