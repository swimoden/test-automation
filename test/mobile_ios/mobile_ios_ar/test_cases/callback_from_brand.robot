** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite

*** Variables ***

*** Test Cases ***
I can navigate to List Brand
  I have access to Dashborad Screen 
  I navigate to List Brand 
  I Should be on List Brand 

I can navigate to List of models
  I have access to List Brand
  I selects a brand with name  شانجان
  I should Sees the List of model  شانجان

I can navigate to the details of the model
  I have access to the List of models  شانجان
  I selects model with name  CS 85
  I should Sees the details of the model  CS 85

# I can make a Request Callback
#  I can see model Actions buttons
#  I click Callback Action button
#  I passed a callback Request  Mohamd Amine  6677  66770000

*** Keywords ***
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

I cannot proceed Callback Request
  Page Should Contain Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[2]

I validate Callback Request
  Click Element  accessibility_id=tick mark icon

I should see success pop up
  Wait Until Element Is Visible  accessibility_id=تم بنجاح  
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]  
  Click Element  accessibility_id=close icon


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
  Wait Until Element Is Visible  accessibility_id=الرجاء أدخل معلوماتك لالتواصل معك

I can see model Actions buttons
  I have access to model details screen  
  Click Element  xpath=//XCUIElementTypeButton[@name="اضغط هنا ${SPACE}"]
  I can sees list of actions

I click Callback Action button
  Click Element  xpath=//XCUIElementTypeStaticText[@name="طلب اتصال"]

I have access to model details screen

  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="اضغط هنا ${SPACE}"]

I can sees list of actions
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="طلب اتصال"]

I should Sees the details of the model
  [Arguments]  ${model_name}
  Wait Until Element Is Visible  accessibility_id=${model_name}  

I selects model with name
  [Arguments]  ${model_name}
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="${model_name}"]
  Click Element  xpath=//XCUIElementTypeStaticText[@name="${model_name}"]
    # xpath=//XCUIElementTypeStaticText[@name="Changan "]
I have access to the List of models
  [Arguments]  ${brand_name}
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="الفرع الرئيسي"]

I should Sees the List of model
  [Arguments]  ${brand_name}
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="الفرع الرئيسي"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="شانجان"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}

I selects a brand with name
  [Arguments]  ${brand_name}
  # xpath=//XCUIElementTypeStaticText[@name="Changan "]
  Click Element  //XCUIElementTypeStaticText[@name="${brand_name}"]
    # xpath=//XCUIElementTypeStaticText[@name="Changan "]
  Run Keyword And Continue On Failure  Click Element  //XCUIElementTypeStaticText[@name="${brand_name}"]

I have access to List Brand
  I Should Sees List Brands

I have access to Dashborad Screen
  Wait Until Element Is Visible  accessibility_id=سيارات  

I navigate to List Brand
  Click Element  accessibility_id=سيارات
  Wait and close Pub

I Should be on List Brand
  I Should Sees Sub Categories
  I Should Sees List Brands

I Should Sees Sub Categories
  Page Should Contain Element  accessibility_id=الجديدة
  Page Should Contain Element  accessibility_id=Certified
  Page Should Contain Element  accessibility_id=Leasing
  Page Should Contain Element  accessibility_id=Rent
  Page Should Contain Element  accessibility_id=Maintenance


I Should Sees List Brands
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}