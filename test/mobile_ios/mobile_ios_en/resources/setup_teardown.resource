*** Settings ***
Documentation  Mobile Test
Resource  ../resources/keywords.resource
Library  AppiumLibrary  
Library  Collections
Library  OperatingSystem
Library  String

*** Variables ***
${USER_NAME}  bambounamed1
${ACESS_KEY}  kotdtzWABxQR5cxwMxiK
${APPIUM_SERVER}  http://${USER_NAME}:${ACESS_KEY}@hub.browserstack.com/wd/hub
${APP}  bs://5a655452000a8ab33b25e14a3ed2c84f403846c7
${DEVICE}  iPhone 11 Pro Max
${OS_VERSION}  14.0
${BUILD}  local build


*** Keywords ***
Open the application
  ${DEVICE} =  Replace String  ${DEVICE}  _  ${SPACE}
  Open Application  ${APPIUM_SERVER}  app=${APP}  device=${DEVICE}  os_version=${OS_VERSION}  project=Showroomz  build=${BUILD}  name=${BUILD}  language=en  locale=kw_CA  autoAcceptAlerts=true 
  Log To Console  mysuite:${SUITE NAME.rsplit('.')[0]}  
  Set Appium Timeout  30 seconds
  Run Keyword And Ignore Error  Allow Applications Location Service
  Choose language  ENGLISH  
  Run Keyword And Continue On Failure  Wait and close Pub

Choose language
  [Arguments]  ${language}
  Wait Until Element Is Visible  name=${language}  
  Click Element  name=${language}

Allow Applications Location Service
  Wait Until Element Is Visible  name=Allow While Using App
  Click Element  name=Allow While Using App

Wait and close Pub
  Run Keyword And Ignore Error  Wait Until Element Is Visible  accessibility_id=close icon  timeout=20  
  Run Keyword And Ignore Error  Click Element  accessibility_id=close icon

Clean up the test suite
  Close All Applications

Relod Application and Login
  Close All Applications
  Open the application
  As User I login in app

Relod Application
  Close All Applications
  Open the application