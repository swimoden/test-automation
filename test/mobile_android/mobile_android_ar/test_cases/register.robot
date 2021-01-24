
** Settings ***
Documentation  Register & login & logout 
Library  FakerLibrary
Resource  ../resources/setup_teardown.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application
Force Tags  Android  Android_Register_Ar  Android_Register



*** Variables ***
${phone_number_error}  رقم الهاتف فارغ
${name_error}  الاسم فارغ 
${email_error}  بريد إلكتروني خاطئ
${password_error}  رمز مرور خاطئ 


*** Test Cases ***
As User I try to register
  [Tags]  register
  ${user}=  Prepare User Random data
  I can Open Menu
  I select Profile Item
  I navigate to register page
  I type register information  ${EMPTY}  ${user}[1]  testtest  ${user}[2]
  I Should Sees error in register screen  ${name_error}
  I type register information  ${user}[0]  ${EMPTY}  testtest  ${user}[2]
  I Should Sees error in register screen  ${email_error}
  I type register information  ${user}[0]  ${user}[1]  ${EMPTY}  ${user}[2]
  I Should Sees error in register screen  ${password_error}
  I type register information  ${user}[0]  ${user}[1]  testtest  ${EMPTY}
  I Should Sees error in register screen  ${phone_number_error}
  I type register information  ${user}[0]  ${user}[1]  testtest  ${user}[2]
  I should sees profile screen  ${user}[0]  ${user}[1]
  I can Log out From App And Back to MENU



As User I try to reset password
  [Tags]  Android_reset_password_ar
  I can Open Menu
  I select Profile Item
  I navigate to forget password page
  I type Email in email field  opdHp@test.com
  I should see popup

*** Keywords ***
I can Open Menu
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button
  Click Element  id=com.kuwait.showroomz.refac:id/menu_button

I select Profile Item
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.TextView
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.TextView
  Wait Until Page Contains  تسجيل الدخول إلى حسابك

I navigate to register page
  Click Element  id=com.kuwait.showroomz.refac:id/sign_up
  Wait Until Page Contains  سجل حسابك الجديد

I type register information
  [Arguments]  ${name}  ${email}  ${password}  ${phone} 
  Clear Text  id=com.kuwait.showroomz.refac:id/nameTextInputEditText
  Input Text  id=com.kuwait.showroomz.refac:id/nameTextInputEditText  ${name}
  Clear Text  id=com.kuwait.showroomz.refac:id/emailTextInputEditText
  Input Text  id=com.kuwait.showroomz.refac:id/emailTextInputEditText  ${email}
  Clear Text  id=com.kuwait.showroomz.refac:id/passwordTextInputEditText
  Input Text  id=com.kuwait.showroomz.refac:id/passwordTextInputEditText  ${password}
  Clear Text  id=com.kuwait.showroomz.refac:id/phoneTextInputEditText
  Input Text  id=com.kuwait.showroomz.refac:id/phoneTextInputEditText  ${phone}
  Click Element  id=com.kuwait.showroomz.refac:id/register_btn

I Should Sees error in register screen
  [Arguments]  ${error}
  Wait Until Page Contains  ${error}


I should sees profile screen
  [Arguments]  ${name}  ${email}
  Wait Until Page Contains  ${name}
  Wait Until Page Contains  ${email}
  sleep  13s

I navigate to forget password page
  Click Element  id=com.kuwait.showroomz.refac:id/forgetPasswordText
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/forgetPasswordText

I type Email in email field
  [Arguments]  ${email}
  Input Text  id=com.kuwait.showroomz.refac:id/emailTextInputEditText  ${email}
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.Button

I should see popup
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/design_bottom_sheet

I can Log out From App And Back to MENU
  Swipe By Percent  50  80  50  20  1000
  Click Element  id=com.kuwait.showroomz.refac:id/logout_txt
  sleep  5s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}
  ...  run keywords
  ...  sleep  30s
  ...  AND
  ...  Click Element  id=com.kuwait.showroomz.refac:id/circle_progress
  ...  AND
  ...  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button

Relod Application
  Clean up the test suite
  Open the application
Prepare User Random data
  ${Random_String}=  Generate Random String  5  [LETTERS]
  ${user_name}=  Catenate  automated test ${Random_String}
  ${user_email}=  Catenate  SEPARATOR=  ${Random_String}  @test.com
  ${phone}=  Random Int  min=10010002  max=99999999  step=1
  ${user}=  Create List  ${user_name}  ${user_email}  ${phone}
  [Return]  ${user}
