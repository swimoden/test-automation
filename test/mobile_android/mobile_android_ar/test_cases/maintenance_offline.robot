** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application
Force Tags  Android  Android_en  Maintenance  Maintenance_Offline_En

*** Variables ***

*** Test Cases ***
I Succeed to make a Request Maintenance callback from brand
  [Tags]  Android_En_Maintenance_Offline_Brand
  I can navigate to List Brand
  I can see maintenance subcategory  Nissan
  I can make a Request Callback  Automated test  10010001  
  I back to menu


I Succeed to make a Request Maintenance callback from brand using wrong information
  [Tags]  Android_En_Maintenance_Offline_Brand
  I can navigate to List Brand
  I can see maintenance subcategory  Nissan
  I make a Request Callback using wrong informations  Automated test  6677  
  I back to menu 

*** Keywords ***

I can make a Request Callback
  [Arguments]  ${nom_user}  ${phone_number}  
  I passed a callback Request  ${nom_user}  ${phone_number}

I cannot proceed Callback Request
  Wait Until Page Contains  Error
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn

I can navigate to List of models
  [Arguments]  ${brand_name}
  I have access to List Brand
  I selects a brand with name  ${brand_name}


I can see maintenance subcategory
  [Arguments]  ${brand_name}
  Wait Until Element Is Visible  xpath=//*[@text='Maintenance']
  Click Element  xpath=//*[@text='Maintenance']
  I can navigate to List of models  ${brand_name}
  sleep  4s
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/show_locations
  Wait Until Element Is Visible  xpath=//*[@text='REQUEST APPOINTMENT']
  click element  xpath=//*[@text='REQUEST APPOINTMENT']



I passed a callback Request
  [Arguments]  ${nom_user}  ${phone_number}  
  I have access to callback popup
  I set Full name  ${nom_user}
  I set Phone Number  ${phone_number}
  I validate Callback Request
  I should see success pop up

I should see success pop up
  Wait Until Element Is Visible  xpath=//*[@text='Done SuccessFully']
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Sleep  1s




