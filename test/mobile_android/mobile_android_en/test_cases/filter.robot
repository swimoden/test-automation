** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
# Test Teardown  Run Keyword If Test Failed  Relod Application and Login
Force Tags  Android  Filter  Filter_En

*** Variables ***

*** Test Cases ***

# I Succeed to make a Request callback from brand
#  [Tags]  Android_En_filter_brand
#  # As User I login in app
#  I can navigate to List Brand
#  I succeed to search vehicle using filter  5000  SEDAN  ABARTH
#  I succeed to find brand  Abarth 695

# I Succeed to make a Request callback from brand
#  [Tags]  Android_En_filter_maintenance
#  I can navigate to List Brand
#  I succeed to search car using filter from maintenance subcategory  ABARTH  ACURA


# I Succeed to search vehicle using filter from subcategory Marine
#  [Tags]  Android_En_filter_marine
#  I navigate to List Brand of Marine
#  I Should be on List Brand of Marine
#  I succeed to search vehicle using filter  10000  JET SKI  SEA DOO
#  I selects model with name  SPARK 2UP

# I Succeed to search vehicle using filter from subcategory Marine
#  [Tags]  Android_En_filter_bike
#  I can navigate to List Brand of Bike
#  I succeed to search vehicle using filter  5000  2 WHEELS  BMW
#  I selects model with name  C 650 GT

# I Succeed to search vehicle using filter from subcategory Marine
#  [Tags]  Android_En_filter_bike
#  I can navigate to List Brand of Bike
#  I succeed to search vehicle using filter  5000  2 WHEELS  BMW
#  I selects model with name  C 650 GT

# I Succeed to see locations
#  [Tags]  Android_En_locations
#  I can navigate to List Brand
#  I can navigate to List of models  Nissan
#  I can see locations

I Succeed to make a Request callback from brand
  [Tags]  Android_En_filter_brand
  I can navigate to List Brand
  I can navigate to List of models  Changan
  I can navigate to the details of the model  Changan  CS 85 



*** Keywords ***
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

  FOR  ${i}  IN RANGE  20
  ${present}=  Run Keyword And Return Status  Page should contain element  xpath=//*[@text='${model_name}']
  Exit For Loop If  ${present}
  Swipe By Percent  50  80  50  20  1000
  END
  Click Element  xpath=//*[@text='${model_name}']

I can navigate to List Brand of Bike
  I have access to Dashborad Screen 
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
  Click Element  id=com.kuwait.showroomz.refac:id/show_locations
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/loc_recycler
  Click Element  id=com.kuwait.showroomz.refac:id/navigate
  wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.view.ViewGroup/android.widget.FrameLayout[2]/android.widget.LinearLayout/android.widget.LinearLayout

I can book using correct information
  [Arguments]  ${nom_user}  ${phone_number}  
  I can see model Actions buttons
  I click Book Now Action button
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/user_information








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
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.ImageView
  I should sees the calculation result
  I achieved a finance call back request  ${nom_user}  ${phone_number}  ${civil_id}

I passed a Finance callback Request using wrong informations
  [Arguments]  ${down_payment}  ${instalement_period}  ${nom_user}  ${false_phone_number}  ${civil_id}
  Input Text  id=com.kuwait.showroomz.refac:id/down_payment_txt  ${down_payment}
  Click Element  id=com.kuwait.showroomz.refac:id/two_year_text
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.view.ViewGroup[2]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.ImageView
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

I add model to favorites List
  Click Element  id=com.kuwait.showroomz.refac:id/favorite_img

I select mode From Recently Viewed
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

I can make a Request Callback
  [Arguments]  ${nom_user}  ${phone_number}  
  I can see model Actions buttons
  I click Callback Action button
  I passed a callback Request  ${nom_user}  ${phone_number}

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
  Click Element  id=com.kuwait.showroomz.refac:id/exit_btn

I validate Callback Request
  Click Element  id=com.kuwait.showroomz.refac:id/ok_btn
  Sleep  6s

I should see success pop up
  Wait Until Element Is Visible  xpath=//*[@text='Done SuccessFully']
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
  # Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]
  # Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[2]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[3]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[4]
  Page Should Contain Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.view.ViewGroup/android.widget.LinearLayout[1]/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[5]

I Should Sees List Brands
  ${elements}=  Get WebElements  id=com.kuwait.showroomz.refac:id/brands_recycler
  Should Not Be Empty  ${elements}