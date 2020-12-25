
** Settings ***
Documentation  Register & login & logout 
Library  FakerLibrary
Resource  ../resources/setup_teardown.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Failed Case Handle



*** Variables ***
${phone_number_error}  Phone number, Error: Phone number must be 8 digits
${name_error}  Name:, Error: Name should not be emty
${email_error}  e-mail, Error: Invalid e-mail
${password_error}  password, Error: Password should be at least 8 charechters


*** Test Cases ***
# 1: Register



Scenario:Open Menu
  Given Menu button on dashboard screen
  When user click on menu button
  Then user will see right menu

Scenario: Select Profile Item
  Given List of action "PROFILE FINANCE FAVORITES LANGUAGE CONTACT US TERMS & CONDITIONS ABOUT APP"
  When User Clicks on “Profile”
  Then User will see login screen

Scenario: Navigate to register page
  Given user in Login Screen
  When user click on “SIGN UP”
  The user will see register page

Scenario: Type Information
  Given User in register screen
  And user type Name  “automated test”
  And user type  “testAuto@test.com”  in email field
  And user type  ${password} in password field
  And user type  ${phone} in phone number field
  When user click on register button
  Then user will see profile screen





# As User I try to register
  # ${user}=  Prepare User Random data
  # I can Open Menu
  # I select Profile Item
  # I navigate to register page
  # I type register information  ${EMPTY}  ${user}[1]  testtest  ${user}[2]
  # I Should Sees error in register screen  ${name_error}
  # I type register information  ${user}[0]  ${EMPTY}  testtest  ${user}[2]
  # I Should Sees error in register screen  ${email_error}
  # I type register information  ${user}[0]  ${user}[1]  ${EMPTY}  ${user}[2]
  # I Should Sees error in register screen  ${password_error}
  # I type register information  ${user}[0]  ${user}[1]  testtest  ${EMPTY}
  # I Should Sees error in register screen  ${phone_number_error}
  # I type register information  ${user}[0]  ${user}[1]  testtest  ${user}[2]
  # I should sees profile screen  ${user}[0]  ${user}[1]  testtest  ${user}[2]



# As User I login to App
#  I can Open Menu 
#  I select Profile Item
#  I navigate to register page
#  I Type a true Information and register

*** Keywords ***
Failed Case Handle
  Clean up the test suite
  Open the application

Menu button on dashboard screen
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button  

User click on menu button
  Click Element  id=com.kuwait.showroomz.refac:id/menu_button

user will see right menu
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/navigationView


List of action "PROFILE FINANCE FAVORITES LANGUAGE CONTACT US TERMS & CONDITIONS ABOUT APP"
  Wait Until Page Contains  PROFILE
  Wait Until Page Contains  FINANCE
  Wait Until Page Contains  FAVORITES
  Wait Until Page Contains  LANGUAGE
  Wait Until Page Contains  CONTACT US
  Wait Until Page Contains  TERMS
  Wait Until Page Contains  ABOUT APP
User Clicks on “Profile”
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.TextView

User will see login screen
  wait until page contains  Login To your account

user in Login Screen
  ${present}=  Run Keyword And Return Status
  ...  Page should contain element  id=com.kuwait.showroomz.refac:id/emailTextInputEditText
  Run Keyword If  ${present} == False
  ...  run keywords
  ...  Click Element  id=com.kuwait.showroomz.refac:id/menu_button
  ...  AND
  ...  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.TextView
  ...  AND
  ...  wait until page contains  Login To your account

When user click on “SIGN UP”
  Click Element  id=com.kuwait.showroomz.refac:id/sign_up

The user will see register page
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/register_txt
  Wait Until Page Contains  Register your new account

User in register screen
  ${present}=  Run Keyword And Return Status
  ...  Page should contain element  id=com.kuwait.showroomz.refac:id/register_txt
  Run Keyword If  ${present} == False
  ...  run keywords
  ...  Click Element  id=com.kuwait.showroomz.refac:id/menu_button
  ...  AND
  ...  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.TextView
  ...  AND
  ...  wait until page contains  Login To your account
  ...  AND
  ...  Click Element  id=com.kuwait.showroomz.refac:id/sign_up
  ...  AND
  ...  Wait Until Page Contains  Register your new account

user type Name
  [Arguments]  ${name}
  Clear Text  id=com.kuwait.showroomz.refac:id/nameTextInputEditText
  Input Text  id=com.kuwait.showroomz.refac:id/nameTextInputEditText  ${name}

user type  ${email}  in email field
  [Arguments]  ${email}
  Clear Text  id=com.kuwait.showroomz.refac:id/emailTextInputEditText
  Input Text  id=com.kuwait.showroomz.refac:id/emailTextInputEditText  ${email}

user type  ${password} in password field
  [Arguments]  ${password}
  Clear Text  id=com.kuwait.showroomz.refac:id/passwordTextInputEditText
  Input Text  id=com.kuwait.showroomz.refac:id/passwordTextInputEditText  ${password}

user type  ${phone} in phone number field
  [Arguments]  ${phone}
  Clear Text  id=com.kuwait.showroomz.refac:id/phoneTextInputEditText
  Input Text  id=com.kuwait.showroomz.refac:id/phoneTextInputEditText  ${phone}

user click on register button
  Click Element  id=com.kuwait.showroomz.refac:id/register_btn







I can Open Menu
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button  
  Click Element  id=com.kuwait.showroomz.refac:id/menu_button


I select Profile Item
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.TextView

  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/androidx.drawerlayout.widget.DrawerLayout/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.TextView


I navigate to register page
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/login_txt
  Click Element  id=com.kuwait.showroomz.refac:id/sign_up
  Wait Until Page Contains  Register your new account

I type register information
  [Arguments]  ${name}  ${email}  ${password}  ${phone} 
  Clear Text  accessibility_id=Name:
  Input Text  accessibility_id=Name:  ${name}
  Clear Text  accessibility_id=e-mail
  Input Text  accessibility_id=e-mail  ${email}
  Clear Text  accessibility_id=password
  Input Text  accessibility_id=password  ${password}
  Clear Text  accessibility_id=Phone number
  Input Text  accessibility_id=Phone number  ${phone}
  Click Element  name=SIGN UP

I Should Sees error in register screen
  [Arguments]  ${error}
  Wait Until Page Contains  ${error}  

I should sees profile screen
  [Arguments]  ${name}  ${email}  ${password}  ${phone}
  Wait Until Element Is Visible  accessibility_id=Profile 
  Wait Until Element Is Visible  accessibility_id=Edit Profile
  Wait Until Element Is Visible  accessibility_id=Change password
  Wait Until Element Is Visible  accessibility_id=FAVORITES
  Wait Until Element Is Visible  accessibility_id=CALL BACKS
  Wait Until Element Is Visible  accessibility_id=FINANCE CALL BACKS
  Wait Until Element Is Visible  accessibility_id=FINANCE REQUEST
  Wait Until Element Is Visible  accessibility_id=TEST DRIVES
  Wait Until Element Is Visible  accessibility_id=PAYMENTS
  Wait Until Element Is Visible  accessibility_id=LOG OUT
  Page Should Contain Element  accessibility_id=${name}
  Page Should Contain Element  accessibility_id=${email} 

I can Log out From App And Back to MENU
  Click Element  accessibility_id=back
  Wait Until Page Contains Element  xpath=//XCUIElementTypeButton[@name="menu"] 
  Click Element  xpath=//XCUIElementTypeButton[@name="menu"] 
  Wait Until Page Contains Element  //XCUIElementTypeStaticText[@name="Categories"]

Prepare User Random data
  ${Random_String}=  Generate Random String  5  [LETTERS]
  ${user_name}=  Catenate  automated test ${Random_String}
  ${user_email}=  Catenate  SEPARATOR=  ${Random_String}  @test.com
  ${phone}=  Random Int  min=10010002  max=99999999  step=1
  ${user}=  Create List  ${user_name}  ${user_email}  ${phone}
  [Return]  ${user}
