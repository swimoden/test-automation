** Settings ***
Documentation  compare model car marine bike
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application
Force Tags  compare  Android  Android_ar  compare_ar

*** Variables ***

*** Test Cases ***
I Succeed to compare two models from New category
  [Tags]  Android_ar_compare_Brand
  I can navigate to List Brand
  I can navigate to List of models  بي أم دبليو
  I can navigate to the details of the model  بي أم دبليو  M2 Competition
  I open compare model screen
  I add another model to second trim  m  اس في  ماكسيما 
  I refresh compare screen
  I back to menu from compare model screen

I Succeed to compare two models from certified category
  [Tags]  Android_ar_compare_certified
  I can navigate to List Brand
  I can navigate to certified category
  I can navigate to List of models  بايك
  I can navigate to the details of the model  بايك  BJ40L
  I open compare model screen
  I add another model to second trim  d  Expedition - 2018  المواصفات
  I refresh compare screen
  I back to menu from compare model screen

I Succeed to compare two models from marine category
  [Tags]  Android_ar_compare_marine
  I can navigate to List Brand of Marine
  I can navigate to List of models  JETSURF
  I can navigate to the details of the model  JETSURF  Race DFI Model
  I open compare model screen
  I add another model to second trim  m  262 Fisherman  المواصفات
  I refresh compare screen
  I back to menu from compare model screen

I Succeed to compare two models from bike category
  [Tags]  Android_ar_compare_bike
  I can navigate to List Brand of Bike
  I can navigate to List of models  KAWASAKI - MOTORCYCLES
  I can navigate to the details of the model  KAWASAKI - MOTORCYCLES  NINJA ZX 10R
  I open compare model screen
  I add another model to second trim  K  KTM 690 ENDURO R  690 ENDURO R
  I refresh compare screen
  I back to menu from compare model screen

*** Keywords ***

