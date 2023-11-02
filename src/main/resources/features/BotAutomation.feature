@reg
Feature: HRIS Automation

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

  Scenario Outline: Get Bot Chat data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data of bot chat data
    Examples:
      | endpoint       | Method | Expected_status | Description       | payload        | api              |
      | getBotChatData | post   | 200             | Get Bot Chat data | getBotChatData | botAutomationApi |

  Scenario Outline: Finance Bot Chat data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data of bot chat data
    Examples:
      | endpoint       | Method | Expected_status | Description   | payload        | api              |
      | finBotChatData | post   | 200             | Find Bot Chat | finBotChatData | botAutomationApi |

  Scenario Outline: set Bot Context
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Success"
    Examples:
      | endpoint      | Method | Expected_status | Description        | payload       | api              |
      | botContextSet | post   | 200             | Set Context of bot | botContextSet | botAutomationApi |

  Scenario Outline: set Finance Bot Chat Context
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description               | payload          | api              |
      | finBotContextSet | post   | 200             | Find Bot Chat Context Set | finBotContextSet | botAutomationApi |