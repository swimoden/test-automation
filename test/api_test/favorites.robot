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
${BASE_URL}  https://vps-08303c09.vps.ovh.ca/api/v2
${id_auth}  880e3d89-07f9-4f09-a1da-bc131dea55a5
*** Test Cases ***


I get the client id
  Create Session  mySession  ${BASE_URL}
  ${id} =  Set Variable  880e3d89-07f9-4f09-a1da-bc131dea55a5
  ${response}=  Get Request  mySession  /authentication_token/?email=${email}&password=${password}
  The code status of request should be equald as expected  ${response.status_code}  200  

I can't get agency by false id arabic translate
  Create Session  mySession  ${BASE_URL}
  ${id} =  Set Variable  880e3d89-ffff-4f09-a1da-bc131dea55a5
  ${response}=  Get Request  mySession  /agencies/?email=${email}&password=${password}
  The code status of request should be equald as expected  ${response.status_code}  404 
