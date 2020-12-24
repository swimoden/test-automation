
** Settings ***
Documentation  Register & login & logout 
Library  FakerLibrary
Resource  ../resources/setup_teardown.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite

*** Variables ***
${phone_number_error}  رقم الهاتف, Error: يجب ان يتكون رقم الهاتف من 8 ارقام
${name_error}  الاسم:, Error: يجب ادخال الاسم
${email_error}  البريد الالكتروني, Error: البريد الالكتروني غير صحيح
${password_error}  كلمة المرور, Error: كلمة المرور لا يجب ان تقل عن 8 حروف

*** Test Cases ***
As User I try to register
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
  I should sees profile screen  ${user}[0]  ${user}[1]  testtest  ${user}[2]



# As User I login to App
#  I can Open Menu 
#  I select Profile Item
#  I navigate to register page
#  I Type a true Information and register

*** Keywords ***
I can Open Menu
  Wait Until Element Is Visible  accessibility_id=menu  
  Click Element  accessibility_id=menu


I select Profile Item
  Wait Until Element Is Visible  accessibility_id=حسابي
  Click Element  accessibility_id=حسابي

I navigate to register page
  Wait Until Page Contains  ادخل الى حسابك 
  Click Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeButton
  Wait Until Page Contains  تسجيل حساب جديد

I type register information
  [Arguments]  ${name}  ${email}  ${password}  ${phone} 
  Clear Text  accessibility_id=الاسم:
  Input Text  accessibility_id=الاسم:  ${name}
  Clear Text  accessibility_id=البريد الالكتروني
  Input Text  accessibility_id=البريد الالكتروني  ${email}
  Clear Text  accessibility_id=كلمة المرور
  Input Text  accessibility_id=كلمة المرور  ${password}
  Clear Text  accessibility_id=رقم الهاتف
  Input Text  accessibility_id=رقم الهاتف  ${phone}
  Click Element  name=تسجيل


I Type a true Information and register
  No Operation  

I Should Sees error in register screen
  [Arguments]  ${error}
  Wait Until Page Contains  ${error}  

I should sees profile screen
  [Arguments]  ${name}  ${email}  ${password}  ${phone}
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

I can Log out From App And Back to MENU
  Wait Until Element Is Visible  accessibility_id=LOG OUT
  Click Element  accessibility_id=LOG OUT
  Wait Until Element Is Visible  accessibility_id=PROFILE
  Click Element  accessibility_id=menu
  Wait Until Element Is Visible  accessibility_id=Categories  

Prepare User Random data
  ${Random_String}=  Generate Random String  5  [LETTERS]
  ${user_name}=  Catenate  automated test ${Random_String}
  ${user_email}=  Catenate  SEPARATOR=  ${Random_String}  @test.com
  ${phone}=  Random Int  min=10010002  max=99999999  step=1
  ${user}=  Create List  ${user_name}  ${user_email}  ${phone}
  [Return]  ${user}
