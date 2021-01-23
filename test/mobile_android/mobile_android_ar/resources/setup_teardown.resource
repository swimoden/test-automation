*** Settings ***
Documentation  Mobile Test
Library  AppiumLibrary  
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  OperatingSystem
Library  String

*** Variables ***
# ${USER_NAME}  marwenouni1
# ${ACESS_KEY}  wA5ePxcK1p4v8u2DZ3MD
${APPIUM_SERVER}  http://localhost:4730/wd/hub
${APP}  d:app.apk
${DEVICE}  Galaxy A51
${OS_VERSION}  9.0 
${platformName}  android

*** Keywords ***
Open the application
  Open Application  ${APPIUM_SERVER}  app=${APP}  platformName=${platformName}  device=${DEVICE}  os_version=${OS_VERSION}  project=Showroomz  name=${SUITE NAME.rsplit('.')[0]}
  Set Appium Timeout  30 seconds
  Select Arabic language
  #Wait and close Pub


Select Arabic language
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/arabicBtn  
  Click Element  id=com.kuwait.showroomz.refac:id/arabicBtn
Check Arabic language button
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/arabicBtn  
  Click Element  id=com.kuwait.showroomz.refac:id/arabicBtn

Allow Applications Location Service
  Wait Until Element Is Visible  name=Allow While Using App
  Click Element  name=Allow While Using App

Wait and close Pub
  Wait Until Element Is Visible  accessibility_id=close icon  timeout=200  
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

I go back to menu from test drive request screen
  Click Element  id=com.kuwait.showroomz.refac:id/back_bnt
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub

  Click Element  id=com.kuwait.showroomz.refac:id/back
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Wait Until Page Contains Element  xpath=//*[contains(@text,'سيارات')]

  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[2]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[3]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[4]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[5]
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button

I go back to menu from model detail
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub

  Click Element  id=com.kuwait.showroomz.refac:id/back
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Wait Until Page Contains Element  xpath=//*[contains(@text,'سيارات')]

  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[2]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[3]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[4]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[5]
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button

I go back to menu from test drive request - add address
  Click Element  id=com.kuwait.showroomz.refac:id/back_btn
  Click Element  id=com.kuwait.showroomz.refac:id/back_bnt
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Click Element  id=com.kuwait.showroomz.refac:id/back
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Wait Until Page Contains Element  xpath=//*[contains(@text,'سيارات')]

  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[2]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[3]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[4]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[5]
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button
