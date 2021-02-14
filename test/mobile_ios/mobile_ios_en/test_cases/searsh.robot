** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Library  DateTime
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application and Login
Force Tags  Ios  searsh

*** Variables ***

*** Test Cases ***
I Succeed to Search from Brands screen Marine
  [Tags]  Ios_en_marine_searsh
  [Setup]  As User I login in app
  I can navigate to List Marine brands
  I can navigate to search screen
  I can search  SPARK TRIXX 2UP 
  I can close search Screen
  I Should be back to List Marine brands
  I go back to menu from List Marine brands

I Succeed to Search from Brands screen bike
  [Tags]  Ios_en_bike_searsh
  I can navigate to List bike brands
  I can navigate to bike model  KAWASAKI - MOTORCYCLES
  I can navigate to search screen
  I can search  DUCATI 
  I can close search Screen
  I Should be back to List Bike model  KAWASAKI - MOTORCYCLES
  I go back to menu from Bike model 
  [Teardown]  NONE


*** Keywords ***
I can navigate to bike model
  [Arguments]  ${name_model} 
  I navigate to bike model  ${name_model} 
  I should be in bike model  ${name_model} 

I should be in bike model
  [Arguments]  ${name_model} 
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="Main Showroom"]
  Wait Until Element Is Visible  accessibility_id=${name_model}

I go back to menu from Bike model
  Click Element  accessibility_id=back black
  Wait Until Element Is Visible  accessibility_id=BIKE
  Wait Until Element Is Visible  accessibility_id=back
  Click Element  accessibility_id=back
  I have access to Dashborad Screen 


I navigate to bike model
  [Arguments]  ${name_model}  
  Click Element  accessibility_id=${name_model}

I can navigate to List bike brands
  I have access to Dashborad Screen 
  I navigate to List bike Brand 
  I Should be on List Bike Brand

I go back to menu from List Marine brands
  Click Element  accessibility_id=back
  I have access to Dashborad Screen 

I can close search Screen
  Click Element  accessibility_id=multiply

I Should be back to List Marine brands
  Wait Until Element Is Visible  accessibility_id=MARINE
  Wait Until Element Is Visible  accessibility_id=back

I Should be back to List Bike model
  [Arguments]  ${name_model}
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="Main Showroom"]
  Wait Until Element Is Visible  accessibility_id=${name_model}
  Wait Until Element Is Visible  accessibility_id=back black

I can search
  [Arguments]  ${search_text}
  I set search text  ${search_text}
  I should see search result  ${search_text}

I should see search result
  [Arguments]  ${search_text}
  Wait Until Element Is Visible  accessibility_id=${search_text}

I set search text
  [Arguments]  ${search_text}
  Input Text  xpath=//XCUIElementTypeTextField[@value="You can Search by Brand, Model or budget"]  ${search_text}

I can navigate to List Marine brands
  I have access to Dashborad Screen 
  I navigate to List Marine Brand 
  I Should be on List Marine Brand 

I can navigate to search screen
  I navigate to search Screen 
  I Should be on search Screen

I navigate to search Screen
  Click Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[1]

I Should be on search Screen
  Wait Until Element Is Visible  xpath=//XCUIElementTypeTextField[@value="You can Search by Brand, Model or budget"]

I navigate to List Marine Brand
  Click Element  accessibility_id=Marine
  Run Keyword And Ignore Error  Wait and close Pub

I navigate to List bike Brand
  Click Element  accessibility_id=Bike
  Run Keyword And Ignore Error  Wait and close Pub

I Should be on List Bike Brand
  Wait Until Element Is Visible  accessibility_id=KAWASAKI - MOTORCYCLES
  Wait Until Element Is Visible  accessibility_id=KAWASAKI - SIDE X SIDE

I Should be on List Marine Brand
  Wait Until Element Is Visible  accessibility_id=JETSURF
  Wait Until Element Is Visible  accessibility_id=Sea Doo

I have access to List Marine Brand
  Element Should Be Visible  accessibility_id=JETSURF
  Element Should Be Visible  accessibility_id=Sea Doo


I have access to Dashborad Screen
  Wait Until Element Is Visible  accessibility_id=Car
  Wait Until Element Is Visible  accessibility_id=Marine
  Wait Until Element Is Visible  accessibility_id=Bike 
