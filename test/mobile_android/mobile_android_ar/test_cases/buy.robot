** Settings ***
Documentation  book vehicles
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application
Force Tags  Android  Android_ar  buy  buy_ar

*** Variables ***



*** Test Cases ***

I Succeed to buy model from new cars
  [Tags]  Android_ar_buymodel
  As User I login in app
  I can navigate to List Brand
  I can navigate to List of models  شانجان
  I can navigate to the details of the model  شانجان  CS 85
  I navigate to buy now screen
  I can buy model using correct information
  Relod Application

*** Keywords ***
