*** Settings ***
Documentation  Mobile Test
Library  AppiumLibrary  
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  OperatingSystem
Library  String

*** Variables ***
${USER_NAME}  bambounamed1
${ACESS_KEY}  kotdtzWABxQR5cxwMxiK
${APPIUM_SERVER}  http://${USER_NAME}:${ACESS_KEY}@hub.browserstack.com/wd/hub
${APP}  bs://d222dd044a3ce22a25255c5e4c927d65adbedc7c
${DEVICE}  iPhone 11 Pro Max
${OS_VERSION}  14 
${BUILD}  local build


*** Keywords ***
Open the application
  Open Application  ${APPIUM_SERVER}  app=${APP}  device=${DEVICE}  os_version=${OS_VERSION}  project=Showroomz  build=${BUILD}  name=${BUILD}  language=en  locale=kw_CA  autoAcceptAlerts=true  
  Set Appium Timeout  30 seconds
  Run Keyword And Ignore Error  Allow Applications Location Service
  Choose language  عربي  
  Run Keyword And Ignore Error  Wait and close Pub

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