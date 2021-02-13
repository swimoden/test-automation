** Settings ***
Documentation  show gallery,interior & exterior
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application
Force Tags  Android  Android_en  Gallery  Gallery_En

*** Variables ***



*** Test Cases ***

I Succeed to show interior from recently viewed
  [Tags]  Android_En_exterior_recently_viewed
  As User I login in app
  # I can navigate to List Brand
  I visit a model and back to menu  BMW  M5
  I select model From Recently Viewed
  I show the interior

I Succeed to show interior from recently viewed
  [Tags]  Android_En_exterior_recently_viewed
  I visit a model and back to menu  BMW  M5
  I select model From Recently Viewed
  I show the exterior

I Succeed to show interior from exterior
  [Tags]  Android_En_interior_from_exterior
  I visit a model and back to menu  BMW  M5
  I select model From Recently Viewed
  I show the interior from exterior

I Succeed to show exterior from interior
  [Tags]  Android_En_exterior_from_interior
  I visit a model and back to menu  BMW  M5
  I select model From Recently Viewed
  I show the exterior from interior

I Succeed to show the gallery from model details
  [Tags]  Android_En_gallery
  I can navigate to List Brand of Marine
  I can navigate to List of models  JETSURF
  I can navigate to the details of the model  JETSURF  Race DFI Model
  I show gallery
  I go back to menu from marine model detail

*** Keywords ***

