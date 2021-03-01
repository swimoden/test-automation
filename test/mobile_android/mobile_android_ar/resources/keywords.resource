*** Settings ***
Documentation  Mobile Test
Library  AppiumLibrary  
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  customlib.py
Library  OperatingSystem
Library  String
Library  JSONLibrary
Library  json


*** Variables ***
${BASE_URL}  https://vps-08303c09.vps.ovh.ca/api/v2
${id_auth}  880e3d89-07f9-4f09-a1da-bc131dea55a5
*** Keywords ***

I send my civil id picture to the phone
  send_image_to_device
I should sees profile screen
  [Arguments]  ${name}  ${email}  
  Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/profile_txt
  Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/edit_profile_btn
  Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/changePassword_btn
  Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/favorite_txt
  # Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/callbacks_txt
  # Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/finance_txt
  # Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/finance_request_txt
  # Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/test_drives_txt
  # Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/payments_txt
  # Wait Until Page Contains Element  id=com.kuwait.showroomz.refac:id/logout_txt

I back to menu
  Click Element  id=com.kuwait.showroomz.refac:id/back
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Wait Until Page Contains Element  xpath=//*[contains(@text,'سيارات')]
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button


I go back to menu
  Click Element  id=com.kuwait.showroomz.refac:id/back_bnt
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button

I can Open Menu
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button
  Click Element  id=com.kuwait.showroomz.refac:id/menu_button

I select Profile Item
  Wait Until Element Is Visible  xpath=//*[contains(@text,'حسابي')]
  Click Element  xpath=//*[contains(@text, 'حسابي')]]
@text=
  Wait Until Page Contains  تسجيل الدخول إلى حسابك 

As User I login in app
  I can Open Menu
  I select Profile Item
  I set user Information  testAuto@test.com  testtest
  Click Element  id=com.kuwait.showroomz.refac:id/login_btn
  I should sees profile screen  automated test1  testAuto@test.com
  [Teardown]  I go back to menu


I set user Information
  [Arguments]  ${user_email}  ${user_password}
  Input Text  id=com.kuwait.showroomz.refac:id/emailTextInputEditText  ${user_email}
  Input Text  id=com.kuwait.showroomz.refac:id/passwordTextInputEditText  ${user_password}




I go back to menu from model details Recently Viewed
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_button
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button 

I go back to menu from test drive screen -model Recently Viewed
  Click Element  id=com.kuwait.showroomz.refac:id/back_bnt
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_button
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button 


I go back to menu from model details favorites
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_btn
  Click Element  id=com.kuwait.showroomz.refac:id/back_btn
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button

 I go back to menu from model finance callback details 
  Click Element  id=com.kuwait.showroomz.refac:id/back_bnt
  sleep  3s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub

  Click Element  id=com.kuwait.showroomz.refac:id/back
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub

  Click Element  id=com.kuwait.showroomz.refac:id/back



I succeed to search vehicle using filter
  [Arguments]  ${budget}  ${vehicle_type}  ${brand_name} 
  Click Element  id=com.kuwait.showroomz.refac:id/filter_btn
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/filter_by_budget_edit_text
  AppiumLibrary.Clear Text  id=com.kuwait.showroomz.refac:id/filter_by_budget_edit_text
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/filter_by_budget_edit_text  ${budget}
  Click Element  xpath=//*[contains(@text,'${vehicle_type}')]
  Click Element  xpath=//*[contains(@text,'${brand_name}')]
  Click Element  id=com.kuwait.showroomz.refac:id/fab

I succeed to find brand
  [Arguments]  ${brand_name} 
  Wait Until Element Is Visible  xpath=//*[contains(@text,'${brand_name}')]

I can navigate to leasing category
  Click Element  xpath=//*[@text='Leasing']
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/filter_btn

I can navigate to rent category
  Click Element  xpath=//*[@text='Rent']
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/filter_btn


I can navigate to List Brand of Marine
  I have access to Dashborad Screen 
  I navigate to List Brand of Marine
  I Should be on List Brand of Marine

I have access to Dashborad Screen
  Wait Until Element Is Visible  xpath=(//android.widget.ImageView[@content-desc="cat image"])[1]
  Wait Until Element Is Visible  xpath=(//android.widget.ImageView[@content-desc="cat image"])[2]
  Wait Until Element Is Visible  xpath=(//android.widget.ImageView[@content-desc="cat image"])[3]


I succeed to search car using filter from maintenance subcategory
  [Arguments]  ${brand_name1}  ${brand_name2}
  Wait Until Element Is Visible  xpath=//*[@text='Maintenance']
  Click Element  xpath=//*[@text='Maintenance']
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/filter_btn
  Click Element  id=com.kuwait.showroomz.refac:id/filter_btn
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/fab
  Click Element  xpath=//*[@text='${brand_name1}']
  Click Element  xpath=//*[@text='${brand_name2}']
  Click Element  id=com.kuwait.showroomz.refac:id/fab
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/map

I navigate to List Brand of Marine
  sleep  3s
  Click Element  xpath=(//android.widget.ImageView[@content-desc="cat image"])[2]
  sleep  3s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  click element  id=com.kuwait.showroomz.refac:id/circle_progress

I Should be on List Brand of Marine
  I Should Sees Sub Categories of Marine
  I Should Sees List Brands

I Should Sees Sub Categories of Marine
  Page Should Contain Element  id=com.kuwait.showroomz.refac:id/serch_txt
  Wait Until Page Contains  Marine

I selects model with name
  [Arguments]  ${model_name}
  # Sleep  8s
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/model_recycler
  Sleep  2s  
  FOR  ${i}  IN RANGE  30
  ${present}=  Run Keyword And Return Status  Page should contain element  xpath=//*[@text='${model_name}']
  Exit For Loop If  ${present}
  Sleep  2s
  Run Keyword If  ${present} == False  Swipe By Percent  50  80  50  40  1000
  END
  Click Element  xpath=//*[@text='${model_name}']

I can navigate to List Brand of Bike
  I have access to Dashboard Screen 
  I navigate to List Brand of Bike
  I Should be on List Brand of Bike

I navigate to List Brand of Bike
  sleep  3s
  Click Element  xpath=(//android.widget.ImageView[@content-desc="cat image"])[3]
  sleep  3s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  click element  id=com.kuwait.showroomz.refac:id/circle_progress

I Should be on List Brand of Bike
  I Should Sees Sub Categories of Bike
  I Should Sees List Brands

I Should Sees Sub Categories of Bike
  Page Should Contain Element  id=com.kuwait.showroomz.refac:id/serch_txt
  Wait Until Page Contains  Bike

I can see locations
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/show_locations
  Click Element  id=com.kuwait.showroomz.refac:id/show_locations
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/loc_recycler
  Click Element  id=com.kuwait.showroomz.refac:id/navigate
  wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.LinearLayout

I navigate to booking screen
  I can see model Actions buttons
  I click Book Now Action button

I navigate to buy now screen
  I can see model Actions buttons
  I click Buy Now Action button

I can book using correct information
  I send my civil id picture to the phone
  Sleep  2s
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/user_information
  Click Element  id=com.kuwait.showroomz.refac:id/uploadImage
  # Press Keycode  120  #take screen shot to upload it to device
  Wait Until Element Is Visible  xpath=//android.widget.Button[contains(@text,'Autoriser') or contains(@text,'Allow') or contains(@text,'ALLOW')]
  Click Element  xpath=//android.widget.Button[contains(@text,'Autoriser') or contains(@text,'Allow') or contains(@text,'ALLOW')]
  I send my civil id picture to the phone
  Sleep  2s
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/uploadImage
  Click Element  id=com.kuwait.showroomz.refac:id/uploadImage
  ${yes}=  Run Keyword And Return Status  page Should Contain Element  xpath=//*[contains(@text,'file')]
  Run Keyword If  ${yes}  Upload picture to phone
  ...  ELSE IF  ${yes} == False  Upload civil picture to phone

  Swipe By Percent  50  80  50  20  1000
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/pay_btn
  Click Element  id=com.kuwait.showroomz.refac:id/pay_btn
  wait Until Element Is Visible  xpath=//android.view.View[@content-desc=" KNET"]
  Click Element  xpath=//android.view.View[@content-desc=" KNET"]
  Wait Until Element Is Visible  xpath=//*[@text='Select Your Bank']
  Click Element  xpath=//*[@text='Select Your Bank']
  Sleep  1s
  Swipe By Percent  50  80  50  20  1000
  # Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[11]
  # Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.CheckedTextView[11]

  Swipe By Percent  50  80  50  20  1000
  Wait Until Element Is Visible  xpath=//*[@text='Knet Test Card [KNET1]']
  Click Element  xpath=//*[@text='Knet Test Card [KNET1]']
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[3]/android.view.View[3]/android.widget.EditText
  AppiumLibrary.Clear Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[3]/android.view.View[3]/android.widget.EditText
  AppiumLibrary.Input Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[3]/android.view.View[3]/android.widget.EditText  0000000001
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[4]/android.widget.Spinner[1]
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[4]/android.widget.Spinner[1]
  Wait Until Element Is Visible  xpath=//*[@text='09']
  Click Element  xpath=//*[@text='09']
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[4]/android.widget.Spinner[2]
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[4]/android.widget.Spinner[2]
  Wait Until Element Is Visible  xpath=//*[@text='2021']
  Click Element  xpath=//*[@text='2021']
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[5]/android.view.View[2]/android.widget.EditText
  AppiumLibrary.Clear Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[5]/android.view.View[2]/android.widget.EditText
  AppiumLibrary.Input Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[5]/android.view.View[2]/android.widget.EditText  1234
  Click Element  xpath=//*[@text='Submit']
  Wait Until Element Is Visible  xpath=//*[@text='Confirm']
  Click Element  xpath=//*[@text='Confirm']
  Wait Until Element Is Visible  xpath=//*[@text='Form Submitted Successfully']


I can book using correct informations
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.Spinner[1]/android.widget.TextView
  # Click Element  id=com.kuwait.showroomz.refac:id/start_day_date_container
  # Click Element  id=com.kuwait.showroomz.refac:id/end_day_date_container
  click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.Spinner[1]/android.widget.TextView
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.TextView[4]
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.TextView[4]
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.Spinner[2]/android.widget.TextView
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ScrollView/android.view.ViewGroup/android.view.ViewGroup[2]/android.widget.Spinner[2]/android.widget.TextView
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.TextView[5]
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.TextView[5]
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/uploadImage

  Sleep  2s
  Click Element  id=com.kuwait.showroomz.refac:id/uploadImage
  # Press Keycode  120  #take screen shot to upload it to device


  Wait Until Element Is Visible  xpath=//android.widget.Button[contains(@text,'Autoriser') or contains(@text,'Allow') or contains(@text,'ALLOW')]
  Click Element  xpath=//android.widget.Button[contains(@text,'Autoriser') or contains(@text,'Allow') or contains(@text,'ALLOW')]

  I send my civil id picture to the phone
  Sleep  2s
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/uploadImage
  Click Element  id=com.kuwait.showroomz.refac:id/uploadImage

  ${yes}=  Run Keyword And Return Status  page Should Contain Element  xpath=//*[contains(@text,'file')]
  Run Keyword If  ${yes}  Upload picture to phone
  ...  ELSE IF  ${yes} == False  Upload civil picture to phone


  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/uploadLicenseImage
  Click Element  id=com.kuwait.showroomz.refac:id/uploadLicenseImage
  ${yes}=  Run Keyword And Return Status  page Should Contain Element  xpath=//*[contains(@text,'file')]
  Run Keyword If  ${yes}  Upload license file to phone
  ...  ELSE IF  ${yes} == False  Upload license picture to phone


  Swipe By Percent  50  80  50  20  1000
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/pay_btn
  Click Element  id=com.kuwait.showroomz.refac:id/pay_btn
  wait Until Element Is Visible  xpath=//android.view.View[@content-desc=" KNET"]
  Click Element  xpath=//android.view.View[@content-desc=" KNET"]
  Wait Until Element Is Visible  xpath=//*[@text='Select Your Bank']
  Click Element  xpath=//*[@text='Select Your Bank']
  Sleep  1s
  Swipe By Percent  50  80  50  20  1000
  Wait Until Element Is Visible  xpath=//*[@text='Knet Test Card [KNET1]']
  Click Element  xpath=//*[@text='Knet Test Card [KNET1]']
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[3]/android.view.View[3]/android.widget.EditText
  AppiumLibrary.Clear Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[3]/android.view.View[3]/android.widget.EditText
  AppiumLibrary.Input Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[3]/android.view.View[3]/android.widget.EditText  0000000001
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[4]/android.widget.Spinner[1]
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[4]/android.widget.Spinner[1]
  Wait Until Element Is Visible  xpath=//*[@text='09']
  Click Element  xpath=//*[@text='09']
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[4]/android.widget.Spinner[2]
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[4]/android.widget.Spinner[2]
  Wait Until Element Is Visible  xpath=//*[@text='2021']
  Click Element  xpath=//*[@text='2021']
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[5]/android.view.View[2]/android.widget.EditText
  AppiumLibrary.Clear Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[5]/android.view.View[2]/android.widget.EditText
  AppiumLibrary.Input Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[5]/android.view.View[2]/android.widget.EditText  1234
  Click Element  xpath=//*[@text='Submit']
  Wait Until Element Is Visible  xpath=//*[@text='Confirm']
  Click Element  xpath=//*[@text='Confirm']
  Wait Until Element Is Visible  xpath=//*[@text='Form Submitted Successfully']
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  # xpath updated

I can buy model using correct information
  I send my civil id picture to the phone
  Sleep  2s
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/user_information
  Click Element  id=com.kuwait.showroomz.refac:id/uploadImage
  # Press Keycode  120  #take screen shot to upload it to device
  Wait Until Element Is Visible  xpath=//android.widget.Button[contains(@text,'Autoriser') or contains(@text,'Allow') or contains(@text,'ALLOW')]
  Click Element  xpath=//android.widget.Button[contains(@text,'Autoriser') or contains(@text,'Allow') or contains(@text,'ALLOW')]
  I send my civil id picture to the phone
  Sleep  2s
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/uploadImage
  Click Element  id=com.kuwait.showroomz.refac:id/uploadImage
  ${yes}=  Run Keyword And Return Status  page Should Contain Element  xpath=//*[contains(@text,'file')]
  Run Keyword If  ${yes}  Upload picture to phone
  ...  ELSE IF  ${yes} == False  Upload civil picture to phone

  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/uploadLicenseImage
  Click Element  id=com.kuwait.showroomz.refac:id/uploadLicenseImage
  ${yes}=  Run Keyword And Return Status  page Should Contain Element  xpath=//*[contains(@text,'file')]
  Run Keyword If  ${yes}  Upload license file to phone
  ...  ELSE IF  ${yes} == False  Upload license picture to phone

  Swipe By Percent  50  80  50  20  1000
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/pay_btn
  Click Element  id=com.kuwait.showroomz.refac:id/pay_btn
  wait Until Element Is Visible  xpath=//android.view.View[@content-desc=" KNET"]
  Click Element  xpath=//android.view.View[@content-desc=" KNET"]
  Wait Until Element Is Visible  xpath=//*[@text='Select Your Bank']
  Click Element  xpath=//*[@text='Select Your Bank']
  Sleep  1s
  Swipe By Percent  50  80  50  20  1000

  Swipe By Percent  50  80  50  20  1000
  Wait Until Element Is Visible  xpath=//*[@text='Knet Test Card [KNET1]']
  Click Element  xpath=//*[@text='Knet Test Card [KNET1]']
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[3]/android.view.View[3]/android.widget.EditText
  AppiumLibrary.Clear Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[3]/android.view.View[3]/android.widget.EditText
  AppiumLibrary.Input Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[3]/android.view.View[3]/android.widget.EditText  0000000001
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[4]/android.widget.Spinner[1]
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[4]/android.widget.Spinner[1]
  Wait Until Element Is Visible  xpath=//*[@text='09']
  Click Element  xpath=//*[@text='09']
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[4]/android.widget.Spinner[2]
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[4]/android.widget.Spinner[2]
  Wait Until Element Is Visible  xpath=//*[@text='2021']
  Click Element  xpath=//*[@text='2021']
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[5]/android.view.View[2]/android.widget.EditText
  AppiumLibrary.Clear Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[5]/android.view.View[2]/android.widget.EditText
  AppiumLibrary.Input Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.webkit.WebView/android.webkit.WebView/android.view.View/android.view.View/android.view.View[7]/android.view.View[5]/android.view.View[2]/android.widget.EditText  1234
  Click Element  xpath=//*[@text='Submit']
  Wait Until Element Is Visible  xpath=//*[@text='Confirm']
  Click Element  xpath=//*[@text='Confirm']
  Wait Until Element Is Visible  xpath=//*[@text='Form Submitted Successfully']


Upload civil picture to phone

  Wait Until Element Is Visible  xpath=//android.widget.ImageButton[@content-desc="Show roots"]
  Click Element  xpath=//android.widget.ImageButton[@content-desc="Show roots"]
  Wait Until Element Is Visible  xpath=//android.widget.TextView[@text="Downloads"]
  #  or @text="Gallery"]
  Click Element  xpath=//android.widget.TextView[@text="Downloads"]
  #  or @text="Gallery"]
  # Wait Until Element Is Visible  xpath=//*[contains(@text,'Pictures')]
  # Click Element  xpath=//*[@text="Pictures"]
  Wait Until Element Is Visible  xpath=//*[contains(@text,'file')]
  Sleep  2s
  Click Element  xpath=//*[contains(@text,'file')]
  Sleep  20s

Upload license picture to phone

  Wait Until Element Is Visible  xpath=//android.widget.ImageButton[@content-desc="Show roots"]
  Click Element  xpath=//android.widget.ImageButton[@content-desc="Show roots"]
  Wait Until Element Is Visible  xpath=//*[@text="Downloads"]
  Click Element  xpath=//*[@text="Downloads"]
  # Wait Until Element Is Visible  xpath=//*[contains(@text,'Pictures')]
  # Click Element  xpath=//*[@text="Pictures"]
  Wait Until Element Is Visible  xpath=//*[contains(@text,'file')]
  Sleep  2s
  Click Element  xpath=//*[contains(@text,'file')]
  Sleep  20s

Upload picture to phone

  Wait Until Element Is Visible  xpath=//*[contains(@text,'file')]
  Sleep  2s
  Click Element  xpath=//*[contains(@text,'file')]
  Sleep  20s

Upload license file to phone

  Wait Until Element Is Visible  xpath=//*[contains(@text,'file')]
  Sleep  2s
  Click Element  xpath=//*[contains(@text,'file')]
  Sleep  20s

take a screen shot
  Press Keycode  120
  Sleep  30s
  Swipe By Percent  50  80  50  20  1000
  Wait Until Element Is Visible  xpath=//*[@text='Allow' or @text='ALLOW']
  Click Element  xpath=//*[@text='Allow' or @text='ALLOW']
  Wait Until Element Is Visible  xpath=//*[contains(@text,'Screen')]
  Wait Until Element Is Visible  xpath=Click Element  xpath=//*[contains(@text,'Screen')]
  Wait Until Element Is Visible  xpath=//android.widget.ImageButton[@content-desc="Show roots"]
  Click Element  xpath=//android.widget.ImageButton[@content-desc="Show roots"]
  Images


I select book now from best dealing
  sleep  3s
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/programs_click_here_up_icon
  Click Element  id=com.kuwait.showroomz.refac:id/programs_click_here_up_icon
  wait Until Element Is Visible  xpath=//*[contains(@text,'احجز الان')]
  Click Element  id=com.kuwait.showroomz.refac:id/checkbox
  Click Element  xpath=//*[contains((@text,'احجز الان'))]

I select book now with daily contract
  Wait Until Page Contains  DRIVETRAIN  timeout=40  error=None
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/programs_click_here_up_icon
  Click Element  id=com.kuwait.showroomz.refac:id/programs_click_here_up_icon
  wait Until Element Is Visible  xpath=//*[contains(@text,'احجز الان')]
  Click Element  xpath=//*[contains(@text,'يومي')]
  Click Element  xpath=//*[contains(@text,'احجز الان')]

I select book now with weekly contract
  Wait Until Page Contains  DRIVETRAIN  timeout=40  error=None
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/programs_click_here_up_icon
  Click Element  id=com.kuwait.showroomz.refac:id/programs_click_here_up_icon
  wait Until Element Is Visible  xpath=//*[contains(@text,'احجز الان')]
  Click Element  xpath=//*[contains(@text,'أسبوعي')]
  Click Element  xpath=//*[contains(@text,'احجز الان')]








I can make a Request finance Callback
  [Arguments]  ${down_payment}  ${instalement_period}  ${nom_user}  ${phone_number}  ${civil_id}
  I can see model Actions buttons
  I click Finance Action button
  I passed a Finance callback Request  ${down_payment}  ${instalement_period}  ${nom_user}  ${phone_number}  ${civil_id}

I can make a Request finance Callback using wrong informations
  [Arguments]  ${down_payment}  ${instalement_period}  ${nom_user}  ${false_phone_number}  ${civil_id}
  I can see model Actions buttons
  I click Finance Action button
  I passed a Finance callback Request using wrong informations  ${down_payment}  ${instalement_period}  ${nom_user}  ${false_phone_number}  ${civil_id}


I click Finance Action button
  Click Element  xpath=//*[@text='FINANCE']
  # Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/no_TV
  # Click Element  id=com.kuwait.showroomz.refac:id/no_TV
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/calculate_btn


I passed a Finance callback Request
  [Arguments]  ${down_payment}  ${instalement_period}  ${nom_user}  ${phone_number}  ${civil_id}
  Input Text  id=com.kuwait.showroomz.refac:id/down_payment_txt  ${down_payment}
  Click Element  id=com.kuwait.showroomz.refac:id/two_year_text
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[2]/android.widget.ImageView
  I should sees the calculation result
  I achieved a finance call back request  ${nom_user}  ${phone_number}  ${civil_id}

I passed a Finance callback Request using wrong informations
  [Arguments]  ${down_payment}  ${instalement_period}  ${nom_user}  ${false_phone_number}  ${civil_id}
  Input Text  id=com.kuwait.showroomz.refac:id/down_payment_txt  ${down_payment}
  Click Element  id=com.kuwait.showroomz.refac:id/two_year_text
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[2]/android.widget.ImageView
  I should sees the calculation result
  I achieved a finance call back request using wrong informations  ${nom_user}  ${false_phone_number}  ${civil_id}

I achieved a finance call back request
  [Arguments]  ${nom_user}  ${phone_number}  ${civil_id}
  Click Element  id=com.kuwait.showroomz.refac:id/callback_btn
  I have access to callback popup
  I set Full name  ${nom_user}
  I set Phone Number  ${phone_number}
  I set civilId  ${civil_id}
  I validate Callback Request
  I should see success pop up

I achieved a finance call back request using wrong informations
  [Arguments]  ${nom_user}  ${false_phone_number}  ${civil_id}
  Click Element  id=com.kuwait.showroomz.refac:id/callback_btn
  I have access to callback popup
  I set Full name  ${nom_user}
  I set false Phone Number  ${false_phone_number}
  I set civilId  ${civil_id}
  I validate Callback Request
  I cannot proceed Callback Request

I should sees the calculation result
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/calculator_container

I select mode From favorites List
  [Arguments]  ${model_name}
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/model_name
  Click Element  id=com.kuwait.showroomz.refac:id/model_name

I select favorites Item
  Wait Until Element Is Visible  xpath=//*[@text='FAVORITES']
  Click Element  xpath=//*[@text='FAVORITES']
  Wait Until Page Contains  CAR
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_btn


I visit a model add it to favorites and back to menu
  [Arguments]  ${brand_name}  ${model_name}
  I can navigate to List Brand
  I can navigate to List of models  ${brand_name}
  I can navigate to the details of the model  ${brand_name}  ${model_name}
  I add model to favorites List
  I go back to menu from model detail

I visit a model from rent category and add it to favorites and back to menu
  [Arguments]  ${brand_name}  ${model_name}
  I can navigate to List Brand
  I can navigate to rent category
  I can navigate to List of models  ${brand_name}
  I can navigate to the details of the model  ${brand_name}  ${model_name}
  I add model to favorites List
  I go back to menu from model detail

I select mode From Recently Viewed
  Swipe By Percent  50  80  50  20  1000
  # Wait Until Element Is Visible  xpath=//*[@id='com.kuwait.showroomz.refac:id/recently_recycler']
  Wait Until Element Is Visible  xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id='com.kuwait.showroomz.refac:id/recently_recycler']/android.view.ViewGroup[1]
  Click Element  xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id='com.kuwait.showroomz.refac:id/recently_recycler']/android.view.ViewGroup[1]

I add model to favorites List
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/favorite_img
  Click Element  id=com.kuwait.showroomz.refac:id/favorite_img

I select model From Recently Viewed
  Swipe By Percent  50  80  50  20  1000
  Wait Until Element Is Visible  xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id='com.kuwait.showroomz.refac:id/recently_recycler']/android.view.ViewGroup[1]
  Click Element  xpath=//androidx.recyclerview.widget.RecyclerView[@resource-id='com.kuwait.showroomz.refac:id/recently_recycler']/android.view.ViewGroup[1]


I visit a model and back to menu
  [Arguments]  ${brand_name}  ${model_name}
  I can navigate to List Brand
  I can navigate to List of models  ${brand_name}
  I can navigate to the details of the model  ${brand_name}  ${model_name}
  I go back to menu from model detail

I visit a model and GO back to menu
  [Arguments]  ${brand_name}  ${model_name}
  I can navigate to List of models  ${brand_name}
  I can navigate to the details of the model  ${brand_name}  ${model_name}
  I go back to menu from model detail

I can navigate to List Brand
  I have access to Dashboard Screen 
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

I can make a Request Callback
  [Arguments]  ${nom_user}  ${phone_number}  
  I can see model Actions buttons
  I click Callback Action button
  I passed a callback Request  ${nom_user}  ${phone_number}

I click Callback Action button
  Wait Until Element Is Visible  xpath=//*[@text='CALLBACK']
  Click Element  xpath=//*[@text='CALLBACK']

I click compare Action button
  Wait Until Element Is Visible  xpath=//*[@text='COMPARE']
  Click Element  xpath=//*[@text='COMPARE']

I can make a Request Callback from rent category using correct informations
  [Arguments]  ${nom_user}  ${phone_number}  
  # I can see model Actions buttons
  sleep  7s
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/programs_click_here_up_icon
  Click Element  id=com.kuwait.showroomz.refac:id/programs_click_here_up_icon
  wait Until Element Is Visible  xpath=//*[@text='CallBack' or @text='CALLBACK']
  Click Element  xpath=//*[@text='CallBack' or @text='CALLBACK']
  I passed a callback Request  ${nom_user}  ${phone_number}

I make a Request Callback from rent category using wrong informations
  [Arguments]  ${nom_user}  ${false_phone_number}  
  sleep  7s
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/programs_click_here_up_icon
  Click Element  id=com.kuwait.showroomz.refac:id/programs_click_here_up_icon
  wait Until Element Is Visible  xpath=//*[@text='CallBack' or @text='CALLBACK']
  Click Element  xpath=//*[@text='CallBack' or @text='CALLBACK']
  I passed a callback Request using wrong information  ${nom_user}  ${false_phone_number} 


I make a Request Callback using wrong informations
  [Arguments]  ${nom_user}  ${false_phone_number}  
  I passed a callback Request using wrong information  ${nom_user}  ${false_phone_number}


I make a Request Callback using wrong information
  [Arguments]  ${nom_user}  ${false_phone_number}  
  I can see model Actions buttons
  I click Callback Action button
  I passed a callback Request using wrong information  ${nom_user}  ${false_phone_number} 

I passed a callback Request
  [Arguments]  ${nom_user}  ${phone_number}  
  I have access to callback popup
  I set Full name  ${nom_user}
  I set Phone Number  ${phone_number}
  I validate Callback Request
  I should see success pop up

I passed a callback Request using wrong information
  [Arguments]  ${nom_user}  ${false_phone_number} 
  I have access to callback popup
  I set Full name  ${nom_user}
  I set false Phone Number  ${false_phone_number}
  I validate Callback Request
  I cannot proceed Callback Request


I set civilId
  [Arguments]  ${civil_id}
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/civil_id  ${civil_id}

I cannot proceed Callback Request
  Wait Until Page Contains  Error
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Sleep  1s  
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Sleep  1s  
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn

I validate Callback Request
  Click Element  id=com.kuwait.showroomz.refac:id/ok_btn
  Sleep  6s

I should see success pop up
  Wait Until Element Is Visible  xpath=//*[@text='Done SuccessFully']
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn
  Sleep  1s
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn


I set Full name
  [Arguments]  ${full_name}
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/full_name_edit  ${full_name}

I set Phone Number
  [Arguments]  ${phone_number}
  AppiumLibrary.Clear Text  id=com.kuwait.showroomz.refac:id/phone_edit
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/phone_edit  ${phone_number}

I set false Phone Number
  [Arguments]  ${false_phone_number}
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/phone_edit  ${false_phone_number}


I have access to callback popup
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/full_name_edit
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/phone_edit

I can see model Actions buttons
  I have access to model details screen  
  sleep  3s
  Click Element  id=com.kuwait.showroomz.refac:id/click_here_up_icon
  I can sees list of actions


I click Book Now Action button
  Click Element  xpath=//*[@text='BOOK NOW']

I click Buy Now Action button
  Click Element  xpath=//*[@text='BUY NOW']

I have access to model details screen
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/model_name_txtV


I can sees list of actions
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/grid_actions_container

I should Sees the details of the model
  [Arguments]  ${model_name}
  Wait Until Keyword Succeeds  3x  3s  Wait Until Element Is Visible  xpath=//*[@text='${model_name}']  


I have access to the List of models
  Wait Until Element Is Visible  xpath=//*[@text="Main Showroom"]

I should Sees the List of model
  [Arguments]  ${brand_name}
  sleep  3s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/model_recycler
  Wait Until Page Contains  ${brand_name}

Close pub
  sleep  7s
  click Element  id=com.kuwait.showroomz.refac:id/circle_progress

I selects a brand with name
  [Arguments]  ${brand_name}
  Sleep  2s
  FOR  ${i}  IN RANGE  40
  ${present}=  Run Keyword And Return Status  Page should contain element  xpath=//*[contains(@text,'${brand_name}')]
  Exit For Loop If  ${present}
  Sleep  2s
  Run Keyword If  ${present} == False  Swipe By Percent  50  80  50  40  1000
  END
  Click Element  xpath=//*[contains(@text,'${brand_name}')]

I have access to List Brand
  I Should Sees List Brands

I have access to Dashboard Screen
  Wait Until Element Is Visible  xpath=(//android.widget.ImageView[@content-desc="cat image"])[1]

I navigate to List Brand
  sleep  3s
  wait Until Element Is Visible  xpath=(//android.widget.ImageView[@content-desc="cat image"])[1]
  Click Element  xpath=(//android.widget.ImageView[@content-desc="cat image"])[1]
  sleep  3s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  click element  id=com.kuwait.showroomz.refac:id/circle_progress



I Should be on List Brand
  I Should Sees Sub Categories
  I Should Sees List Brands

I Should Sees Sub Categories
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[3]/android.widget.TextView
  # Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]
  # Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[2]
  # Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[3]
  # Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[4]
  # Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[5]

I Should Sees List Brands
  ${elements}=  Get WebElements  id=com.kuwait.showroomz.refac:id/brands_recycler
  Should Not Be Empty  ${elements}


I back to menu from search brand screen
  Click Element  id=com.kuwait.showroomz.refac:id/close_button
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button

I back to menu from search model screen
  Click Element  id=com.kuwait.showroomz.refac:id/close_button
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Click Element  id=com.kuwait.showroomz.refac:id/back
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button

I back to menu from filter model screen
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/close_button
  Click Element  id=com.kuwait.showroomz.refac:id/close_button
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button


I back to menu from filter brand screen
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/close_button
  Click Element  id=com.kuwait.showroomz.refac:id/close_button
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button


I go back to menu from model detail
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_button
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Click Element  id=com.kuwait.showroomz.refac:id/back
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Wait Until Page Contains Element  xpath=//*[contains(@text,'سيارات')]
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button

I go back to menu from marine model detail
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_button
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Click Element  id=com.kuwait.showroomz.refac:id/back
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Wait Until Page Contains Element  xpath=//*[contains(@text,'معدات بحرية')]
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button

I go back to menu from bike model detail
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_button
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Click Element  id=com.kuwait.showroomz.refac:id/back
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Wait Until Page Contains Element  xpath=//*[contains(@text,'دراجات')]
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button

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

I set Email
  [Arguments]  ${email}
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/email_edit  ${email}

###############  Gallery  #############

#############  share
I share model
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/share_button
  Click Element  id=com.kuwait.showroomz.refac:id/share_button
  # Wait Until Element Is Visible  xpath=//*[contains(@text,'showroomz.com')]
  Sleep  4s
  Press Keycode  4
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_button
#############

I show the interior
  wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/interior_button
  Click Element  id=com.kuwait.showroomz.refac:id/interior_button
  wait Until Element Is Visible  xpath=//*[@text='رجوع']
  Click Element  xpath=//*[@text='رجوع']
  I go back to menu from model details Recently Viewed

I show the exterior
  wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/exterior_button
  Click Element  id=com.kuwait.showroomz.refac:id/exterior_button
  wait Until Element Is Visible  xpath=//*[@text='رجوع']
  Click Element  xpath=//*[@text='رجوع']
  I go back to menu from model details Recently Viewed  

I show the exterior from interior
  wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/exterior_button
  Click Element  id=com.kuwait.showroomz.refac:id/interior_button
  wait Until Element Is Visible  xpath=//*[@text='Back']
  wait Until Element Is Visible  xpath=//*[@text='خارجى']
  Click Element  xpath=//*[@text='خارجى']
  Wait Until Element Is Visible  xpath=//*[@text='داخلي']
  Click Element  xpath=//*[@text='رجوع']
  I go back to menu from model details Recently Viewed

I show the interior from Exterior
  wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/exterior_button
  Click Element  id=com.kuwait.showroomz.refac:id/exterior_button
  wait Until Element Is Visible  xpath=//*[@text='رجوع']
  wait Until Element Is Visible  xpath=//*[@text='داخلي']
  Click Element  xpath=//*[@text='داخلي']
  Wait Until Element Is Visible  xpath=//*[@text='خارجى']
  Click Element  xpath=//*[@text='رجوع']
  I go back to menu from model details Recently Viewed  

I show gallery
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/gallery
  Click Element  id=com.kuwait.showroomz.refac:id/gallery
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/gallery_container
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/exit_icon
  Click Element  id=com.kuwait.showroomz.refac:id/exit_icon

##################  end galler  ####################
####################  Comapre ######################

I open compare model screen
  I can see model Actions buttons
  I click compare Action button
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/model_one_img

I add another model to second trim
  [Arguments]  ${text}  ${model_name}  ${select}
  Click Element  id=com.kuwait.showroomz.refac:id/add_model_btn 

  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/filter_edit_text
  AppiumLibrary.Clear Text  id=com.kuwait.showroomz.refac:id/filter_edit_text
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/filter_edit_text  ${text}
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.FrameLayout/android.widget.LinearLayout
  #/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.FrameLayout/android.widget.LinearLayout

  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.FrameLayout/android.widget.LinearLayout
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/trim_two

  # Click Element  id=com.kuwait.showroomz.refac:id/trim_two
  # Wait Until Element Is Visible  xpath=//*[@text='${select}']
  # Click Element  xpath=//*[@text='SV']
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/detailsTwo

I refresh compare screen
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/reload_img
  Click Element  id=com.kuwait.showroomz.refac:id/reload_img
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/close_button
  Click Element  id=com.kuwait.showroomz.refac:id/close_button

I back to menu from compare model screen
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_btn
  Click Element  id=com.kuwait.showroomz.refac:id/back_btn
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/back_button
  Click Element  id=com.kuwait.showroomz.refac:id/back_button
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Click Element  id=com.kuwait.showroomz.refac:id/back
  sleep  1s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  Close pub
  Click Element  id=com.kuwait.showroomz.refac:id/back
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/menu_button


I can navigate to certified category
  Click Element  xpath=//*[@text='المعتمدة']
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/filter_btn


####################  end compare  #################
I get the client id
  [Arguments]  ${email}  ${password}
  Create Session  mySession  ${BASE_URL}  verify=true
  ${id} =  Set Variable  ${id_auth}
  ${body} =  Create Dictionary  email=testAuto@test.com  password=testtest
  ${header} =  Create Dictionary  accept=application/json  Authorization=${id_auth}  Content-Type=application/json
  ${response} =  Post Request  mySession  /authentication_token  headers=${header}  json=${body}
  ${json}=  Evaluate  json.loads('''${response.content}''')  json
  [return]  ${json}[user][id]

Delete all client favorites
  [Arguments]  ${email}  ${password}
  ${client_id} =  I get the client id  ${email}  ${password}
  Create Session  mySession  ${BASE_URL}
  ${id} =  Set Variable  ${id_auth}
  ${header} =  Create Dictionary  accept=application/ld+json  Authorization=880e3d89-07f9-4f09-a1da-bc131dea55a5
  ${response}=  Get Request  mySession  clients/${client_id}/delete-all-favorites/?_locale=en
  Log To Console  ${response.content}
  The code status of request should be equald as expected  ${response.status_code}  200  
  Relod Application

The code status of request should be equald as expected
  [Arguments]  ${actuel_code_status}  ${expected_code_status}
  Should Be Equal As Strings  ${actuel_code_status}  ${expected_code_status}


