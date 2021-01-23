*** Settings ***
Documentation  Mobile Test
Library  AppiumLibrary  
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  OperatingSystem
Library  String

*** Keywords ***


I should sees profile screen
  [Arguments]  ${name}  ${email}  
  Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/profile_txt
  Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/edit_profile_btn
  Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/changePassword_btn
  Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/favorite_txt
  Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/callbacks_txt
  Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/finance_txt
  Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/finance_request_txt
  Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/test_drives_txt
  Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/payments_txt
  # Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/logout_txt


I go back to menu
  Click Element  id=com.kuwait.showroomz.refac:id/back_bnt
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button

I can Open Menu
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button
  Click Element  id=com.kuwait.showroomz.refac:id/menu_button

I select Profile Item
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.TextView
  Wait Until Page Contains  تسجيل الدخول إلى حسابك 

As User I login in app
  I can Open Menu
  I select Profile Item
  I set user Information  testAuto@test.com  testtest
  Click Element  id=com.kuwait.showroomz.refac:id/login_btn
  I should sees profile screen  automated test1  testAuto@test.com
  [Teardown]  I go back to menu


I set user Information
  [Arguments]  ${user_email}  ${user_password}
  Input Text  id=com.kuwait.showroomz.refac:id/emailTextInputEditText  ${user_email}
  Input Text  id=com.kuwait.showroomz.refac:id/passwordTextInputEditText  ${user_password}

I go back to menu from model details
  Click Element  accessibility_id=back
  Wait Until Page Contains Element  xpath=//XCUIElementTypeButton[@name="multiply"]
  Click Element  xpath=//XCUIElementTypeButton[@name="multiply"]
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
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]
  Click Element  xpath=//XCUIElementTypeButton[@name="close icon"] 

I go back to menu from model details Recently Viewed
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_button
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  # Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]
  # Click Element  xpath=//XCUIElementTypeButton[@name="close icon"]
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button 

I go back to menu from model details favorites
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_btn
  Click Element  id=com.kuwait.showroomz.refac:id/back_btn
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button

 I go back to menu from model finance callback details 
  Click Element  id=com.kuwait.showroomz.refac:id/back_bnt
  sleep  3s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub

  Click Element  id=com.kuwait.showroomz.refac:id/back
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub

  Click Element  id=com.kuwait.showroomz.refac:id/back

I go back to menu from test drive screen -model Recently Viewed
  Click Element  id=com.kuwait.showroomz.refac:id/back_bnt
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_button
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button 
