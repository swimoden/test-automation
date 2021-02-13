** Settings ***
Documentation  show gallery,interior & exterior
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
# Test Teardown  Run Keyword If Test Failed  Relod Application
Force Tags  Android  Android_en  Gallery  Gallery_En

*** Variables ***



*** Test Cases ***

I Succeed to share a model from car category
  [Tags]  Android_En_share
  I can navigate to List Brand
  I can navigate to List of models  HAVAL
  I can navigate to the details of the model  HAVAL  H2
  I share model
  I go back to menu from model detail

I Succeed to share a model from marine category
  [Tags]  Android_En_share
  I can navigate to List Brand of Marine
  I can navigate to List of models  JETSURF
  I can navigate to the details of the model  JETSURF  Race DFI Model
  I share model
  I go back to menu from marine model detail

I Succeed to share a model from bike category
  [Tags]  Android_En_share
  I can navigate to List Brand of Bike
  I can navigate to List of models  KAWASAKI - MOTORCYCLES
  I can navigate to the details of the model  KAWASAKI - MOTORCYCLES  NINJA ZX 10R
  I share model
  I go back to menu from bike model detail

*** Keywords ***
