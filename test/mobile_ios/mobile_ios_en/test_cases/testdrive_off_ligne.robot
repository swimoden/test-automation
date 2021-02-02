** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Library  DateTime
Resource  ../resources/setup_teardown.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application
Force Tags  Ios  testdrive

*** Variables ***

*** Test Cases ***
I Succeed to make a Request test drive from brand
  [Tags]  Ios_en_testdrive_brand_off_ligne
  I can navigate to List Brand
  I can navigate to List of models  BMW
  I can navigate to the details of the model  BMW  M5
  I can make a test drive  Mohamd Amine  66770000  testAuto@test.com
  I go back to menu from model details  

I Succeed to make a Request test drive from brand using wrong informations
  [Tags]  Ios_en_testdrive_brand_wrong_off_ligne
  I can navigate to List Brand
  I can navigate to List of models  BMW
  I can navigate to the details of the model  BMW  M5
  I can make a test drive with wrong informations  Mohamd Amine  6677  testAuto@test.com
  I go back to menu from model details  


I Succeed to make a Request test drive from Recently Viewed
  [Tags]  Ios_en_testdrive_recently_view_off_ligne
  I visit a model and back to menu  BMW  M5
  I select mode From Recently Viewed
  I can make a test drive  Mohamd Amine  66770000  testAuto@test.com
  I go back to menu from model details Recently Viewed 

I Succeed to make a Request test drive from Recently Viewed using wrong informations
  [Tags]  Ios_en_testdrive_wrong_recently_view_off_ligne
  I visit a model and back to menu  BMW  M5
  I select mode From Recently Viewed
  I can make a test drive with wrong informations  Mohamd Amine  6677  testAuto@test.com
  I go back to menu from model details Recently Viewed 


I Succeed to make a Request testdrive from FAVORITES
  [Tags]  Ios_en_testdrive_FAVORITES_off_ligne
  I visit a model add it to favorites and back to menu  BMW  M5
  I can Open Menu
  I select favorites Item
  I select mode From favorites List  M5
  I can make a test drive  Mohamd Amine  66770000  testAuto@test.com
  I go back to menu from model details favorites


I Succeed to make a Request testdrive from FAVORITES using wrong informations
  [Tags]  Ios_en_testdrive_FAVORITES_wrong_off_ligne
  I visit a model add it to favorites and back to menu  BMW  M5
  I can Open Menu
  I select favorites Item
  I select mode From favorites List  M5
  I can make a test drive with wrong informations  Mohamd Amine  6677  testAuto@test.com
  I go back to menu from model details favorites
  [Teardown]  NONE

*** Keywords ***

I select mode From favorites List
  [Arguments]  ${model_name}
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="${model_name}"]
  Click Element  xpath=//XCUIElementTypeStaticText[@name="${model_name}"]

I select favorites Item
  Click Element  accessibility_id=FAVORITES
  Wait Until Element Is Visible  //XCUIElementTypeStaticText[@name="Car "]

I visit a model add it to favorites and back to menu
  [Arguments]  ${brand_name}  ${model_name}
  I can navigate to List Brand
  I can navigate to List of models  ${brand_name}
  I can navigate to the details of the model  ${brand_name}  ${model_name}
  I add brand to favorites List
  I go back to menu from model details

I add brand to favorites List
  Click Element  xpath=//XCUIElementTypeButton[@name="ic favorites"]

I select mode From Recently Viewed
  Wait Until Element Is Visible  xpath=(//XCUIElementTypeStaticText[@name="Car | New | "])[2] 
  Click Element  xpath=(//XCUIElementTypeStaticText[@name="Car | New | "])[2] 

I visit a model and back to menu
  [Arguments]  ${brand_name}  ${model_name}
  I can navigate to List Brand
  I can navigate to List of models  ${brand_name}
  I can navigate to the details of the model  ${brand_name}  ${model_name}
  I go back to menu from model details

I can navigate to List Brand
  I have access to Dashborad Screen 
  I navigate to List Brand 
  I Should be on List Brand 

I can navigate to List of models
  [Arguments]  ${model_name}
  I have access to List Brand
  I selects a brand with name  ${model_name}
  I should Sees the List of model  ${model_name}

I can navigate to the details of the model
  [Arguments]  ${model_name}  ${brand_name}
  I have access to the List of models  ${model_name}
  I selects model with name  ${brand_name}
  I should Sees the details of the model  ${brand_name}

I can make a test drive
  [Arguments]  ${nom_user}  ${phone_number}  ${email}
  I can see model Actions buttons
  I click test drive Action button
  I can select location  Al Shuwaikh
  I select date test drive at showroom
  I select timing test drive at showroom  13:00
  I enter correct information  ${nom_user}  ${phone_number}  ${email}
  I validate test drive request 
  I should see success pop up

I can make a test drive with wrong informations
  [Arguments]  ${nom_user}  ${phone_number}  ${email}
  I can see model Actions buttons
  I click test drive Action button
  I can select location  Al Shuwaikh
  I select date test drive at showroom
  I select timing test drive at showroom  13:00
  I enter correct information  ${nom_user}  ${phone_number}  ${email}
  I validate test drive request 
  I cannot proceed Callback Request

I cannot proceed Callback Request
  Click Element  accessibility_id=close icon
  Sleep  2s
  Click Element  accessibility_id=back

I validate test drive request
  Click Element  accessibility_id=tick mark icon

I enter correct information
  [Arguments]  ${nom_user}  ${phone_number}  ${email}
  Click Element  xpath=//XCUIElementTypeButton[@name="Test Drive At Showroom"]
  I set Full name  ${nom_user}
  I set Phone Number  ${phone_number}
  I set email  ${email}

I can select location
  [Arguments]  ${location_name}
  Wait Until Element Is Visible  accessibility_id=${location_name}
  Click Element  accessibility_id=${location_name}
  Sleep  3s

I select date test drive at showroom
  ${date} =  Get Current Date  result_format=%d  increment=+1 day 
  Click Element  accessibility_id=${date}

I select timing test drive at showroom
  [Arguments]  ${timing}
  Click Element  accessibility_id=${timing} 

I click test drive Action button
  Click Element  accessibility_id=Test Drive
  Wait Until Element Is Visible  accessibility_id=Prefered Showroom



I set civilId
  [Arguments]  ${civil_id}
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[3]  ${civil_id}

I validate Callback Request
  Click Element  accessibility_id=tick mark icon

I should see success pop up
  Wait Until Element Is Visible  accessibility_id=Success  
  Sleep  5s
  wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]
  Wait Until Element Is Visible  accessibility_id=You have successfully booked test drive, please check your email for test drive information
  Click Element  xpath=//XCUIElementTypeButton[@name="close icon"]
  Sleep  5s

I set Full name
  [Arguments]  ${full_name}
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[1]  ${full_name}

I set email
  [Arguments]  ${email}
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[3]  ${email}

I set Phone Number
  [Arguments]  ${phone_number}
  AppiumLibrary.Clear Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[2]
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[2]  ${phone_number}

I set false Phone Number
  [Arguments]  ${false_phone_number}
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[2]  ${false_phone_number}

I have access to callback popup
  Wait Until Element Is Visible  accessibility_id=Please Add your information to be contacted

I can see model Actions buttons
  I have access to model details screen  
  Click Element  xpath=//XCUIElementTypeButton[@name="${SPACE} Click Here"] 
  I can sees list of actions

I click Callback Action button
  Click Element  accessibility_id=CallBack

I have access to model details screen
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="${SPACE} Click Here"]


I can sees list of actions
  Wait Until Element Is Visible  accessibility_id=CallBack

I should Sees the details of the model
  [Arguments]  ${model_name}
  Wait Until Element Is Visible  accessibility_id=${model_name}  

I selects model with name
  [Arguments]  ${model_name}
  Wait Until Element Is Visible  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[1]/XCUIElementTypeButton
  Click Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[1]/XCUIElementTypeButton
  Wait Until Element Is Visible  xpath=//XCUIElementTypeTextField[@value="You can Search by Brand, Model or budget"]  
  Input Text  xpath=//XCUIElementTypeTextField[@value="You can Search by Brand, Model or budget"]  ${model_name}
  Wait Until Page Contains Element  xpath=//XCUIElementTypeStaticText[@name="${model_name}"]  timeout=20s
  Click Element  xpath=//XCUIElementTypeStaticText[@name="${model_name}"]
    # xpath=//XCUIElementTypeStaticText[@name="Changan "]
I have access to the List of models
  [Arguments]  ${brand_name}
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="Main Showroom"]

I should Sees the List of model
  [Arguments]  ${brand_name}
  Run Keyword And Ignore Error  Wait and close Pub
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="Main Showroom"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="${brand_name}"]
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}

I selects a brand with name
  [Arguments]  ${brand_name}
  # xpath=//XCUIElementTypeStaticText[@name="Changan "]
  Click Element  xpath=//XCUIElementTypeStaticText[@name="${brand_name}"]
    # xpath=//XCUIElementTypeStaticText[@name="Changan "]
  Run Keyword And Continue On Failure  Click Element  xpath=//XCUIElementTypeStaticText[@name="${brand_name}"]

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