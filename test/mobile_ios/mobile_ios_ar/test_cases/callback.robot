** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application and Login

*** Variables ***

*** Test Cases ***
I Succeed to make a Request callback from brand
  [Tags]  Ios_ar_callback_brand
  [Setup]  As User I login in app
  I can navigate to List Brand
  I can navigate to List of models  شانجان
  I can navigate to the details of the model  شانجان  CS 85
  I can make a Request Callback  Mohamd Amine  6677  66770000
  I go back to menu from model details


I Succeed to make a Request callback from Recently Viewed
  [Tags]  Ios_ar_callback_recently_view
  I visit a model and back to menu  شانجان  سي اس 75
  I select mode From Recently Viewed
  I can make a Request Callback  Mohamd Amine  6677  66770000
  I go back to menu from model details Recently Viewed

I Succeed to make a Request callback from FAVORITES
  [Tags]  Ios_ar_callback_FAVORITES
  I visit a model add it to favorites and back to menu  شانجان  سي اس 75
  I can Open Menu
  I select favorites Item
  I select mode From favorites List  سي اس 75
  I can make a Request Callback  Mohamd Amine  6677  66770000
  I go back to menu from model details favorites

I Succeed to make a Request finance callback from brand
  [Tags]  Ios_ar_fiance_callback_brand
  I can navigate to List Brand
  I can navigate to List of models  شانجان
  I can navigate to the details of the model  شانجان  CS 85
  I can make a Request finance Callback  100  2 سنوات  Mohamd Amine  6677  66770000  123456789012
  I go back to menu from model finance callback details  

I Succeed to make finance callback from Recently Viewed
  [Tags]  Ios_ar_fiance_callback_brand_recently_view 
  I visit a model and back to menu  شانجان  سي اس 75
  I select mode From Recently Viewed
  I can make a Request finance Callback  100  2 سنوات  Mohamd Amine  6677  66770000  123456789012
  I go back to menu from model finance callback details Recently Review 
  [Teardown]  NONE



*** Keywords ***
I can make a Request finance Callback
  [Arguments]  ${down_payment}  ${instalement_period}  ${nom_user}  ${false_phone_number}  ${phone_number}  ${civil_id}
  I can see model Actions buttons
  I click Finance Action button
  I passed a Finance callback Request  ${down_payment}  ${instalement_period}  ${nom_user}  ${false_phone_number}  ${phone_number}  ${civil_id}

I click Finance Action button
  Click Element  xpath=//XCUIElementTypeStaticText[@name="تمويل"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="احسب"]

I passed a Finance callback Request
  [Arguments]  ${down_payment}  ${instalement_period}  ${nom_user}  ${false_phone_number}  ${phone_number}  ${civil_id}
  Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField  ${down_payment}
  Click Element  id=done
  Click Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeCollectionView/XCUIElementTypeCell[6]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeImage
  Click Element  xpath=//XCUIElementTypeStaticText[@name="${instalement_period}"]
  I should sees the calculation result
  I achieved a finance call back request  ${nom_user}  ${false_phone_number}  ${phone_number}  ${civil_id}

I achieved a finance call back request
  [Arguments]  ${nom_user}  ${false_phone_number}  ${phone_number}  ${civil_id}
  Click Element  //XCUIElementTypeStaticText[@name="طلب اتصال"]
  I have access to callback popup
  I set Full name  ${nom_user}
  I set false Phone Number  ${false_phone_number}
  I validate Callback Request
  I cannot proceed Callback Request
  I set Phone Number  ${phone_number}
  I set civilId  ${civil_id}
  I validate Callback Request
  I should see success pop up

I set civilId
  [Arguments]  ${civil_id}
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[3]  ${civil_id}
I should sees the calculation result
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="الحسبة التقريبية"]

I select mode From favorites List
  [Arguments]  ${model_name}
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="${model_name}"]
  Click Element  xpath=//XCUIElementTypeStaticText[@name="${model_name}"]

I select favorites Item
  Click Element  xpath=//XCUIElementTypeStaticText[@name="المفضلة"]
  Wait Until Element Is Visible  //XCUIElementTypeStaticText[@name="سيارات "]

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
  Wait Until Element Is Visible  xpath=(//XCUIElementTypeStaticText[@name="سيارات | الجديدة | "])[2] 
  Click Element  xpath=(//XCUIElementTypeStaticText[@name="سيارات | الجديدة | "])[2]

I visit a model and back to menu
  [Arguments]  ${brand_name}  ${model_name}
  I can navigate to List Brand
  I can navigate to List of models  ${brand_name}
  I can navigate to the details of the model  ${brand_name}  ${model_name}
  I go back to menu from model details

I can make a Request Callback
  [Arguments]  ${nom_user}  ${false_phone_number}  ${phone_number}  
  I can see model Actions buttons
  I click Callback Action button
  I passed a callback Request  ${nom_user}  ${false_phone_number}  ${phone_number}

I can navigate to the details of the model
  [Arguments]  ${model_name}  ${brand_name}
  I have access to the List of models  ${model_name} 
  I selects model with name  ${brand_name}
  I should Sees the details of the model  ${brand_name}

I can navigate to List of models
  [Arguments]  ${model_name}
  I have access to List Brand
  I selects a brand with name  ${model_name}
  I should Sees the List of model  ${model_name}

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

I cannot proceed Callback Request
  Page Should Contain Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[2]

I validate Callback Request
  Click Element  accessibility_id=tick mark icon

I should see success pop up
  Wait Until Element Is Visible  accessibility_id=تم بنجاح  
  Sleep  3s
  Run Keyword And Continue On Failure  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]  
  Run Keyword And Continue On Failure  Click Element  xpath=//XCUIElementTypeButton[@name="close icon"]
  Sleep  3s

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
  Run Keyword And Ignore Error  Wait and close Pub
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="الفرع الرئيسي"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="${brand_name}"]
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
  Run Keyword And Ignore Error  Wait and close Pub

I Should be on List Brand
  I Should Sees Sub Categories
  I Should Sees List Brands

I Should Sees Sub Categories
  Page Should Contain Element  accessibility_id=الجديدة
  Page Should Contain Element  accessibility_id=المعتمدة
  Page Should Contain Element  accessibility_id=الإيجار
  Page Should Contain Element  accessibility_id=الإيجار اليومي
  Page Should Contain Element  accessibility_id=الصيانة


I Should Sees List Brands
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}