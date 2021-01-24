*** Settings ***
Documentation  Mobile Test
Resource  ../resources/keywords.resource
Library  AppiumLibrary  
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  OperatingSystem
Library  String

*** Variables ***
${USER_NAME}  guedhamimohamedm1
${ACESS_KEY}  phAYz3KfvGtvNR4KoZ97
${APPIUM_SERVER}  http://${USER_NAME}:${ACESS_KEY}@hub.browserstack.com/wd/hub
${APP}  bs://167020785b0914f222af4be7b8f8181fde5f0f26
${DEVICE}  iPhone XS
${OS_VERSION}  14.0
${BUILD}  local build


*** Keywords ***
Open the application
  ${DEVICE} =  Replace String  ${DEVICE}  _  ${SPACE}
  Open Application  ${APPIUM_SERVER}  app=${APP}  device=${DEVICE}  os_version=${OS_VERSION}  project=Showroomz  build=${BUILD}  name=${SUITE NAME.rsplit('.')[0]}  language=en  locale=kw_CA  autoAcceptAlerts=true  
  Set Appium Timeout  30 seconds
  Run Keyword And Ignore Error  Allow Applications Location Service
  Choose language  ENGLISH  
  Wait and close Pub

Choose language
  [Arguments]  ${language}
  Wait Until Element Is Visible  name=${language}  
  Click Element  name=${language}

Allow Applications Location Service
  Wait Until Element Is Visible  name=Allow While Using App
  Click Element  name=Allow While Using App

Wait and close Pub
  Wait Until Element Is Visible  accessibility_id=close icon  timeout=20  
  Click Element  accessibility_id=close icon

Clean up the test suite
  Close All Applications

Relod Application and Login
  Close All Applications
  Open the application
  As User I login in app

Relod Application
  Close All Applications
  Open the application