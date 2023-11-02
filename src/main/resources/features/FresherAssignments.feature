@reg
Feature: HRIS Automation

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

    
  Scenario Outline: HRIS, User is able to upload candidate data
    Given Set endpoint and method and Description and payload "saveBulkCandidateFresherAssign" and "post" and "Upload candidate data" and "uploadCandidateData" and "fresherAssignApi"
    Then Verify Status code <Expected_status>
    Then Store created id from the response
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Fresher Assignment Data Fetched Successfully"
    Then Validate response data for upload candidate data 
    Examples:
      | endpoint                   | Method | Expected_status | Description                 | api              |
      | getCandidatesFresherAssign | get    | 200             | Get fresher assignment data | fresherAssignApi |

    
  Scenario Outline: HRIS, User is able to send assignment mail
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail sent successfully"
    Examples:
      | endpoint           | Method | Expected_status | Description          | payload            | api              |
      | sendAssignmentMail | post   | 200             | Send Assignment Mail | sendAssignmentMail | fresherAssignApi |

    
  Scenario Outline: HRIS, User is able to upload assignments
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Upload Assignment Data Fetched Successfully"
    Then Validate response data for upload assignments
    Examples:
      | endpoint          | Method | Expected_status | Description        | payload           | api              |
      | uploadAssignments | post   | 200             | Upload Assignments | uploadAssignments | fresherAssignApi |
#
#    
  Scenario Outline: HRIS, User is able to download assignments
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Download Assignment Data Fetched Successfully"
    Then Validate response data for download assignments
    Examples:
      | endpoint            | Method | Expected_status | Description          | payload             | api              |
      | downloadAssignments | post   | 200             | Download Assignments | downloadAssignments | fresherAssignApi |
#
  Scenario Outline: HRIS, User is able to validate token
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                   | Method | Expected_status | Description    | api              |
      | validateTokenFresherAssign | get    | 200             | Validate Token | fresherAssignApi |

    
  Scenario Outline: HRIS, User is able to get fresher assignment data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                   | Method | Expected_status | Description                 | api              |
      | getCandidatesFresherAssign | get    | 200             | Get fresher assignment data | fresherAssignApi |