*** Settings ***
Documentation  shared keywords
Library  FakerLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  OperatingSystem
Library  String
Resource  Keyword.resource

*** Variables ***
${DATA_DIR}  test${/}api_test${/}data${/} 
${ADRESS_AR_RESPONSE}  ${DATA_DIR}adresse_ar_response.json

*** Test Cases ***
I should get adresse by id arabic translate
  Create Session  mySession  ${BASE_URL}
  ${id} =  Set Variable  17e81ed7-dd81-4b25-9db1-190267740806
  ${response}=  Get Request  mySession  /addresses/${id}?_locale=ar
  The code status of request should be equald as expected  ${response.status_code}  200  

I can't get adresse by false id arabic translate
  Create Session  mySession  ${BASE_URL}
  ${id} =  Set Variable  17e81ed7-dddd-4b25-9db1-190267740806
  ${response}=  Get Request  mySession  /addresses/${id}?_locale=ar
  The code status of request should be equald as expected  ${response.status_code}  404 

I should get adresse by id english translate
  Create Session  mySession  ${BASE_URL}
  ${id} =  Set Variable  17e81ed7-dd81-4b25-9db1-190267740806
  ${response}=  Get Request  mySession  /addresses/${id}?_locale=en
  The code status of request should be equald as expected  ${response.status_code}  200  

I can't get adresse by false id english translate
  Create Session  mySession  ${BASE_URL}
  ${id} =  Set Variable  17e81ed7-dddd-4b25-9db1-190267740806
  ${response}=  Get Request  mySession  /addresses/${id}?_locale=en
  The code status of request should be equald as expected  ${response.status_code}  404  

*** Keywords ***
Prepare expected body
  [Arguments]  ${expected_json_path}
  ${resource_json}=  Load Json From File  ${expected_json_path}
  ${resource_json_string}=  Convert JSON To String  ${resource_json}
  ${json}=  evaluate  json.loads('''${resource_json_string}''')  json
  ${body}=  Convert To Dictionary  ${json}
  [Return]  ${body}

# Response body should be equald expected boy
#  [Arguments]  ${actual_content}  ${expected_content}  
#  FOR  ${key}  IN  @{expected_content.keys()}  
#  ${expected_value} =  Convert To String  ${expected_content["${key}"]} 
#  ${actual_value} =  Convert To String  ${actual_content["${key}"]} 
#  Should Be Equal As Strings  ${actual_value}  ${expected_value} 
#  END

