** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application and Login
Force Tags  Android  Android_search_Ar  Android_search

*** Variables ***

*** Test Cases ***
I Succeed to search a brand from marine category
  [Tags]  Android_Ar_search_marine
  As User I login in app
  I can navigate to List Brand of Marine
  I search a brand using text  م
  I back to menu from search brand screen

I Succeed to search a model from bike category
  [Tags]  Android_Ar_search_bike
  I can navigate to List Brand of Bike
  I can navigate to List of models  KAWASAKI - MOTORCYCLES
  I search a model using text  م
  I back to menu from search model screen

*** Keywords ***




I can navigate to List Brand of Marine
  I have access to Dashborad Screen 
  I navigate to List Brand of Marine
  I Should be on List Brand of Marine

I can navigate to List Brand of Bike
  I have access to Dashborad Screen 
  I navigate to List Brand of Bike
  I Should be on List Brand of Bike


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


I have access to model details screen
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/model_name_txtV


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
  Wait Until Element Is Visible  xpath=(//android.widget.ImageView[@content-desc="cat image"])[2]
  Wait Until Element Is Visible  xpath=(//android.widget.ImageView[@content-desc="cat image"])[3]

I navigate to List Brand of Marine
  sleep  3s
  Click Element  xpath=(//android.widget.ImageView[@content-desc="cat image"])[2]
  sleep  3s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  click element  id=com.kuwait.showroomz.refac:id/circle_progress

I navigate to List Brand of Bike
  sleep  3s
  Click Element  xpath=(//android.widget.ImageView[@content-desc="cat image"])[3]
  sleep  3s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  click element  id=com.kuwait.showroomz.refac:id/circle_progress

I navigate to List Brand of Car
  sleep  3s
  Click Element  xpath=(//android.widget.ImageView[@content-desc="cat image"])[1]
  sleep  3s
  ${present}=  Run Keyword And Return Status  Page should contain element  id=com.kuwait.showroomz.refac:id/circle_progress
  Run Keyword If  ${present}  click element  id=com.kuwait.showroomz.refac:id/circle_progress



I Should be on List Brand
  I Should Sees Sub Categories
  I Should Sees List Brands

I Should be on List Brand of Marine
  I Should Sees Sub Categories of Marine
  I Should Sees List Brands

I Should be on List Brand of Bike
  I Should Sees Sub Categories of Bike
  I Should Sees List Brands

I Should Sees Sub Categories of Marine
  Page Should Contain Element  id=com.kuwait.showroomz.refac:id/serch_txt
  Wait Until Page Contains  معدات بحرية

I Should Sees Sub Categories of Bike
  Page Should Contain Element  id=com.kuwait.showroomz.refac:id/serch_txt
  Wait Until Page Contains  دراجات

I Should Sees List Brands
  ${elements}=  Get WebElements  id=com.kuwait.showroomz.refac:id/brands_recycler
  Should Not Be Empty  ${elements}

I search a brand using text
  [Arguments]  ${brand_name}
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/serch_txt
  Click Element  id=com.kuwait.showroomz.refac:id/serch_txt
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/filter_by_budget_edit_text
  AppiumLibrary.Clear Text  id=com.kuwait.showroomz.refac:id/filter_by_budget_edit_text
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/filter_by_budget_edit_text  ${brand_name}

  FOR  ${i}  IN RANGE  4
  Wait Until Keyword Succeeds  3x  1s  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.TextView 
  ${name}  Get Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.TextView

  ${name}=  Convert To Lowercase  ${name}
  ${brand_name}=  Convert To Lowercase  ${brand_name}
  Should Be True  '${brand_name}' in '${name}'
  Swipe By Percent  50  80  50  20  1000

  END

I search a model using text
  [Arguments]  ${brand_name}

  Wait Until Keyword Succeeds  6x  3s  Navigate to search screen
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/filter_by_budget_edit_text
  AppiumLibrary.Clear Text  id=com.kuwait.showroomz.refac:id/filter_by_budget_edit_text
  AppiumLibrary.Input Text  id=com.kuwait.showroomz.refac:id/filter_by_budget_edit_text  ${brand_name}

  FOR  ${i}  IN RANGE  4
  Wait Until Keyword Succeeds  3x  1s  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.TextView
  ${name}  Get Text  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.TextView

  ${name}=  Convert To Lowercase  ${name}
  ${brand_name}=  Convert To Lowercase  ${brand_name}
  Should Be True  '${brand_name}' in '${name}'
  Swipe By Percent  50  80  50  20  1000

  END

Navigate to search screen
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/serch_txt
  Click Element  id=com.kuwait.showroomz.refac:id/serch_txt
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/filter_by_budget_edit_text




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


