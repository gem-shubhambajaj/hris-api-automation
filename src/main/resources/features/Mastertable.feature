Feature: HRIS-API

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

  Scenario Outline: HRIS, User is able to get Master table data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status | Description           | api            |
      | getMasterTableData | get    | 200             | Get Master Table Data | MasterTableApi |

  Scenario Outline: HRIS, User is able to save Master Table data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<url>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description            | payload             | url            |
      | saveMasterTableData | post   | 200             | Save Master Table Data | saveMasterTableData | MasterTableApi |

  Scenario Outline: HRIS, User is able to update Master Table data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<url>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status | Description              | payload               | url            |
      | updateMasterTableData | post   | 200             | Update Master Table Data | updateMasterTableData | MasterTableApi |

#Negative_scenarios
  Scenario Outline: HRIS, User is not able to update Master Table data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<url>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status | Description              | payload | url            |
      | updateMasterTableData | post   | 0               | Update Master Table Data | abc     | MasterTableApi |