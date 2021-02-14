** Settings ***
Documentation  Request callback from brand
Library  FakerLibrary
Library  Collections
Resource  ../resources/setup_teardown.resource
Suite Setup  Open the application
Suite Teardown  Clean up the test suite
Test Teardown  Run Keyword If Test Failed  Relod Application
Force Tags  Ios  show

*** Variables ***

*** Test Cases ***
I Succeed to Show interior default
  [Tags]  Ios_en_Show_interior_default_off_ligne
  I visit a model and back to menu  Audi  Q7
  I select mode From Recently Viewed
  I can navigate to interior 
  I should be in interior 
  I go back to menu from interieur 

I Succeed to Show interior from Exterior
  [Tags]  Ios_en_Show_interior_from_Exterior_off_ligne
  I visit a model and back to menu  Audi  Q7
  I select mode From Recently Viewed
  I can navigate to Exterior 
  I should be in Exterior 
  I can navigate to Interior from Exterior
  I should be in interior
  I go back to menu from interieur 

I Succeed to Show Exterior default
  [Tags]  Ios_en_Show_Exterior_default_off_ligne
  I visit a model and back to menu  Audi  Q7
  I select mode From Recently Viewed
  I can navigate to Exterior 
  I should be in Exterior 
  I go back to menu from Exterior 

I Succeed to Show Exterior from
  [Tags]  Ios_en_Show_Exterior_from_Interior_off_ligne
  I visit a model and back to menu  Audi  Q7
  I select mode From Recently Viewed
  I can navigate to interior 
  I should be in interior
  I can navigate to Exterior from Interior
  I should be in Exterior 
  I go back to menu from Exterior 

I Succeed to Show Gallery
  [Tags]  Ios_en_Show_Gallery_off_ligne
  I can navigate to List Marine brands
  I can navigate to List of models marine  JETSURF
  I can navigate to marine model  Race DFI Model
  I can navigate to gallory 
  I should be in gallory
  I go back to menu from gallory


I Succeed to share car model
  [Tags]  Ios_en_share_car_model_off_ligne
  I can navigate to List Brand
  I can navigate to List of models  Audi
  I can navigate to the details of the model  Audi  A5 Coupe
  I can share car model 
  I should be in car share screen
  I go back to menu from car share screen


I Succeed to share marine mode
  [Tags]  Ios_en_share_marine_mode_off_ligne
  I can navigate to List Marine brands
  I can navigate to List of models marine  JETSURF
  I can navigate to marine model  Race DFI Model
  I can share marine model
  I should be in marine share screen
  I go back to menu from marine share screen


I Succeed to share bike mode
  [Tags]  Ios_en_share_bike_mode_off_ligne
  I can navigate to List bike brands
  I can navigate to List of models  KAWASAKI - MOTORCYCLES
  I can navigate to the details of the model  KAWASAKI - MOTORCYCLES  NINJA ZX 10R
  I can share bike model
  I should be in Bike share screen
  I go back to menu from Bike share screen 
  [Teardown]  NONE



*** Keywords ***
I go back to menu from Bike share screen
  Click Element  xpath=//XCUIElementTypeButton[@name="Close"]
  Sleep  1s  
  Click Element  accessibility_id=back
  Wait Until Page Contains Element  xpath=//XCUIElementTypeButton[@name="multiply"]
  Click Element  xpath=//XCUIElementTypeButton[@name="multiply"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}
  Click Element  accessibility_id=back black
  Wait Until Element Is Visible  accessibility_id=back
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Close advertisement
  Wait Until Element Is Visible  accessibility_id=menu 
I can navigate to List bike brands
  I have access to Dashborad Screen 
  I navigate to List bike Brand 
  I Should be on List Bike Brand

I navigate to List bike Brand
  Click Element  accessibility_id=Bike
  Run Keyword And Ignore Error  Wait and close Pub

I Should be on List Bike Brand
  Wait Until Element Is Visible  accessibility_id=KAWASAKI - MOTORCYCLES
  Wait Until Element Is Visible  accessibility_id=KAWASAKI - SIDE X SIDE

I go back to menu from marine share screen
  Click Element  xpath=//XCUIElementTypeButton[@name="Close"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="back"]
  Click Element  xpath=//XCUIElementTypeButton[@name="back"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="back black"]
  Click Element  xpath=//XCUIElementTypeButton[@name="back black"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="MARINE"]
  Click Element  xpath=//XCUIElementTypeButton[@name="back"]
  Wait Until Element Is Visible  accessibility_id=menu

I can share bike model
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="ic share"]
  Click Element  xpath=//XCUIElementTypeButton[@name="ic share"]

I can share marine model
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="ic share"]
  Click Element  xpath=//XCUIElementTypeButton[@name="ic share"]

I should be in marine share screen
  Wait Until Element Is Visible  xpath=//XCUIElementTypeOther[@name="Please check Race DFI Model and tell me your opinion."]

I should be in Bike share screen
  Wait Until Element Is Visible  xpath=//XCUIElementTypeOther[@name="Please check NINJA ZX 10R and tell me your opinion."]

I go back to menu from car share screen
  Click Element  xpath=//XCUIElementTypeButton[@name="Close"]
  Click Element  accessibility_id=back
  Wait Until Page Contains Element  xpath=//XCUIElementTypeButton[@name="multiply"]
  Click Element  xpath=//XCUIElementTypeButton[@name="multiply"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}
  Click Element  accessibility_id=back black
  Run Keyword And Ignore Error  Close advertisement
  Page Should Contain Element  accessibility_id=New
  Page Should Contain Element  accessibility_id=Certified
  Page Should Contain Element  accessibility_id=Leasing
  Page Should Contain Element  accessibility_id=Rent
  Page Should Contain Element  accessibility_id=Maintenance
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Close advertisement
  Wait Until Element Is Visible  accessibility_id=menu 

I should be in car share screen
  Wait Until Element Is Visible  xpath=//XCUIElementTypeOther[@name="Please check A5 Coupe and tell me your opinion."]

I can share car model
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="ic share"]
  Click Element  xpath=//XCUIElementTypeButton[@name="ic share"]

I go back to menu from gallory
  Click Element  xpath=//XCUIElementTypeButton[@name="close icon"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="back"]
  Click Element  xpath=//XCUIElementTypeButton[@name="back"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="back black"]
  Click Element  xpath=//XCUIElementTypeButton[@name="back black"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="MARINE"]
  Click Element  xpath=//XCUIElementTypeButton[@name="back"]
  Wait Until Element Is Visible  accessibility_id=menu

I should be in gallory
  wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]
  Wait Until Page Contains Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeCollectionView[2]

I can navigate to gallory
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="gallery"]
  Click Element  xpath=//XCUIElementTypeStaticText[@name="gallery"]

I can navigate to List of models marine
  [Arguments]  ${model_name}
  # I have access to List Brand
  I selects a brand with name  ${model_name}
  I should Sees the List of model  ${model_name}

I can navigate to marine model
  [Arguments]  ${model}
  Click Element  accessibility_id=${model}

I can navigate to List Marine brands
  I have access to Dashborad Screen 
  I navigate to List Marine Brand 
  I Should be on List Marine Brand 

I Should be on List Marine Brand
  Wait Until Element Is Visible  accessibility_id=JETSURF
  Wait Until Element Is Visible  accessibility_id=Sea Doo

I navigate to List Marine Brand
  Click Element  accessibility_id=Marine
  Run Keyword And Ignore Error  Wait and close Pub

I can navigate to Exterior from Interior
  Click Element  xpath=(//XCUIElementTypeButton[@name="Exterior"])[2]

I can navigate to Interior from Exterior
  Click Element  xpath=(//XCUIElementTypeButton[@name="Interior"])[2]

I can navigate to Exterior
  Click Element  xpath=//XCUIElementTypeStaticText[@name="Exterior"]

I should be in Exterior
  Wait Until Element Is Visible  xpath=(//XCUIElementTypeButton[@name="Interior"])[2]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="Back"]

I go back to menu from Exterior
  Click Element  accessibility_id=Back
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="Exterior"]
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Close advertisement
  Wait Until Element Is Visible  accessibility_id=menu 

I go back to menu from interieur
  Click Element  accessibility_id=Back
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="Interior"]
  Click Element  accessibility_id=back
  Run Keyword And Ignore Error  Close advertisement
  Wait Until Element Is Visible  accessibility_id=menu 

I can navigate to interior
  Click Element  xpath=//XCUIElementTypeStaticText[@name="Interior"]

I should be in interior
  Wait Until Element Is Visible  xpath=(//XCUIElementTypeButton[@name="Exterior"])[2]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="Back"]

I click Finance Action button
  Click Element  xpath=//XCUIElementTypeStaticText[@name="Finance"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="Calculate"]

I passed a Finance callback Request
  [Arguments]  ${down_payment}  ${instalement_period}  ${nom_user}  ${false_phone_number}  ${phone_number}  ${civil_id}
  Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField  ${down_payment}
  Click Element  id=done
  Click Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeCollectionView/XCUIElementTypeCell[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeImage
  Click Element  xpath=//XCUIElementTypeStaticText[@name="${instalement_period}"]
  I should sees the calculation result
  I achieved a finance call back request  ${nom_user}  ${false_phone_number}  ${phone_number}  ${civil_id}

I achieved a finance call back request
  [Arguments]  ${nom_user}  ${false_phone_number}  ${phone_number}  ${civil_id}
  Click Element  //XCUIElementTypeButton[@name="Callback"]
  I have access to callback popup
  I set Full name  ${nom_user}
  I set false Phone Number  ${false_phone_number}
  I validate Callback Request
  I cannot proceed Callback Request
  I set Phone Number  ${phone_number}
  I set civilId  ${civil_id}
  I validate Callback Request
  I should see success pop up

I should sees the calculation result
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="Estimated Value Result"]

I select mode From favorites List
  [Arguments]  ${model_name}
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="${model_name}"]
  Click Element  xpath=//XCUIElementTypeStaticText[@name="${model_name}"]

I select favorites Item
  Click Element  accessibility_id=FAVORITES
  Wait Until Element Is Visible  //XCUIElementTypeStaticText[@name="Car "]

I visit a model add it to favorites and back to menu
  [Arguments]  ${brand_name}  ${model_name}
  I can navigate to List Brand
  I can navigate to List of models  ${brand_name}
  I can navigate to the details of the model  ${brand_name}  ${model_name}
  I add brand to favorites List
  I go back to menu from model details

I add brand to favorites List
  Click Element  xpath=//XCUIElementTypeButton[@name="ic favorites"]

I select mode From Recently Viewed
  Wait Until Element Is Visible  xpath=(//XCUIElementTypeStaticText[@name="Car | New | "])[2] 
  Click Element  xpath=(//XCUIElementTypeStaticText[@name="Car | New | "])[2] 

I visit a model and back to menu
  [Arguments]  ${brand_name}  ${model_name}
  I can navigate to List Brand
  I can navigate to List of models  ${brand_name}
  I can navigate to the details of the model  ${brand_name}  ${model_name}
  I go back to menu from model details

I can navigate to List Brand
  I have access to Dashborad Screen 
  I navigate to List Brand 
  I Should be on List Brand 

I can navigate to List of models
  [Arguments]  ${model_name}
  I have access to List Brand
  I selects a brand with name  ${model_name}
  I should Sees the List of model  ${model_name}

I can navigate to the details of the model
  [Arguments]  ${model_name}  ${brand_name}
  I have access to the List of models  ${model_name}
  I selects model with name  ${brand_name}
  I should Sees the details of the model  ${brand_name}

I can make a Request Callback
  [Arguments]  ${nom_user}  ${false_phone_number}  ${phone_number}  
  I can see model Actions buttons
  I click Callback Action button
  I passed a callback Request  ${nom_user}  ${false_phone_number}  ${phone_number}


I passed a callback Request
  [Arguments]  ${nom_user}  ${false_phone_number}  ${phone_number}  
  I have access to callback popup
  I set Full name  ${nom_user}
  I set false Phone Number  ${false_phone_number}
  I validate Callback Request
  I cannot proceed Callback Request
  I set Phone Number  ${phone_number}
  I validate Callback Request
  I should see success pop up

I set civilId
  [Arguments]  ${civil_id}
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[3]  ${civil_id}

I cannot proceed Callback Request
  Page Should Contain Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[2]

I validate Callback Request
  Click Element  accessibility_id=tick mark icon

I should see success pop up
  Wait Until Element Is Visible  accessibility_id=Success  
  Sleep  5s
  wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="close icon"]
  Click Element  xpath=//XCUIElementTypeButton[@name="close icon"]
  Sleep  5s

I set Full name
  [Arguments]  ${full_name}
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[1]  ${full_name}

I set Phone Number
  [Arguments]  ${phone_number}
  AppiumLibrary.Clear Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[2]
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[2]  ${phone_number}

I set false Phone Number
  [Arguments]  ${false_phone_number}
  AppiumLibrary.Input Text  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTextField[2]  ${false_phone_number}

I have access to callback popup
  Wait Until Element Is Visible  accessibility_id=Please Add your information to be contacted

I can see model Actions buttons
  I have access to model details screen  
  Click Element  xpath=//XCUIElementTypeButton[@name="${SPACE} Click Here"] 
  I can sees list of actions

I click Callback Action button
  Click Element  accessibility_id=CallBack

I have access to model details screen
  Wait Until Element Is Visible  xpath=//XCUIElementTypeButton[@name="${SPACE} Click Here"]


I can sees list of actions
  Wait Until Element Is Visible  accessibility_id=CallBack

I should Sees the details of the model
  [Arguments]  ${model_name}
  Wait Until Element Is Visible  accessibility_id=${model_name}  

I selects model with name
  [Arguments]  ${model_name}
  Wait Until Element Is Visible  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[1]/XCUIElementTypeButton
  Click Element  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther[2]/XCUIElementTypeOther[1]/XCUIElementTypeButton
  Wait Until Element Is Visible  xpath=//XCUIElementTypeTextField[@value="You can Search by Brand, Model or budget"]  
  Input Text  xpath=//XCUIElementTypeTextField[@value="You can Search by Brand, Model or budget"]  ${model_name}
  Wait Until Page Contains Element  xpath=//XCUIElementTypeStaticText[@name="${model_name}"]  timeout=20s
  Click Element  xpath=//XCUIElementTypeStaticText[@name="${model_name}"]
    # xpath=//XCUIElementTypeStaticText[@name="Changan "]
I have access to the List of models
  [Arguments]  ${brand_name}
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="Main Showroom"]

I should Sees the List of model
  [Arguments]  ${brand_name}
  Run Keyword And Ignore Error  Wait and close Pub
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="Main Showroom"]
  Wait Until Element Is Visible  xpath=//XCUIElementTypeStaticText[@name="${brand_name}"]
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}

I selects a brand with name
  [Arguments]  ${brand_name}
  # xpath=//XCUIElementTypeStaticText[@name="Changan "]
  Click Element  xpath=//XCUIElementTypeStaticText[@name="${brand_name}"]
    # xpath=//XCUIElementTypeStaticText[@name="Changan "]
  Run Keyword And Continue On Failure  Click Element  xpath=//XCUIElementTypeStaticText[@name="${brand_name}"]

I have access to List Brand
  I Should Sees List Brands

I have access to Dashborad Screen
  Wait Until Element Is Visible  accessibility_id=Car  

I navigate to List Brand
  Click Element  accessibility_id=Car
  Run Keyword And Ignore Error  Wait and close Pub

I Should be on List Brand
  I Should Sees Sub Categories
  I Should Sees List Brands

I Should Sees Sub Categories
  Page Should Contain Element  accessibility_id=New
  Page Should Contain Element  accessibility_id=Certified
  Page Should Contain Element  accessibility_id=Leasing
  Page Should Contain Element  accessibility_id=Rent
  Page Should Contain Element  accessibility_id=Maintenance

I Should Sees List Brands
  ${elements}=  Get WebElements  xpath=//XCUIElementTypeApplication[@name="Showroomz_refac"]/XCUIElementTypeWindow[1]/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeOther/XCUIElementTypeTable/XCUIElementTypeCell
  Should Not Be Empty  ${elements}