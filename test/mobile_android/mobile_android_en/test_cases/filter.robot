** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application and Login
Force Tags  Android  Filter  Filter_En

*** Variables ***
${dest_path}  /data/local/tmp/test_push_file.txt

*** Test Cases ***

# I Succeed to make a Request callback from brand
#  [Tags]  Android_En_filter_brand
#  # As User I login in app
#  I can navigate to List Brand
#  I succeed to search vehicle using filter  5000  SEDAN  ABARTH
#  I succeed to find brand  Abarth 695

# I Succeed to make a Request callback from brand
#  [Tags]  Android_En_filter_maintenance
#  I can navigate to List Brand
#  I succeed to search car using filter from maintenance subcategory  ABARTH  ACURA


# I Succeed to search vehicle using filter from subcategory Marine
#  [Tags]  Android_En_filter_marine
#  I navigate to List Brand of Marine
#  I Should be on List Brand of Marine
#  I succeed to search vehicle using filter  10000  JET SKI  SEA DOO
#  I selects model with name  SPARK 2UP

# I Succeed to search vehicle using filter from subcategory Marine
#  [Tags]  Android_En_filter_bike
#  I can navigate to List Brand of Bike
#  I succeed to search vehicle using filter  5000  2 WHEELS  BMW
#  I selects model with name  C 650 GT

# I Succeed to search vehicle using filter from subcategory Marine
#  [Tags]  Android_En_filter_bike
#  I can navigate to List Brand of Bike
#  I succeed to search vehicle using filter  5000  2 WHEELS  BMW
#  I selects model with name  C 650 GT

# I Succeed to see locations
#  [Tags]  Android_En_locations
#  I can navigate to List Brand
#  I can navigate to List of models  Nissan
#  I can see locations

# I Succeed to book from new car
#  [Tags]  Android_En_book_newcar
#  As User I login in app
#  I can navigate to List Brand
#  I can navigate to List of models  Changan
#  I can navigate to the details of the model  Changan  CS 85 
# I navigate to booking screen
#  I can book using correct information

# I Succeed to book from new car
#  [Tags]  Android_En_book_newcar
#  As User I login in app
#  I can navigate to List Brand
#  I can navigate to leasing category
#  I can navigate to List of models  Automak
#  I can navigate to the details of the model  Automak  Prado 
#  I select book now from best dealing
#  I can book using correct information

# I Succeed to book from rent car
#  [Tags]  Android_En_book_rent
#  As User I login in app
#  I can navigate to List Brand
#  I can navigate to rent category
#  I can navigate to List of models  Automak
#  I can navigate to the details of the model  Automak  Santa Fe 
#  I select book now with daily contract
#  I can book using correct informations

# I Succeed to book from recently viewed
#  [Tags]  Android_En_book_recently_viewed
#  As User I login in app
#  I can navigate to List Brand
#  I can navigate to rent category
#  I visit a model and back to menu  Automak  Santa Fe
#  I select model From Recently Viewed
#  I select book now with daily contract
#  I can book using correct informations


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
  # As User I login in app
  I can navigate to List Brand
  I can navigate to rent category
  I can navigate to List of models  Automak
  I can navigate to the details of the model  Automak  Santa Fe
  I make a Request Callback from rent category using wrong informations  Mohamd Amine  6677
  I go back to menu from model detail

I Succeed to book a car from FAVORITES
  [Tags]  Android_En_BOOK_From_Favorites
  # As User I login in app
  I visit a model from rent category and add it to favorites and back to menu  Automak  Santa Fe
  I can Open Menu
  I select favorites Item
  I select mode From favorites List  SANTA FE
  I select book now with weekly contract
  I can book using correct informations
  I go back to menu from model details favorites

*** Keywords ***
