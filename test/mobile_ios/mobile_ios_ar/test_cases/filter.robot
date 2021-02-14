** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application and Login
Force Tags  Ios  filter

*** Variables ***

*** Test Cases ***
I Succeed to make a car filter
  [Tags]  Ios_ar_filter_car
  [Setup]  As User I login in app
  I can navigate to List Brand
  I can navigate to filter screen
  I can apply filter  5000  سيدان  أبارث
  I should be in car page  Abarth 695
  I go back to menu from car filter

I Succeed to make a maintenance filter
  [Tags]  Ios_ar_filter_maintenance
  I can navigate to List Brand
  I can navigate to sub category Maintenance
  I Should sees Filter 
  I can navigate to maintenance filter screen
  I can apply maintenance filter  أكيورا
  I Should be in page List of location and map with pins  أكيورا: مركز خدمة سريعة أكيورا الري
  I go back to menu from maintenance filter

I Succeed to Search from Brands screen bike
  [Tags]  Ios_ar_bike_filter
  I can navigate to List bike brands
  I can navigate to filter screen
  I can apply filter  5000  2 wheels  بي أم دبليو
  I should sees bikes  جي 310 جي اس - كوسميك بلاك  ار ناين تي سكرامبلر
  I go back to menu from bike filter
  [Teardown]  NONE

*** Keywords ***
I should sees bikes
  [Arguments]  ${first_bike}  ${second_bike}
  Wait Until Page Contains Element  xpath=//XCUIElementTypeStaticText[@name="${first_bike}"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeStaticText[@name="${second_bike}"]

I can navigate to List bike brands
  I have access to Dashborad Screen 
  I navigate to List bike Brand 
  I Should be on List Bike Brand

I navigate to List bike Brand
  Click Element  accessibility_id=دراجات
  Run Keyword And Ignore Error  Wait and close Pub

I Should be on List Bike Brand
  Wait Until Element Is Visible  accessibility_id=KAWASAKI - MOTORCYCLES
  Wait Until Element Is Visible  accessibility_id=KAWASAKI - SIDE X SIDE

I Should be in page List of location and map with pins
  [Arguments]  ${brand}
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="${brand}"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="طلب موعد"]

I select maintenance brand
  [Arguments]  ${brand_name}

I can navigate to sub category Maintenance
  Click Element  accessibility_id=الصيانة


I go back to menu from car filter
  Click Element  accessibility_id=back black
  Click Element  accessibility_id=multiply
  Run Keyword And Ignore Error  Close advertisement
  Page Should Contain Element  accessibility_id=الجديدة
  Page Should Contain Element  accessibility_id=المعتمدة
  Page Should Contain Element  accessibility_id=الإيجار
  Page Should Contain Element  accessibility_id=الإيجار اليومي
  Page Should Contain Element  accessibility_id=الصيانة
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Close advertisement
  Wait Until Element Is Visible  accessibility_id=menu 

I go back to menu from maintenance filter
  Click Element  accessibility_id=back black
  Wait Until Element Is Visible  accessibility_id=multiply
  Click Element  accessibility_id=multiply
  Run Keyword And Ignore Error  Close advertisement
  Page Should Contain Element  accessibility_id=الإيجار
  Page Should Contain Element  accessibility_id=الصيانة
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Close advertisement
  Wait Until Element Is Visible  accessibility_id=menu

I go back to menu from bike filter
  Click Element  accessibility_id=back black
  Click Element  accessibility_id=multiply
  Run Keyword And Ignore Error  Close advertisement
  Page Should Contain Element  xpath=//XCUIElementTypeStaticText[@name="دراجات"]
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Close advertisement
  Wait Until Element Is Visible  accessibility_id=menu


I should be in car page
  [Arguments]  ${car_name}
  Wait Until Element Is Visible  //XCUIElementTypeStaticText[@name="${car_name}"]
  Hide Keyboard

I can apply filter
  [Arguments]  ${budget}  ${type}  ${brand} 
  I set budget  ${budget}  
  I Select type  ${type}
  I Select brand  ${brand} 
  I click next arrow 

I can apply maintenance filter
  [Arguments]  ${brand} 
  I Select brand  ${brand} 
  I click next arrow

I click next arrow
  Click Element  accessibility_id=Right

I set budget
  [Arguments]  ${budget}
  Input Text  xpath=//XCUIElementTypeTextField[@value="ادخل ميزانيتك هنا..."]  ${budget}
  Hide Keyboard

I Select type
  [Arguments]  ${type} 
  Click Element  accessibility_id=${type} 

I Select brand
  [Arguments]  ${brand} 
  Click Element  accessibility_id=${brand}  
  Run Keyword And Ignore Error  Click Element  accessibility_id=${brand}

I can navigate to filter screen
  I navigate to filter Screen
  I Should be on filter Screen

I can navigate to maintenance filter screen
  I navigate to filter Screen
  I Should be on maintenance filter Screen

I navigate to filter Screen
  Click Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[1]

I Should be on filter Screen
  Wait Until Element Is Visible  accessibility_id=الميزانية
  Wait Until Element Is Visible  accessibility_id=فلترة

I Should be on maintenance filter Screen
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="الوكلاء"]
  Wait Until Element Is Visible  accessibility_id=فلترة

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
  Wait Until Element Is Visible  accessibility_id=سيارات  

I navigate to List Brand
  Click Element  accessibility_id=سيارات
  Run Keyword And Ignore Error  Wait and close Pub

I Should be on List Brand
  I Should Sees Sub Categories
  I Should Sees List Brands


I Should sees Filter
  Wait Until Element Is Visible  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[1]


I Should Sees Sub Categories
  Page Should Contain Element  accessibility_id=الجديدة
  Page Should Contain Element  accessibility_id=المعتمدة
  Page Should Contain Element  accessibility_id=الإيجار
  Page Should Contain Element  accessibility_id=الإيجار اليومي
  Page Should Contain Element  accessibility_id=الصيانة

I Should Sees List Brands
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}
