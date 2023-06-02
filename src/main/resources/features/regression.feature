Feature: HRIS Automation

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

#HRonboardSaveData
  Scenario: Save the candidate
    When Set endpoint and method and Description and payload "save" and "post" and "Save Candidate" and "save" and "HRSaveDataApi"
    Then Verify Status code 200

  Scenario Outline: Update candidate details
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description              | payload | api           |
      | update   | post   | 200             | Update Candidate Details | update  | HRSaveDataApi |

  Scenario Outline: Get all skill types
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | Description         | api          |
      | getSkills | get    | 200             | Get all skill types | HRGetDataApi |

  Scenario Outline: Get employee skills data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description              | api          |
      | getEmployeeSkills | get    | 200             | Get employee skills data | HRGetDataApi |

  Scenario Outline: Get MIS detail of all employees
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description                     | api          |
      | getMISDetail | get    | 200             | Get MIS detail of all employees | HRGetDataApi |

  Scenario Outline: Get skills mail status
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description            | api          |
      | getSkillsStatus | get    | 200             | Get skills mail status | HRGetDataApi |

  Scenario Outline: Get LWF data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | Description  | api          |
      | getLwfData | get    | 200             | Get lwf data | HRGetDataApi |

  Scenario Outline: Get TPO details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | Description     | api          |
      | tpoDetails | get    | 200             | Get tpo details | HRGetDataApi |

  Scenario Outline: Get all permission types
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description              | api          |
      | getAllPermission | get    | 200             | Get all permission types | HRGetDataApi |

  Scenario Outline: Get data from MIS
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description       | api          |
      | getDataFromMis | get    | 200             | Get data from MIS | HRGetDataApi |

  Scenario Outline: Get data of employees in Administration department
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description                         | api          |
      | getAdminDetail | get    | 200             | Get data of employees in Admin dept | HRGetDataApi |

  Scenario Outline: Get data of employees in IT department
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description                      | api          |
      | getItDetail | get    | 200             | Get data of employees in IT dept | HRGetDataApi |

  Scenario Outline: Send bulk feedback reminder
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint             | Method | Expected_status | Description                 | payload              | api           |
      | bulkFeedbackReminder | post   | 200             | Send Bulk Feedback Reminder | bulkfeedbackreminder | HRSaveDataApi |

  Scenario Outline: HRIS, User is able to save skills
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint               | Method | Expected_status | Description | payload                | api           |
      | saveEmployeeSkillsData | post   | 200             | Save Skills | saveEmployeeSkillsData | HRSaveDataApi |

  Scenario Outline: HRIS, User is able to save user access details
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status | Description         | payload            | api           |
      | saveUserAccessData | post   | 200             | User access details | saveUserAccessData | HRSaveDataApi |

  Scenario Outline: HRIS, User is able to add skills mail
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | Description     | payload       | api           |
      | addSkillsMail | post   | 200             | Add Skills Mail | addSkillsMail | HRSaveDataApi |

  Scenario Outline: HRIS, User is able to send mail manually
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description        | payload     | api           |
      | triggerMail | post   | 200             | Send Mail Manually | triggerMail | HRSaveDataApi |

#---
 # BotAutomate
  Scenario Outline: Get Bot Chat data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description       | payload        | api              |
      | getBotChatData | post   | 200             | Get Bot Chat data | getBotChatData | botAutomationApi |

  Scenario Outline: Find Bot Chat data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description   | payload        | api              |
      | finBotChatData | post   | 200             | Find Bot Chat | finBotChatData | botAutomationApi |
#--
#Accounts
  Scenario Outline: Get all tax saving data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description             | api             |
      | getTaxSavingAllData | get    | 200             | Get all tax saving data | accountsDataApi |

  Scenario Outline: Tax Saving Bi-Annual
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description          | api             |
      | taxSavingBiAnnual | get    | 200             | Tax Saving Bi-annual | accountsDataApi |

  Scenario Outline: Tax Saving Bi-Annual
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | api             |
      | BiAnnualReminder | get    | 200             | Bi-Annual Reminder | accountsDataApi |

  Scenario Outline: HRIS, User is able to tax saving reminder cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status | Description              | api             |
      | taxSavingReminderCron | get    | 200             | Tax saving reminder cron | accountsDataApi |

  Scenario Outline: HRIS, User is able to set taxSavingOptions to verified
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint             | Method | Expected_status | Description                      | payload              | api             |
      | taxSavingSetVerified | post   | 200             | Set taxSavingOptions to verified | taxSavingSetVerified | accountsDataApi |
#--
#  Training
  Scenario Outline: HRIS, User is able to save training
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description   | payload      | api         |
      | trainingSave | post   | 200             | Save Training | trainingSave | TrainingApi |

  Scenario Outline: Send feedback reminder
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint             | Method | Expected_status | Description            | api         |
      | sendFeedbackReminder | get    | 200             | Send Feedback Reminder | TrainingApi |

  Scenario Outline: Get all training gap form data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint               | Method | Expected_status | Description                    | api         |
      | getTrainingGapFormData | get    | 200             | Get All Training Gap Form Data | TrainingApi |

  Scenario Outline: Get training skills data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description              | api         |
      | getTrainingSkills | get    | 200             | Get Training Skills Data | TrainingApi |

  Scenario Outline: Send training gap mail
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint               | Method | Expected_status | Description            | api         |
      | trainingGapMailTrigger | get    | 200             | Send Training Gap Mail | TrainingApi |

  Scenario Outline: Get training count
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | api         |
      | getTrainingCount | get    | 200             | Get Training Count | TrainingApi |

  Scenario Outline: Get training
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description  | api         |
      | getTraining | get    | 200             | Get Training | TrainingApi |

  Scenario Outline: Save training gap analysis form
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description            | payload             | api         |
      | saveGapAnalysisForm | post   | 200             | Save Gap Analysis Form | saveGapAnalysisForm | TrainingApi |

  Scenario Outline: HRIS, User is able to send training mail
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | payload          | api         |
      | sendTrainingMail | post   | 200             | send Training Mail | sendTrainingMail | TrainingApi |


# --
