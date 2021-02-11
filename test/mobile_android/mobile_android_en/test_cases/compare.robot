** Settings ***
Documentation  compare model car marine bike
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Resource  ../resources/keywords.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application and Login
Force Tags  compare  Android  Android_en  compare_En

*** Variables ***

*** Test Cases ***
I Succeed to compare two models from New category
  [Tags]  Android_En_compare_Brand
  As User I login in app
  I can navigate to List Brand
  I can navigate to List of models  BMW
  I can navigate to the details of the model  BMW  M5
  I open compare model screen
  I add another model to second trim  m  Maxima  SV
  I refresh compare screen
  I back to menu from compare model screen

I Succeed to compare two models from certified category
  [Tags]  Android_En_compare_certified
  # As User I login in app
  I can navigate to List Brand
  I can navigate to certified category
  I can navigate to List of models  BAIC
  I can navigate to the details of the model  BAIC  BJ40L
  I open compare model screen
  I add another model to second trim  d  Expedition - 2018  SV
  I refresh compare screen
  I back to menu from compare model screen

I Succeed to compare two models from marine category
  [Tags]  Android_En_compare_marine
  # As User I login in app
  I can navigate to List Brand of Marine
  I can navigate to List of models  JETSURF
  I can navigate to the details of the model  JETSURF  Race DFI Model
  I open compare model screen
  I add another model to second trim  m  262 Fisherman  SPECIFICATIONS
  I refresh compare screen
  I back to menu from compare model screen

I Succeed to compare two models from bike category
  [Tags]  Android_En_compare_bike
  # As User I login in app
  I can navigate to List Brand of Bike
  I can navigate to List of models  KAWASAKI - MOTORCYCLES
  I can navigate to the details of the model  KAWASAKI - MOTORCYCLES  NINJA ZX 10R
  I open compare model screen
  I add another model to second trim  K  KTM 690 ENDURO R  690 ENDURO R
  I refresh compare screen
  I back to menu from compare model screen

*** Keywords ***

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
  Wait Until Element Is Visible  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.FrameLayout/android.widget.LinearLayout
  Click Element  xpath=/hierarchy/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.widget.LinearLayout/android.widget.FrameLayout/android.view.ViewGroup/android.widget.FrameLayout/android.widget.FrameLayout/android.view.ViewGroup/androidx.recyclerview.widget.RecyclerView/android.view.ViewGroup[1]/android.widget.FrameLayout/android.widget.LinearLayout 
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
  Click Element  xpath=//*[@text='Certified']
  Wait Until Element Is Visible  id=com.kuwait.showroomz.refac:id/filter_btn
