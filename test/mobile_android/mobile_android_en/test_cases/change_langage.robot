** Settings ***
Documentation  Request change langage
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application
Force Tags  Android  Android_change_langage_En Android_change_langage

*** Variables ***

*** Test Cases ***
I Succeed to change langage : user logged in
  [Tags]  Android_En_change_langage_user_online
  As User I login in app
  I can Open Menu
  I can change langage to arabic
  Relod Application

 I Succeed to change langage : user logged out
  [Tags]  Android_En_change_langage_user_Offline
  I can Open Menu
  I can change langage to arabic
  Relod Application


*** Keywords ***

I can change langage to arabic
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/arabic
  Click Element  id=com.kuwait.showroomz.refac:id/arabic
  Wait Until Page Contains  اقسام
  Wait Until Page Contains  سيارات




Relod Application and Login
  Close All Applications
  Open the application
  As User I login in app

Relod Application
  Close All Applications
  Open the application