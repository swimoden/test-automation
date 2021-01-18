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


*** Test Cases ***
I should get agency by id arabic translate
  Create Session  mySession  ${BASE_URL}
  ${id} =  Set Variable  880e3d89-07f9-4f09-a1da-bc131dea55a5
  ${response}=  Get Request  mySession  /agencies/${id}?_locale=ar
  The code status of request should be equald as expected  ${response.status_code}  200  

I can't get agency by false id arabic translate
  Create Session  mySession  ${BASE_URL}
  ${id} =  Set Variable  880e3d89-ffff-4f09-a1da-bc131dea55a5
  ${response}=  Get Request  mySession  /agencies/${id}?_locale=ar
  The code status of request should be equald as expected  ${response.status_code}  404 

I should get agency by id english translate
  Create Session  mySession  ${BASE_URL}
  ${id} =  Set Variable  880e3d89-07f9-4f09-a1da-bc131dea55a5
  ${response}=  Get Request  mySession  /agencies/${id}?_locale=en
  The code status of request should be equald as expected  ${response.status_code}  200  

I can't get agency by false id english translate
  Create Session  mySession  ${BASE_URL}
  ${id} =  Set Variable  880e3d89-ffff-4f09-a1da-bc131dea55a5
  ${response}=  Get Request  mySession  /agencies/${id}?_locale=en
  The code status of request should be equald as expected  ${response.status_code}  404  



