@reg
Feature: HRIS-API

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

  Scenario Outline: save Master Table data
    Given Set endpoint and method and Description and payload "saveMasterTableData" and "post" and "Save Master Table Data" and "saveMasterTableData" and "masterTableApi"
    Then Verify Status code <Expected_status>
    Then Store created id from the response
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data for save master table
    Examples:
      | endpoint           | Method | Expected_status | Description           | api            |
      | getMasterTableData | get    | 200             | Get Master Table Data | masterTableApi |

  Scenario Outline: update Master Table data
    Given Set endpoint and method and Description and payload "updateMasterTableData" and "post" and "Update Master Table Data" and "updateMasterTableData" and "masterTableApi"
    Then Verify Status code <Expected_status>
    Then Store created id from the response
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data for update master table
    Examples:
      | endpoint           | Method | Expected_status | Description           | api            |
      | getMasterTableData | get    | 200             | Get Master Table Data | masterTableApi |