** Settings ***
Documentation  Request test drive from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application and Login
Force Tags  Android  Test_Drive Test_Drive_Ar

*** Variables ***

*** Test Cases ***
I Succeed to make a Request test drive from brand using correct informations
  [Tags]  Android_Ar_Test_drive_from_brand
  As User I login in app
  I can navigate to List Brand
  I can navigate to List of models  شانجان
  I can navigate to the details of the model  Changan  CS 85
  I can make a test drive  Mohamd Amine  66771100  testAuto@test.com
  I go back to menu from model detail

I make a Request test drive from brand using wrong informations
  [Tags]  Android_Ar_Test_drive_from_brand
  I can navigate to List Brand
  I can navigate to List of models  شانجان
  I can navigate to the details of the model  Changan  CS 85
  I make a test drive using wrong informations  Mohamd Amine  6677  testAuto@test.com
  I go back to menu from test drive request screen

I Succeed to make a Request test drive from Recently Viewed using correct informations
  [Tags]  Android_Ar_Test_drive_from_Recently_Viewed
  I visit a model and back to menu  شانجان  CS 85 
  I select model From Recently Viewed
  I can make a test drive  Mohamd Amine  66771100  testAuto@test.com
  I go back to menu from model details Recently Viewed 

I make a Request test drive from Recently Viewed using wrong informations
  [Tags]  Android_Ar_Test_drive_from_Recently_Viewed
  I visit a model and back to menu  شانجان  CS 85
  I select model From Recently Viewed
  I make a test drive using wrong informations  Mohamd Amine  6677  testAuto@test.com
  I go back to menu from test drive screen -model Recently Viewed 

I Succeed to make a Request test drive with delivery from dashboard using correct informations
  [Tags]  Android_Ar_Test_drive_With_Delivery
  I can navigate to List Brand
  I can navigate to List of models  BYD
  I can navigate to the details of the model  BYD  Tang
  I can make a test drive with delivery using correct informations  Mohamd Amine  66771100  testAuto@test.com
  I go back to menu from model detail

I Succeed to make a Request test drive with delivery from dashboard using wrong informations
  [Tags]  Android_Ar_Test_drive_With_Delivery
  I can navigate to List Brand
  I can navigate to List of models  BYD
  I can navigate to the details of the model  BYD  Tang
  I make a test drive with delivery using wrong informations  Mohamd Amine  6677  testAuto@test.com
  I go back to menu from test drive request - add address


*** Keywords ***
I select model From Recently Viewed
  # Wait Until Element Is Visible  xpath=//*[@id='com.kuwait.showroomz.refac:id/recently_recycler']
  Wait Until Element Is Visible  xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id='com.kuwait.showroomz.refac:id/recently_recycler']/android.view.ViewGroup[1]
  Click Element  xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id='com.kuwait.showroomz.refac:id/recently_recycler']/android.view.ViewGroup[1]

I visit a model and back to menu
  [Arguments]  ${brand_name}  ${model_name}
  I can navigate to List Brand
  I can navigate to List of models  ${brand_name}
  I can navigate to the details of the model  ${brand_name}  ${model_name}
  I go back to menu from model detail

I can navigate to List Brand
  I have access to Dashborad Screen 
  I navigate to List Brand 
  I Should be on List Brand 


I can navigate to List of models
  [Arguments]  ${brand_name}
  I have access to List Brand
  I selects a brand with name  ${brand_name}
  I should Sees the List of model  ${brand_name}

I can navigate to the details of the model
  [Arguments]  ${brand_name}  ${model_name}
  I have access to the List of models
  I selects model with name  ${model_name}
  I should Sees the details of the model  ${model_name}

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
  Click Element  xpath=//*[@text='تجربة قيادة']
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
  Click Element  xpath=//*[@text='تجربة قيادة']
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
  Wait Until Page Contains  خطأ
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn

I cannot proceed test drive Request
  Page Should Contain Element  com.kuwait.showroomz.refac:id/ok_btn

I should see failed pop up
  Wait Until Element Is Visible  xpath=//*[@text='تم بنجاح']
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Sleep  2s

I validate Callback Request
  Click Element  id=com.kuwait.showroomz.refac:id/ok_btn
  Sleep  6s

I should see success pop up
  Wait Until Element Is Visible  xpath=//*[@text='تم بنجاح']
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Sleep  2s

I set Full name
  [Arguments]  ${full_name}
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/full_name_edit  ${full_name}

I set Phone Number
  [Arguments]  ${phone_number}
  # AppiumLibrary.Clear Text  id=com.kuwait.showroomz.refac:id/phone_edit
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/phone_edit  ${phone_number}

I set false Phone Number
  [Arguments]  ${false_phone_number}
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/phone_edit  ${false_phone_number}

I set Email
  [Arguments]  ${email}
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/email_edit  ${email}

I have access to callback popup
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/full_name_edit
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/phone_edit

I can see model Actions buttons
  I have access to model details screen  
  sleep  3s
  Click Element  id=com.kuwait.showroomz.refac:id/click_here_up_icon
  I can sees list of actions

I click test drive Action button
  Click Element  xpath=//*[@text='تجربة قيادة']
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/title_txt

Select the time
  FOR  ${i}  IN RANGE  1  11
  click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView[2]/android.view.ViewGroup[${i}]
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/confirm_deliver_to_location
  Exit For Loop If  ${present}
  END

Select the time of delivery to my location
  FOR  ${i}  IN RANGE  1  11
  click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView[2]/android.view.ViewGroup[${i}]
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
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.LinearLayout[${i}]
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
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView[1]/android.widget.LinearLayout[${i}]
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/time_recycler
  Run Keyword If  ${present}  Select the time of delivery to my location
  ${present2}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/confirm_deliver_to_my_location
  Exit For Loop If  ${present2}
  END


  click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView[2]/android.view.ViewGroup[2]
  click Element  id=com.kuwait.showroomz.refac:id/confirm_deliver_to_my_location

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


I enter correct information
  [Arguments]  ${nom_user}  ${phone_number}  ${email}
  I set Full name  ${nom_user}
  I set Phone Number  ${phone_number}
  I set Email  ${email}

I enter wrong informations
  [Arguments]  ${nom_user}  ${false_phone_number}  ${email}
  I set Full name  ${nom_user}
  I set Phone Number  ${false_phone_number}
  I set Email  ${email}

I select the preferred showroom
  Click Element  xpath=//*[@text='تجربة قيادة']
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/title_txt

I have access to model details screen
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/model_name_txtV


I can sees list of actions
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/grid_actions_container

I should Sees the details of the model
  [Arguments]  ${model_name}
  Wait Until Keyword Succeeds  3x  3s  Wait Until Element Is Visible  xpath=//*[@text='${model_name}']  


I selects model with name
  [Arguments]  ${model_name}

  FOR  ${i}  IN RANGE  20
  ${present}=  Run Keyword And Return Status  Page should contain element  xpath=//*[@text='${model_name}']
  Exit For Loop If  ${present}
  Swipe By Percent  50  80  50  20  1000
  END
  Click Element  xpath=//*[@text='${model_name}']

I have access to the List of models
  Wait Until Element Is Visible  xpath=//*[@text="المعرض الرئيسي"]

I should Sees the List of model
  [Arguments]  ${brand_name}
  sleep  3s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/model_recycler
  Wait Until Page Contains  ${brand_name}


I selects a brand with name
  [Arguments]  ${brand_name}
  FOR  ${i}  IN RANGE  20
  ${present}=  Run Keyword And Return Status  Page should contain element  xpath=//*[contains(@text,'${brand_name}')]
  Exit For Loop If  ${present}
  Swipe By Percent  50  80  50  20  1000
  END
  Click Element  xpath=//*[contains(@text,'${brand_name}')]

I have access to List Brand
  I Should Sees List Brands

I have access to Dashborad Screen
  Wait Until Element Is Visible  xpath=(//android.widget.ImageView[@content-desc="cat image"])[1]

I navigate to List Brand
  sleep  3s
  Click Element  xpath=(//android.widget.ImageView[@content-desc="cat image"])[1]
  sleep  3s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  click element  id=com.kuwait.showroomz.refac:id/circle_progress


I Should be on List Brand
  I Should Sees Sub Categories
  I Should Sees List Brands

I Should Sees Sub Categories
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[2]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[3]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[4]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[5]

I Should Sees List Brands
  ${elements}=  Get WebElements  id=com.kuwait.showroomz.refac:id/brands_recycler
  Should Not Be Empty  ${elements}

Close pub
  sleep  7s
  click Element  id=com.kuwait.showroomz.refac:id/circle_progress