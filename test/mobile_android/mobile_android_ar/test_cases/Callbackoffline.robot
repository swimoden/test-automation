** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application
Force Tags  Android  Android_ar  Callback  Callback_ar

*** Variables ***

*** Test Cases ***
I Succeed to make a Request callback from brand
  [Tags]  Android_ar_callback_brand
  I can navigate to List Brand
  I can navigate to List of models  شانجان
  I can navigate to the details of the model  شانجان  CS 85 
  I can make a Request Callback  Mohamd Amine  66771100
  I go back to menu from model detail

I make a Request callback from brand using wrong information
  [Tags]  Android_ar_callback_brand
  I can navigate to List Brand
  I can navigate to List of models  شانجان
  I can navigate to the details of the model  شانجان  CS 85 
  I make a Request Callback using wrong information  Mohamd Amine  6677 
  I go back to menu from model detail

I Succeed to make a Request callback from Recently Viewed
  [Tags]  Android_ar_callback_Recently_Viewed1
  I visit a model and back to menu  شانجان  CS 85 
  I select mode From Recently Viewed
  I can make a Request Callback  Mohamd Amine  66770000
  I go back to menu from model details Recently Viewed 

I Succeed to make a Request callback from Recently Viewed using wrong information
  [Tags]  Android_ar_callback_Recently_Viewed
  I visit a model and back to menu  شانجان  CS 85
  I select mode From Recently Viewed
  I make a Request Callback using wrong information  Mohamd Amine  6677
  I go back to menu from model details Recently Viewed


I Succeed to make a Request finance callback from brand using wrong informations
  [Tags]  Android_ar_Finance
  I can navigate to List Brand
  I can navigate to List of models  اودي
  I can navigate to the details of the model  اودي  A5 Coupe
  I can make a Request finance Callback using wrong informations  100  2 Year  Mohamd Amine  6677  123456789012
  I go back to menu from model finance callback details  


I Succeed to make a Request finance callback from brand
  [Tags]  Android_ar_Finance
  I can navigate to List Brand
  I can navigate to List of models  اودي
  I can navigate to the details of the model  اودي  A5 Coupe
  I can make a Request finance Callback  100  2 Year  Mohamd Amine  66770000  123456789012
  I go back to menu from model finance callback details  




*** Keywords ***
I cannot proceed Callback Request
  Wait Until Page Contains  خطأ
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn


I should see success pop up
  Wait Until Element Is Visible  xpath=//*[@text='تم بنجاح']
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
