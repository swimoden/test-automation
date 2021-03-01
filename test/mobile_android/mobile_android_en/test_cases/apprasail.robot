** Settings ***
Documentation  book vehicles
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
# Test Teardown  Run Keyword If Test Failed  Relod Application
Force Tags  Android  Android_en  Book  Book_En

*** Variables ***



*** Test Cases ***

I Succeed to Book model from new cars
  [Tags]  Android_En_apparaisal
  As User I login in app
  I can navigate to List Brand
  I can navigate to List of models  BMW
  I can navigate to the details of the model  BMW  M5
  # I navigate to booking screen
  I click on A-Finance
  I fill all fields to pass the appraisal



*** Keywords ***
I click on A-Finance
  I can see model Actions buttons
  Click Element  xpath=//*[@text='A-FINANCE']
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/yes_TV
  Click Element  id=com.kuwait.showroomz.refac:id/yes_TV

I fill all fields to pass the appraisal
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/add_image
  Click Element  id=com.kuwait.showroomz.refac:id/add_image
  Wait Until Element Is Visible  xpath=//android.widget.Button[contains(@text,'Autoriser') or contains(@text,'Allow') or contains(@text,'ALLOW')]
  Click Element  xpath=//android.widget.Button[contains(@text,'Autoriser') or contains(@text,'Allow') or contains(@text,'ALLOW')]
  I send my civil id picture to the phone
  Sleep  2s
  Click Element  id=com.kuwait.showroomz.refac:id/add_image
  Wait Until Element Is Visible  xpath=//*[@text='Download']
  Click Element  xpath=//*[@text='Download']
  Click Element  xpath=//android.view.ViewGroup[0]

