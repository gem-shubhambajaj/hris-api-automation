Feature: HRIS Automation
#
  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

  Scenario Outline: HRIS, User is able to authorize user
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | payload          | api         |
      | trainingUserAuth | post   | 200             | User Authorization | trainingUserAuth | TrainingApi |
##Response body is null
#
  Scenario Outline: HRIS, User is able to save training
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description   | payload      | api         |
      | trainingSave | post   | 200             | Save Training | trainingSave | TrainingApi |
#
  Scenario Outline: HRIS, User is able to send training mail
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | payload          | api         |
      | sendTrainingMail | post   | 200             | send Training Mail | sendTrainingMail | TrainingApi |

  Scenario Outline: HRIS, User is able to save training gap analysis form
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description            | payload             | api         |
      | saveGapAnalysisForm | post   | 200             | Save Gap Analysis Form | saveGapAnalysisForm | TrainingApi |
#
  Scenario Outline: HRIS, User is able to save security feedback data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                 | Method | Expected_status | Description                 | payload                  | api         |
      | saveSecurityFeedbackData | post   | 200             | Save Security Feedback Data | saveSecurityFeedbackData | TrainingApi |
#
  Scenario Outline: HRIS, User is able to get training
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description  | api         |
      | getTraining | get    | 200             | Get Training | TrainingApi |
#
  Scenario Outline: HRIS, User is able to get training count
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | api         |
      | getTrainingCount | get    | 200             | Get Training Count | TrainingApi |
#
#  Scenario Outline: HRIS, User is able to validate token trainingz
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint              | Method | Expected_status | Description             | api         |
#      | validateTokenTraining | get    | 200             | Validate Token Training | TrainingApi |
#
  Scenario Outline: HRIS, User is able to send feedback reminder
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint             | Method | Expected_status | Description            | api         |
      | sendFeedbackReminder | get    | 200             | Send Feedback Reminder | TrainingApi |
#
  Scenario Outline: HRIS, User is able to get all training gap form data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint               | Method | Expected_status | Description                    | api         |
      | getTrainingGapFormData | get    | 200             | Get All Training Gap Form Data | TrainingApi |
#
  Scenario Outline: HRIS, User is able to get training skills data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description              | api         |
      | getTrainingSkills | get    | 200             | Get Training Skills Data | TrainingApi |
#
  Scenario Outline: HRIS, User is able to send training gap mail
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint               | Method | Expected_status | Description            | api         |
      | trainingGapMailTrigger | get    | 200             | Send Training Gap Mail | TrainingApi |
#
#  Scenario Outline: HRIS, User is able to validate token training gap
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint                 | Method | Expected_status | Description                 | api         |
#      | validateTokenTrainingGap | get    | 200             | Validate Token Training GAP | TrainingApi |
#
