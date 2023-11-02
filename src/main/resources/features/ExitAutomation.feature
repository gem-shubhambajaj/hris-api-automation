@reg
Feature: HRIS Automation

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

  Scenario: Save and get resignation data
    Given Set endpoint and method and Description and payload "saveResignationData" and "post" and "Save Resignation Data" and "saveResignationData" and "exitAutomationApi"
    Then Verify Status code 200
    When Set endpoint and method and Description "getResignationData" and "get" and "get Resignation Data" and "exitAutomationApi"
    Then Validate response message "OffBoarding Data Fetched Successfully"
    And Validate response data of resignation
    Then Set endpoint and method and Description and payload "save" and "post" and "revoke Resignation" and "revokeResignation" and "exitAutomationApi"
    Then Verify Status code 200
    When Validate response message "Application Revoked"
    Then Validate revoke resignation response data

  Scenario Outline: Send Reminder
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail Sent"
    Examples:
      | endpoint     | Method | Expected_status | Description   | api               |
      | sendReminder | post   | 200             | Send Reminder | exitAutomationApi |

