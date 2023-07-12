Feature: HRIS Automation

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

  Scenario Outline: HRIS, User is able to save Resignation data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<url>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description           | payload             | url               |
      | saveResignationData | post   | 200             | Save Resignation Data | saveResignationData | exitAutomationApi |

  Scenario Outline: HRIS, User is able to send Reminder
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description   | api               |
      | sendReminder | post   | 200             | Send Reminder | exitAutomationApi |

  Scenario Outline: HRIS, User is able to get Resignation data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status | Description          | api               |
      | getResignationData | get    | 200             | get Resignation Data | exitAutomationApi |

  Scenario Outline: HRIS, User is able to revoke Resignation
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<url>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description        | payload           | url               |
      | save     | post   | 200             | revoke Resignation | revokeResignation | exitAutomationApi |

