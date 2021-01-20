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
  Wait Until Element Is Visible  accessibility_id=PROFILE
  Click Element  accessibility_id=PROFILE
  Wait Until Page Contains  Login To Your Account 

I should sees profile screen
  [Arguments]  ${name}  ${email}  
  Wait Until Page Contains Element  xpath=//XCUIElementTypeStaticText[@name="Profile"] 
  Wait Until Page Contains Element  xpath=//XCUIElementTypeButton[@name="Edit Profile"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeButton[@name="Change password"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeStaticText[@name="FAVORITES"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeStaticText[@name="CALL BACKS"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeStaticText[@name="FINANCE CALL BACKS"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeStaticText[@name="FINANCE REQUEST"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeStaticText[@name="TEST DRIVES"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeStaticText[@name="PAYMENTS"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeStaticText[@name="LOG OUT"]
  Page Should Contain Element  accessibility_id=${name}
  Page Should Contain Element  accessibility_id=${email} 

I go back to menu
  Click Element  accessibility_id=back
  Wait Until Element Is Visible  accessibility_id=menu 


As User I login in app
  I can Open Menu
  I select Profile Item
  I set user Information  testAuto@test.com  testtest
  Click Element  xpath=//XCUIElementTypeButton[@name="LOGIN"]
  I should sees profile screen  automated test1  testAuto@test.com  
  [Teardown]  I go back to menu


I set user Information
  [Arguments]  ${user_email}  ${user_password}
  Input Text  accessibility_id=e-mail  ${user_email}
  Input Text  accessibility_id=password  ${user_password}

I go back to menu from model details
  Click Element  accessibility_id=back
  Wait Until Page Contains Element  xpath=//XCUIElementTypeButton[@name="multiply"]
  Click Element  xpath=//XCUIElementTypeButton[@name="multiply"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}
  Click Element  accessibility_id=back black
  Run Keyword And Ignore Error  Close advertisement
  Page Should Contain Element  accessibility_id=New
  Page Should Contain Element  accessibility_id=Certified
  Page Should Contain Element  accessibility_id=Leasing
  Page Should Contain Element  accessibility_id=Rent
  Page Should Contain Element  accessibility_id=Maintenance
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Close advertisement
  Wait Until Element Is Visible  accessibility_id=menu  

Close advertisement
  Run Keyword And Continue On Failure  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]
  Run Keyword And Continue On Failure  Click Element  xpath=//XCUIElementTypeButton[@name="close icon"] 

I go back to menu from model details Recently Viewed
  Wait Until Element Is Visible  accessibility_id=back
  Click Element  accessibility_id=back
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]
  Click Element  xpath=//XCUIElementTypeButton[@name="close icon"] 
  Wait Until Element Is Visible  accessibility_id=menu  

I go back to menu from model details favorites
  Wait Until Element Is Visible  accessibility_id=back
  Click Element  accessibility_id=back
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="Favorites"]
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]
  Run Keyword And Ignore Error  Click Element  xpath=//XCUIElementTypeButton[@name="close icon"] 
  Wait Until Element Is Visible  accessibility_id=menu

 I go back to menu from model finance callback details 
  Click Element  accessibility_id=back
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="ic inetrior"]  
  Click Element  accessibility_id=back
  Wait Until Page Contains Element  xpath=//XCUIElementTypeButton[@name="multiply"]
  Click Element  xpath=//XCUIElementTypeButton[@name="multiply"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}
  Click Element  accessibility_id=back black
  Run Keyword And Ignore Error  Close advertisement
  Page Should Contain Element  accessibility_id=New
  Page Should Contain Element  accessibility_id=Certified
  Page Should Contain Element  accessibility_id=Leasing
  Page Should Contain Element  accessibility_id=Rent
  Page Should Contain Element  accessibility_id=Maintenance
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Close advertisement
  Wait Until Element Is Visible  accessibility_id=menu 

I go back to menu from model finance callback details Recently Review
  Click Element  accessibility_id=back
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="ic inetrior"]  
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Close advertisement
  Wait Until Element Is Visible  accessibility_id=menu