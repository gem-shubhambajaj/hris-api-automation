@reg
Feature: HRIS Automation

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200
#
  Scenario Outline: trigger mail tax saving
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail Sent"
    Examples:
      | endpoint             | Method | Expected_status | Description             | payload              | api             |
      | triggerMailTaxSaving | post   | 200             | Trigger mail tax saving | triggerMailTaxSaving | accountsDataApi |

  Scenario Outline: save tax saving options
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate Response data after saving tax options
    Examples:
      | endpoint             | Method | Expected_status | Description             | payload              | api             |
      | saveTaxSavingOptions | post   | 200             | Save tax saving options | saveTaxSavingOptions | accountsDataApi |

  Scenario Outline: set taxSavingOptions to verified
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data of tax savings option verification
    Examples:
      | endpoint             | Method | Expected_status | Description                      | payload              | api             |
      | taxSavingSetVerified | post   | 200             | Set taxSavingOptions to verified | taxSavingSetVerified | accountsDataApi |

  Scenario Outline: validate token
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description    | api         |
      | validateTokenSaving | get    | 200             | Validate Token | accountsDataApi |

  Scenario Outline: Get all tax saving data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Tax Saving Options Data Fetched Successfully"
    Examples:
      | endpoint            | Method | Expected_status | Description             | api             |
      | getTaxSavingAllData | get    | 200             | Get all tax saving data | accountsDataApi |

  Scenario Outline: Get tax saving export
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate export URL from response data
    Examples:
      | endpoint           | Method | Expected_status | Description           | api             |
      | getTaxSavingExport | get    | 200             | Get tax saving export | accountsDataApi |

  Scenario Outline: Tax Saving Bi-Annual
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail Sent"
    Examples:
      | endpoint          | Method | Expected_status | Description          | api             |
      | taxSavingBiAnnual | get    | 200             | Tax Saving Bi-annual | accountsDataApi |

  Scenario Outline: Bi-Annual reminder
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail sent successfully"
    Examples:
      | endpoint         | Method | Expected_status | Description        | api             |
      | BiAnnualReminder | get    | 200             | Bi-Annual Reminder | accountsDataApi |
#
  Scenario Outline: tax saving reminder cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail Sent"
    Examples:
      | endpoint              | Method | Expected_status | Description              | api             |
      | taxSavingReminderCron | get    | 200             | Tax saving reminder cron | accountsDataApi |

  Scenario Outline: sync official info
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Synced successfully"
    Examples:
      | endpoint         | Method | Expected_status | Description        | api         |
      | syncOfficialInfo | get    | 200             | Sync official info | accountsDataApi |

