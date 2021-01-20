*** Settings ***
Documentation  Mobile Test
Library  AppiumLibrary  
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  OperatingSystem
Library  String

*** Keywords ***
I can Open Menu
  Wait Until Element Is Visible  accessibility_id=menu  
  Click Element  accessibility_id=menu

I select Profile Item
  Wait Until Element Is Visible  accessibility_id=حسابي
  Click Element  accessibility_id=حسابي

I should sees profile screen
  [Arguments]  ${name}  ${email} 
  Wait Until Element Is Visible  accessibility_id=حسابي 
  Wait Until Element Is Visible  accessibility_id=تعديل
  Wait Until Element Is Visible  accessibility_id=تغيير كلمة المرور	
  Wait Until Element Is Visible  accessibility_id=المفضلة
  Wait Until Element Is Visible  accessibility_id=اتصالات
  Wait Until Element Is Visible  accessibility_id=اتصالات التمويل
  Wait Until Element Is Visible  accessibility_id=طلبات التمويل
  Wait Until Element Is Visible  accessibility_id=تجارب القيادة
  Wait Until Element Is Visible  accessibility_id=الدفوعات
  Wait Until Element Is Visible  accessibility_id=خروج
  Page Should Contain Element  accessibility_id=${name}
  Page Should Contain Element  accessibility_id=${email}

As User I login in app
  I can Open Menu
  I select Profile Item
  I set user Information  testAuto@test.com  testtest
  Click Element  xpath=//XCUIElementTypeButton[@name="دخول"]
  I should sees profile screen  automated test1  testAuto@test.com  
  [Teardown]  I go back to menu

I go back to menu
  Click Element  accessibility_id=back
  Wait Until Element Is Visible  accessibility_id=menu 

I set user Information
  [Arguments]  ${user_email}  ${user_password}
  Input Text  accessibility_id=البريد الالكتروني  ${user_email}
  Input Text  accessibility_id=كلمة المرور  ${user_password}

I go back to menu from model details
  Click Element  accessibility_id=back
  Wait Until Page Contains Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}
  Click Element  accessibility_id=back black
  Run Keyword And Ignore Error  Close advertisement
  Page Should Contain Element  accessibility_id=الجديدة
  Page Should Contain Element  accessibility_id=المعتمدة
  Page Should Contain Element  accessibility_id=الإيجار
  Page Should Contain Element  accessibility_id=الإيجار اليومي
  Page Should Contain Element  accessibility_id=الصيانة
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Close advertisement
  Wait Until Element Is Visible  accessibility_id=menu  

Close advertisement
  Run Keyword And Continue On Failure  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]
  Run Keyword And Continue On Failure  Click Element  xpath=//XCUIElementTypeButton[@name="close icon"] 

I go back to menu from model details Recently Viewed
  Delete Brand from favorites List
  Wait Until Element Is Visible  accessibility_id=back
  Click Element  accessibility_id=back
  Run Keyword And Continue On Failure  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]
  Run Keyword And Continue On Failure  Click Element  xpath=//XCUIElementTypeButton[@name="close icon"] 
  Wait Until Element Is Visible  accessibility_id=menu  

Delete Brand from favorites List
  Click Element  xpath=//XCUIElementTypeButton[@name="ic favorites"]

I go back to menu from model details favorites
  Wait Until Element Is Visible  accessibility_id=back
  Click Element  accessibility_id=back
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="المفضلة"]
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]
  Run Keyword And Ignore Error  Click Element  xpath=//XCUIElementTypeButton[@name="close icon"] 
  Wait Until Element Is Visible  accessibility_id=menu

I go back to menu from model finance callback details
  Click Element  accessibility_id=back
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="الداخلي"]
  Click Element  accessibility_id=back
  Wait Until Page Contains Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}
  Click Element  accessibility_id=back black
  Run Keyword And Ignore Error  Close advertisement
  Page Should Contain Element  accessibility_id=الجديدة
  Page Should Contain Element  accessibility_id=المعتمدة
  Page Should Contain Element  accessibility_id=الإيجار
  Page Should Contain Element  accessibility_id=الإيجار اليومي
  Page Should Contain Element  accessibility_id=الصيانة
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Close advertisement
  Wait Until Element Is Visible  accessibility_id=menu  

I go back to menu from model finance callback details Recently Review
  Click Element  accessibility_id=back
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="الداخلي"]
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Close advertisement
  Wait Until Element Is Visible  accessibility_id=menu

