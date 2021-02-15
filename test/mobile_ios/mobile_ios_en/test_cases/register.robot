
** Settings ***
Documentation  Register & login & logout 
Library  FakerLibrary
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Force Tags  Ios  Ios_en  register

*** Variables ***
${phone_number_error}  Phone number, Error: Phone number must be 8 digits
${name_error}  Name:, Error: Name should not be emty
${email_error}  e-mail, Error: Invalid e-mail
${password_error}  password, Error: Password should be at least 8 charechters


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


# As User I login to App
#  I can Open Menu 
#  I select Profile Item
#  I navigate to register page
#  I Type a true Information and register

*** Keywords ***
I navigate to register page
  Wait Until Page Contains  Login To Your Account 
  Click Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]
  Wait Until Page Contains  Register new Account

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
