*** Settings ***
Documentation  shared keywords
Library  FakerLibrary
Library  RequestsLibrary
Library  JSONLibrary
Library  Collections
Library  OperatingSystem
Library  String

*** Variables ***
${BASE_URL}  https://vps-08303c09.vps.ovh.ca/api/v2/

*** Keywords ***
The code status of request should be equald as expected
  [Arguments]  ${actuel_code_status}  ${expected_code_status}
  Should Be Equal As Strings  ${actuel_code_status}  ${expected_code_status}