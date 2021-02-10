** Settings ***
Documentation  book vehicles
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application
Force Tags  Android Android_en  Filter  Filter_En

*** Variables ***


*** Test Cases ***

I Succeed to Book model from new cars
  [Tags]  Android_En_book_newcar
  As User I login in app
  I can navigate to List Brand
  I can navigate to List of models  Changan
  I can navigate to the details of the model  Changan  CS 85
  I navigate to booking screen
  I can book using correct information
  Relod Application

I Succeed to book from new car
  [Tags]  Android_En_book_newcar
  As User I login in app
  I can navigate to List Brand
  I can navigate to leasing category
  I can navigate to List of models  Automak
  I can navigate to the details of the model  Automak  Prado 
  I select book now from best dealing
  I can book using correct information
  Relod Application


I Succeed to book from rent car
  [Tags]  Android_En_book_rent
  As User I login in app
  I can navigate to List Brand
  I can navigate to rent category
  I can navigate to List of models  Automak
  I can navigate to the details of the model  Automak  Santa Fe 
  I select book now with daily contract
  I can book using correct informations
  Relod Application


I Succeed to book from recently viewed
  [Tags]  Android_En_book_recently_viewed
  As User I login in app
  I can navigate to List Brand
  I can navigate to rent category
  I visit a model and back to menu  Automak  Santa Fe
  I select model From Recently Viewed
  I select book now with daily contract
  I can book using correct informations
  Relod Application

I Succeed to book a car from FAVORITES
  [Tags]  Android_En_BOOK_From_Favorites
  Delete all client favorites  testAuto@test.com  testtest
  As User I login in app
  I visit a model from rent category and add it to favorites and back to menu  Automak  Santa Fe
  I can Open Menu
  I select favorites Item
  I select mode From favorites List  SANTA FE
  I select book now with weekly contract
  I can book using correct informations
  Relod Application

I Succeed to make a callback request from rent category using correct informations
  [Tags]  Android_En_callback_rent
  As User I login in app
  I can navigate to List Brand
  I can navigate to rent category
  I can navigate to List of models  Automak
  I can navigate to the details of the model  Automak  Santa Fe
  I can make a Request Callback from rent category using correct informations  Mohamd Amine  66771100
  I go back to menu from model detail

I make a callback request from rent category using wrong informations
  [Tags]  Android_En_callback_rent
  As User I login in app
  I can navigate to List Brand
  I can navigate to rent category
  I can navigate to List of models  Automak
  I can navigate to the details of the model  Automak  Santa Fe
  I make a Request Callback from rent category using wrong informations  Mohamd Amine  6677
  I go back to menu from model detail

*** Keywords ***
