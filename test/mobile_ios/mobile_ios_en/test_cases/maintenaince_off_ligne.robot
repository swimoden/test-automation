** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application
Force Tags  Ios  callback

*** Test Cases ***
I Succeed to make a Request callback from brand
  [Tags]  Ios_en_maintenance_callback_off_ligne
  I can navigate to List Brand
  I can navigate to sub category Maintenance
  I can navigate to brand  Nissan
  I can make a Maintenance Request Callback  Mohamd Amine  6677  66770000
  [Teardown]  NONE

*** Keywords ***
I can make a Maintenance Request Callback
  [Arguments]  ${nom_user}  ${false_phone_number}  ${phone_number}  
  I can see Request Appointment buttons
  I click Request Appointment buttons
  I passed a callback Request  ${nom_user}  ${false_phone_number}  ${phone_number}

I click Request Appointment buttons
  Click Element  accessibility_id=Request Appointment

I can see Request Appointment buttons
  Wait Until Element Is Visible  accessibility_id=Request Appointment

I can navigate to brand
  [Arguments]  ${brand_name}
  Wait Until Element Is Visible  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[1]/XCUIElementTypeButton
  Click Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[1]/XCUIElementTypeButton
  Wait Until Element Is Visible  xpath=//XCUIElementTypeTextField[@value="You can Search by Brand, Model or budget"]  
  Input Text  xpath=//XCUIElementTypeTextField[@value="You can Search by Brand, Model or budget"]  ${brand_name}
  Wait Until Page Contains Element  xpath=//XCUIElementTypeStaticText[@name="${brand_name}"]  timeout=20s
  Click Element  xpath=//XCUIElementTypeStaticText[@name="${brand_name}"]
  Wait Until Element Is Visible  accessibility_id=Request Appointment

I should be in the Maintenance model view
  Wait Until Element Is Visible  accessibility_id=Request Appointment

I can navigate to sub category Maintenance
  Click Element  accessibility_id=Maintenance

I can navigate to List Brand
  I have access to Dashborad Screen 
  I navigate to List Brand 
  I Should be on List Brand 

I passed a callback Request
  [Arguments]  ${nom_user}  ${false_phone_number}  ${phone_number}  
  I have access to callback popup
  I set Full name  ${nom_user}
  I set false Phone Number  ${false_phone_number}
  I validate Callback Request
  I cannot proceed Callback Request
  I set Phone Number  ${phone_number}
  I validate Callback Request
  I should see success pop up

I set civilId
  [Arguments]  ${civil_id}
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[3]  ${civil_id}

I cannot proceed Callback Request
  Page Should Contain Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[2]

I validate Callback Request
  Click Element  accessibility_id=tick mark icon

I should see success pop up
  Wait Until Element Is Visible  accessibility_id=Success  
  Sleep  5s
  wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]
  Click Element  xpath=//XCUIElementTypeButton[@name="close icon"]
  Sleep  5s

I set Full name
  [Arguments]  ${full_name}
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[1]  ${full_name}

I set Phone Number
  [Arguments]  ${phone_number}
  AppiumLibrary.Clear Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[2]
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[2]  ${phone_number}

I set false Phone Number
  [Arguments]  ${false_phone_number}
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[2]  ${false_phone_number}

I have access to callback popup
  Wait Until Element Is Visible  accessibility_id=Please Add your information to be contacted

I have access to List Brand
  I Should Sees List Brands

I have access to Dashborad Screen
  Wait Until Element Is Visible  accessibility_id=Car  

I navigate to List Brand
  Click Element  accessibility_id=Car
  Run Keyword And Ignore Error  Wait and close Pub

I Should be on List Brand
  I Should Sees Sub Categories
  I Should Sees List Brands

I Should Sees Sub Categories
  Page Should Contain Element  accessibility_id=New
  Page Should Contain Element  accessibility_id=Certified
  Page Should Contain Element  accessibility_id=Leasing
  Page Should Contain Element  accessibility_id=Rent
  Page Should Contain Element  accessibility_id=Maintenance

I Should Sees List Brands
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}