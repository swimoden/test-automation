** Settings ***
Documentation  book vehicles
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application
# Force Tags  Android  Android_en  show-offer  show-offer_En

*** Variables ***



*** Test Cases ***

I Succeed to Book model from new cars
  [Tags]  Android_En_show-offer_dashboard
  As User I login in app
  I can navigate to List Brand
  I can navigate to List of models  Changan
  I can navigate to the details of the model  Changan  CS 85
  I navigate to booking screen
  I can book using correct information
  Relod Application


*** Keywords ***
