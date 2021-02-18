** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application and Login
Force Tags  Android  Android_en  Test_Drive  Test_Drive_En

*** Variables ***

*** Test Cases ***
I Succeed to make a Request test drive from brand using correct informations
  [Tags]  Android_En_Test_drive_from_brand
  As User I login in app
  I can navigate to List Brand
  I can navigate to List of models  Changan
  I can navigate to the details of the model  Changan  CS 85
  I can make a test drive  Mohamd Amine  66771100  testAuto@test.com
  I go back to menu from model detail

I make a Request test drive from brand using wrong informations
  [Tags]  Android_En_Test_drive_from_brand
  I can navigate to List Brand
  I can navigate to List of models  Changan
  I can navigate to the details of the model  Changan  CS 85
  I make a test drive using wrong informations  Mohamd Amine  6677  testAuto@test.com
  I go back to menu from test drive request screen

I Succeed to make a Request test drive from Recently Viewed using correct informations
  [Tags]  Android_En_Test_drive_from_Recently_Viewed
  I visit a model and back to menu  Changan  CS 85 
  I select model From Recently Viewed
  I can make a test drive  Mohamd Amine  66771100  testAuto@test.com
  I go back to menu from model details Recently Viewed 

I make a Request test drive from Recently Viewed using wrong informations
  [Tags]  Android_En_Test_drive_from_Recently_Viewed
  I visit a model and back to menu  Changan  CS 85
  I select model From Recently Viewed
  I make a test drive using wrong informations  Mohamd Amine  6677  testAuto@test.com
  I go back to menu from test drive screen -model Recently Viewed 

I Succeed to make a Request test drive with delivery from dashboard using correct informations
  [Tags]  Android_En_Test_drive_With_Delivery
  I can navigate to List Brand
  I can navigate to List of models  BYD
  I can navigate to the details of the model  BYD  Tang
  I can make a test drive with delivery using correct informations  Mohamd Amine  66771100  testAuto@test.com
  I go back to menu from model detail

I Succeed to make a Request test drive with delivery from dashboard using wrong informations
  [Tags]  Android_En_Test_drive_With_Delivery
  I can navigate to List Brand
  I can navigate to List of models  BYD
  I can navigate to the details of the model  BYD  Tang
  I make a test drive with delivery using wrong informations  Mohamd Amine  6677  testAuto@test.com
  I go back to menu from test drive request - add address


*** Keywords ***

I can make a test drive
  [Arguments]  ${nom_user}  ${phone_number}  ${email}
  I can see model Actions buttons
  I click test drive Action button
  # I click my delivery to my location button
  I select timing test drive at showroom
  I enter correct information  ${nom_user}  ${phone_number}  ${email}
  I validate test drive Request
  I should see success pop up

I make a test drive using wrong informations
  [Arguments]  ${nom_user}  ${false_phone_number}  ${email}
  I can see model Actions buttons
  I click test drive Action button
  # I click my delivery to my location button
  I select timing test drive at showroom
  I enter wrong informations  ${nom_user}  ${false_phone_number}  ${email}
  I validate test drive Request
  I cannot proceed Callback Request

I make a test drive with delivery using wrong informations
  [Arguments]  ${nom_user}  ${false_phone_number}  ${email}
  I can see model Actions buttons
  Click Element  xpath=//*[@text='TEST DRIVE']
  I click my delivery to my location button
  I select timing test drive to my location
  I add an address
  I enter wrong informations  ${nom_user}  ${false_phone_number}  ${email}
  I validate test drive Request
  I cannot proceed Callback Request
  Swipe By Percent  50  20  50  80  1000

I can make a test drive with delivery using correct informations
  [Arguments]  ${nom_user}  ${phone_number}  ${email}
  I can see model Actions buttons
  Click Element  xpath=//*[@text='TEST DRIVE']
  I click my delivery to my location button
  I select timing test drive to my location
  I add an address
  I enter correct information  ${nom_user}  ${phone_number}  ${email}
  I validate test drive Request
  I should see success pop up


I click my delivery to my location button
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/confirm_deliver_to_my_location
  Click Element  id=com.kuwait.showroomz.refac:id/confirm_deliver_to_my_location

I validate test drive Request
  Click Element  id=com.kuwait.showroomz.refac:id/ok_btn
  Sleep  6s

I cannot proceed Callback Request
  Wait Until Page Contains  Error
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn

I cannot proceed test drive Request
  Page Should Contain Element  com.kuwait.showroomz.refac:id/ok_btn

I should see failed pop up
  Wait Until Element Is Visible  xpath=//*[@text='Done SuccessFully']
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Sleep  2s

I validate Callback Request
  Click Element  id=com.kuwait.showroomz.refac:id/ok_btn
  Sleep  6s

I should see success pop up
  Wait Until Element Is Visible  xpath=//*[@text='Done SuccessFully']
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Sleep  2s

I click test drive Action button
  Click Element  xpath=//*[@text='TEST DRIVE']
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/title_txt

Select the time
  FOR  ${j}  IN RANGE  1  11
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView[2]/android.view.ViewGroup[${j}]
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/confirm_deliver_to_location
  Exit For Loop If  ${present}
  END

Select the time of delivery to my location
  FOR  ${j}  IN RANGE  1  11
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView[2]/android.view.ViewGroup[${j}]
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/confirm_deliver_to_my_location
  Exit For Loop If  ${present}
  END

I select timing test drive at showroom
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/test_drive_at_showroom
  Click Element  id=com.kuwait.showroomz.refac:id/test_drive_at_showroom
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/checkbox
  Click element  id=com.kuwait.showroomz.refac:id/checkbox
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn

  FOR  ${i}  IN RANGE  1  7
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.LinearLayout[${i}]

  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/time_recycler
  Run Keyword If  ${present}  Select the time
  ${present2}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/confirm_deliver_to_location
  Exit For Loop If  ${present2}
  END

  click Element  id=com.kuwait.showroomz.refac:id/confirm_deliver_to_location
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/full_name_edit
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/phone_edit
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/email_edit

I select timing test drive to my location
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/test_drive_at_showroom
  Click Element  id=com.kuwait.showroomz.refac:id/test_drive_at_showroom
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/checkbox
  Click element  id=com.kuwait.showroomz.refac:id/checkbox
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn

  FOR  ${i}  IN RANGE  1  7
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.LinearLayout[${i}]
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/time_recycler
  Run Keyword If  ${present}  Select the time of delivery to my location
  ${present2}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/confirm_deliver_to_my_location
  Exit For Loop If  ${present2}
  END


  # Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView[2]/android.view.ViewGroup[2]
  Click Element  id=com.kuwait.showroomz.refac:id/confirm_deliver_to_my_location

I add an address
  sleep  2s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/add_new__address_txt
  Run Keyword If  ${present}  click element  id=com.kuwait.showroomz.refac:id/add_new__address_txt
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/areaTextInputEditText
  Input Text  id=com.kuwait.showroomz.refac:id/areaTextInputEditText  Salmiya
  Input Text  id=com.kuwait.showroomz.refac:id/streetTextInputEditText  bahrain street
  Swipe By Percent  50  80  50  20  1000
  Input Text  id=com.kuwait.showroomz.refac:id/blockNumberTextInputEditText  6 
  Input Text  id=com.kuwait.showroomz.refac:id/avenueTextInputEditText  100
  Input Text  id=com.kuwait.showroomz.refac:id/houseNumberTextInputEditText  78
  Input Text  id=com.kuwait.showroomz.refac:id/phoneNumberTextInputEditText  12234456
  Click Element  id=com.kuwait.showroomz.refac:id/submit_btn
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/full_name_edit



