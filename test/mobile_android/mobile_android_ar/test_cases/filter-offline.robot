** Settings ***
Documentation  Searching vehicle using filter option
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application and login
Force Tags  Android  Android_en  Filter  Filter_En

*** Variables ***


*** Test Cases ***

I Succeed to make a search brand using filter
  [Tags]  Android_En_filter_brand
  As User I login in app
  I can navigate to List Brand
  I succeed to search vehicle using filter  5000  أبارث  سيدان
  I succeed to find brand  Abarth 695
  I back to menu from filter brand screen

I Succeed to make a search from maintenance category
  [Tags]  Android_En_filter_maintenance
  I can navigate to List Brand
  I succeed to search car using filter from maintenance subcategory  أبارث  اكيورا
  I back to menu from filter brand screen

I Succeed to search vehicle using filter from subcategory Marine
  [Tags]  Android_En_filter_marine
  I navigate to List Brand of Marine
  I Should be on List Brand of Marine
  I succeed to search vehicle using filter  10000  JET SKI  SEA DOO
  I selects model with name  SPARK 2UP
  I back to menu from filter model screen

I Succeed to search vehicle using filter from subcategory Bike
  [Tags]  Android_En_filter_bike
  I can navigate to List Brand of Bike
  I Should be on List Brand of Bike
  I succeed to search vehicle using filter  5000  2 WHEELS  BMW
  I selects model with name  C 650 GT
  I back to menu from filter model screen


I Succeed to see locations
  [Tags]  Android_En_locations
  I can navigate to List Brand
  I can navigate to List of models  Nissan
  I can see locations
  Relod Application



*** Keywords ***
