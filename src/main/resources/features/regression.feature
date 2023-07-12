Feature: HRIS Automation

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

#HRonboardSaveData
  Scenario: HRIS, User is able to save the candidate
    When Set endpoint and method and Description and payload "save" and "post" and "Save Candidate" and "save" and "HRSaveDataApi"
    Then Verify Status code 200

  Scenario: HRIS, User is able to accept offer the candidate
    When Set endpoint and method and Description and payload "save" and "post" and "accept offer" and "acceptOffer" and "HRSaveDataApi"
    Then Verify Status code 200

  Scenario Outline: HRIS, User is able to update candidate details
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description              | payload | api           |
      | update   | post   | 200             | Update Candidate Details | update  | HRSaveDataApi |

    #500 issue
  Scenario Outline: HRIS, User is able to save bulk candidates
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description         | payload           | api           |
      | saveBulkCandidate | post   | 200             | Save Bulk Candidate | saveBulkCandidate | HRSaveDataApi |
##500 error in db

  #showing Null
  Scenario Outline: HRIS, User is able to send bulk joining mails
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description            | payload             | api           |
      | sendBulkJoiningMail | post   | 200             | Send Bulk Joining Mail | sendBulkJoiningMail | HRSaveDataApi |
#  {"statusCode":"[502]","message":"Mail Sending Failed","data":[]} -- Swagger response body is "null"

  Scenario Outline: HRIS, User is able to upload documents
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description      | payload        | api           |
      | uploadDocument | post   | 200             | Upload Documents | uploadDocument | HRSaveDataApi |

  Scenario Outline: HRIS, User is able to download documents
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description       | payload          | api           |
      | downloadDocument | post   | 200             | Download Document | downloadDocument | HRSaveDataApi |

  Scenario Outline: HRIS, User is able to save roles
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | Description | payload   | api           |
      | saveRoles | post   | 200             | Save Roles  | saveRoles | HRSaveDataApi |
#
  Scenario Outline: HRIS, User is able to add skills mail
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | Description     | payload       | api           |
      | addSkillsMail | post   | 200             | Add Skills Mail | addSkillsMail | HRSaveDataApi |
#
  Scenario Outline: HRIS, User is able to save skills
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint               | Method | Expected_status | Description | payload                | api           |
      | saveEmployeeSkillsData | post   | 200             | Save Skills | saveEmployeeSkillsData | HRSaveDataApi |
#
  Scenario Outline: HRIS, User is able to send mail manually
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description        | payload     | api           |
      | triggerMail | post   | 200             | Send Mail Manually | triggerMail | HRSaveDataApi |
#
  Scenario Outline: HRIS, User is able to update feedback reminder
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint               | Method | Expected_status | Description              | payload                | api           |
      | updateFeedbackReminder | post   | 200             | Update Feedback Reminder | updateFeedbackReminder | HRSaveDataApi |

#Krishan
  Scenario Outline: HRIS, User is able to sync official info
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | payload          | api           |
      | syncOfficialInfo | post   | 200             | Sync Official Info | syncOfficialInfo | HRSaveDataApi |
#
  #Krishan
  Scenario Outline: HRIS, User is able to save tpo
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description | payload | api           |
      | saveTpo  | post   | 200             | Save TPO    | savetpo | HRSaveDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to send mail to tpo
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | Description      | payload   | api           |
      | mailToTpo | post   | 200             | Send Mail To TPO | mailtotpo | HRSaveDataApi |

  Scenario Outline: HRIS, User is able to send bulk feedback reminder
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint             | Method | Expected_status | Description                 | payload              | api           |
      | bulkFeedbackReminder | post   | 200             | Send Bulk Feedback Reminder | bulkfeedbackreminder | HRSaveDataApi |
#
  Scenario Outline: HRIS, User is able to update all data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | Description     | payload       | api           |
      | allDataUpdate | post   | 200             | Update all Data | allDataUpdate | HRSaveDataApi |
##done
#
  Scenario Outline: HRIS, User is able to save user access details
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status | Description         | payload            | api           |
      | saveUserAccessData | post   | 200             | User access details | saveUserAccessData | HRSaveDataApi |
#
   #Krishan
  Scenario Outline: HRIS, User is able to save system config
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | payload          | api           |
      | saveSystemConfig | post   | 200             | Save System Config | saveSystemConfig | HRSaveDataApi |
#not in use
#  Scenario Outline: HRIS, User is able to trigger logger
#    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint      | Method | Expected_status | Description    | payload       | api           |
#      | triggerLogger | post   | 200             | Trigger Logger | triggerLogger | HRSaveDataApi |

  Scenario Outline: HRIS, User is able to send bulk probation completion letters
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                      | Method | Expected_status | Description                           | payload                       | api           |
      | bulkProbationCompletionLetter | post   | 200             | Send Bulk Probation Completion Letter | bulkProbationCompletionLetter | HRSaveDataApi |

  #Krishan
  Scenario Outline: HRIS, User is able to save mail templates
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description         | payload           | api           |
      | saveMailTemplates | post   | 200             | Save Mail Templates | saveMailTemplates | HRSaveDataApi |

#HROnboardingGetData
  #Krishan
  Scenario Outline: HRIS, User is able to get data for new candidate
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description                | api          |
      | addNew   | get    | 200             | Get data for new candidate | HRGetDataApi |

  #Krishan
  Scenario Outline: HRIS, User is able to get data for all HRs
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description          | api          |
      | getAllHr | get    | 200             | Get data for all HRs | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get data for all roles
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description            | api          |
      | getRoles | get    | 200             | Get data for all roles | HRGetDataApi |

    #todo
  Scenario Outline: HRIS, User is able to get data for a candidate
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description              | api          |
      | getCandidate | get    | 200             | Get data for a candidate | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get data for all candidates
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description                 | api          |
      | getAllCandidate | get    | 200             | Get data for all candidates | HRGetDataApi |

#    #Krishan
  Scenario Outline: HRIS, User is able to get data of all users
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description           | api          |
      | getAllUsers | get    | 200             | Get data of all users | HRGetDataApi |

  Scenario Outline: HRIS, User is able to get all candidates
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status | Description        | api          |
      | getAllCandidateMaster | get    | 200             | Get all candidates | HRGetDataApi |

  Scenario Outline: HRIS, User is able to get data for training probation candidate
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                         | Method | Expected_status | Description                               | api          |
      | getAllTrainingProbationCandidate | get    | 200             | Get data for training probation candidate | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get documents to be uploaded
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                 | Method | Expected_status | Description             | api          |
      | getDocumentsToBeUploaded | get    | 200             | Get docs to be uploaded | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get number of employees in different employee onboarding processes
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description                                               | api          |
      | getCount | get    | 200             | Get no of employees in diff employee onboarding processes | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get Reporting Manager data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description | api          |
      | getRmDetail | get    | 200             | Get RM data | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get buddy details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description       | api          |
      | getBuddyDetail | get    | 200             | Get buddy details | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get data from MIS
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description       | api          |
      | getDataFromMis | get    | 200             | Get data from MIS | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get data of employees in Administration department
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description                         | api          |
      | getAdminDetail | get    | 200             | Get data of employees in Admin dept | HRGetDataApi |

  #Krishan
  Scenario Outline: HRIS, User is able to get data of employees in IT department
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description                      | api          |
      | getItDetail | get    | 200             | Get data of employees in IT dept | HRGetDataApi |
#
  #Krishan
  Scenario Outline: HRIS, User is able to get feedback data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description       | api          |
      | getFeedbackData | get    | 200             | Get feedback data | HRGetDataApi |

  Scenario Outline: HRIS, User is able to get data of employee from token
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status | Description                     | api          |
      | validateTokenEmployee | get    | 200             | Get data of employee from token | HRGetDataApi |

  Scenario Outline: HRIS, User is able to get data from token
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | Description         | api          |
      | validateToken | get    | 200             | Get data from token | HRGetDataApi |

  Scenario Outline: HRIS, User is able to delete a candidate of Uid
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description               | api          |
      | deleteCandidate | get    | 200             | Delete a candidate of Uid | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get all skill types
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | Description         | api          |
      | getSkills | get    | 200             | Get all skill types | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get employee skills data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description              | api          |
      | getEmployeeSkills | get    | 200             | Get employee skills data | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get MIS detail of all employees
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description                     | api          |
      | getMISDetail | get    | 200             | Get MIS detail of all employees | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get skills mail status
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description            | api          |
      | getSkillsStatus | get    | 200             | Get skills mail status | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get lwf data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | Description  | api          |
      | getLwfData | get    | 200             | Get lwf data | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get tpo details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | Description     | api          |
      | tpoDetails | get    | 200             | Get tpo details | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get all permission types
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description              | api          |
      | getAllPermission | get    | 200             | Get all permission types | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get address details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description              | api          |
      | getAddressDetails | get    | 200             | Get address details | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get designation details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description              | api          |
      | getDesignationDetails | get    | 200             | Get designation details | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get tech list
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description              | api          |
      | getTechList | get    | 200             | Get tech list | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get mentor list
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description              | api          |
      | getMentorList | get    | 200             | Get mentor list | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get System Configuration data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description            | api          |
      | getSystemConfig | get    | 200             | Get System Config data | HRGetDataApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get logs data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description   | api          |
      | getTriggerLogs | get    | 200             | Get logs data | HRGetDataApi |
#
    #Krishan
  Scenario Outline: HRIS, User is able to get mail templates
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | api          |
      | getMailTemplates | get    | 200             | Get mail templates | HRGetDataApi |

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

  Scenario Outline: HRIS, User is able to set Bot Context
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | Description        | payload       | api              |
      | botContextSet | post   | 200             | Set Context of bot | botContextSet | botAutomationApi |
#--
#Accounts
  Scenario Outline: HRIS, User is able to save tax saving options
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint             | Method | Expected_status | Description             | payload              | api             |
      | saveTaxSavingOptions | post   | 200             | Save tax saving options | saveTaxSavingOptions | accountsDataApi |

  Scenario Outline: HRIS, User is able to set taxSavingOptions to verified
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint             | Method | Expected_status | Description                      | payload              | api             |
      | taxSavingSetVerified | post   | 200             | Set taxSavingOptions to verified | taxSavingSetVerified | accountsDataApi |

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

  Scenario Outline: Bi-Annual reminder
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

##--
#  Training
  Scenario Outline: HRIS, User is able to save training
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description   | payload      | api         |
      | trainingSave | post   | 200             | Save Training | trainingSave | TrainingApi |

#Krishan
  Scenario Outline: HRIS, User is able to get data for training probation candidate
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                         | Method | Expected_status | Description                               | api          |
      | getAllTrainingProbationCandidate | get    | 200             | Get data for training probation candidate | HRGetDataApi |

  Scenario Outline: HRIS, User is able to send feedback reminder
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
#Certification
  Scenario Outline: User Authentication
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description         | payload  | api              |
      | userAuth | post   | 200             | User Authentication | userAuth | certificationApi |

  Scenario Outline: HRIS, User is able to post certification reminder mail
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status | Description                      | payload               | api              |
      | certificationReminder | post   | 200             | Post certification reminder mail | certificationReminder | certificationApi |


  Scenario Outline: Get certifications
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description        | api              |
      | getCertificate | get    | 200             | Get certifications | certificationApi |

  Scenario Outline: Get certifications type
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status | Description           | api              |
      | GetCertificationsType | get    | 200             | GetCertificationsType | certificationApi |

  Scenario Outline: Get employees details from MIS
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint             | Method | Expected_status | Description                    | api              |
      | getEmployeeDetailMIS | get    | 200             | Get employees details from MIS | certificationApi |

  Scenario Outline: Get certifications by time
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint               | Method | Expected_status | Description                | api              |
      | getCertificationByTime | get    | 200             | Get certifications by time | certificationApi |

  Scenario Outline: Get technology details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description            | api              |
      | getTechDetails | get    | 200             | Get Technology Details | certificationApi |

  Scenario Outline: Get certifications mail status
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                   | Method | Expected_status | Description                    | api              |
      | getCertificationMailStatus | get    | 200             | Get certifications Mail status | certificationApi |

  Scenario Outline: HRIS, User is able to get certificate download Url
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                  | Method | Expected_status | Description                  | payload                   | api              |
      | getCertificateDownloadURL | post   | 200             | Get Certificate Download Url | getCertificateDownloadURL | certificationApi |

  Scenario Outline: HRIS, User is able to get certificate upload URL
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                | Method | Expected_status | Description                | payload                 | api              |
      | getCertificateUploadURL | post   | 200             | Get Certificate Upload URL | getCertificateUploadURL | certificationApi |

  Scenario Outline: HRIS, User is able to generate certificate
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description          | api              |
      | generateCertificate | get    | 200             | Generate Certificate | certificationApi |

  Scenario Outline: HRIS, User is able to get employees by manager
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description              | payload      | api              |
      | getEmployees | post   | 200             | Get employees by manager | getEmployees | certificationApi |

  Scenario Outline: HRIS, User is able to get certifications of employee
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                 | Method | Expected_status | Description                    | api              |
      | getCertificationEmployee | get    | 200             | Get certifications of employee | certificationApi |

  Scenario Outline: HRIS, User is able to get management for certifications
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                   | Method | Expected_status | Description                       | api              |
      | getManagementCertification | get    | 200             | Get management for certifications | certificationApi |

  Scenario Outline: HRIS, User is able to generate certificate from JSON
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status | Description                    | payload            | api              |
      | getCertificateJSON | post   | 200             | Generate certificate from JSON | getCertificateJSON | certificationApi |

  Scenario Outline: HRIS, User is able to get employees by manager
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description              | payload      | api              |
      | getEmployees | post   | 200             | Get employees by manager | getEmployees | certificationApi |

#HROnboardCron
  Scenario Outline: HRIS, Hiring Manager Reminder
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status | Description             | api              |
      | hiringManagerReminder | get    | 200             | Hiring Manager Reminder | HRonboardCronApi |

  Scenario Outline: HRIS, Hiring Flyer
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description  | api              |
      | hiringFlyer | get    | 200             | Hiring Flyer | HRonboardCronApi |

  Scenario Outline: HRIS, User is able to update LWF Data Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | Description          | api              |
      | updateLWFCron | get    | 200             | update LWF Data Cron | HRonboardCronApi |

  Scenario Outline: HRIS, mis Sync Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description   | api              |
      | syncOfficialInfo | get    | 200             | mis Sync Cron | HRonboardCronApi |

  Scenario Outline: HRIS, tnp Report Last Month Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint               | Method | Expected_status | Description                | api              |
      | tnpReportLastMonthCron | get    | 200             | tnp Report Last Month Cron | HRonboardCronApi |

  Scenario Outline: HRIS, Training Probation Report Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                    | Method | Expected_status | Description                    | api              |
      | trainingProbationReportCron | get    | 200             | Training Probation Report Cron | HRonboardCronApi |

  Scenario Outline: HRIS, First Training End Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint             | Method | Expected_status | Description             | api              |
      | firstTrainingEndCron | get    | 200             | First Training End Cron | HRonboardCronApi |

  Scenario Outline: HRIS, Training End Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description       | api              |
      | trainingEndCron | get    | 200             | Training End Cron | HRonboardCronApi |

  Scenario Outline: HRIS, Probation End Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | api              |
      | probationEndCron | get    | 200             | Probation End Cron | HRonboardCronApi |

  Scenario Outline: HRIS, Welcome Mail Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description       | api              |
      | welcomeMailCron | get    | 200             | Welcome Mail Cron | HRonboardCronApi |

#ExitAutomation
  Scenario Outline: HRIS, User is able to save Resignation data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<url>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description           | payload             | url               |
      | saveResignationData | post   | 200             | Save Resignation Data | saveResignationData | ExitAutomationApi |

  Scenario Outline: HRIS, User is able to get Resignation data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status | Description          | api               |
      | getResignationData | get    | 200             | get Resignation Data | ExitAutomationApi |


  Scenario Outline: HRIS, User is able to send Reminder
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description   | api               |
      | sendReminder | post   | 200             | Send Reminder | ExitAutomationApi |

  Scenario Outline: HRIS, User is able to revoke Resignation
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<url>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description        | payload           | url               |
      | save     | post   | 200             | revoke Resignation | revokeResignation | ExitAutomationApi |

#FresherAssignment
     #Krishan
  Scenario Outline: HRIS, User is able to upload candidate data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                       | Method | Expected_status | Description           | payload             | api              |
      | saveBulkCandidateFresherAssign | post   | 200             | Upload candidate data | uploadCandidateData | fresherAssignApi |

    #Krishan
  Scenario Outline: HRIS, User is able to send assignment mail
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status | Description          | payload            | api              |
      | sendAssignmentMail | post   | 200             | Send Assignment Mail | sendAssignmentMail | fresherAssignApi |

    #Krishan
  Scenario Outline: HRIS, User is able to upload assignments
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description        | payload           | api              |
      | uploadAssignments | post   | 200             | Upload Assignments | uploadAssignments | fresherAssignApi |

    #Krishan
  Scenario Outline: HRIS, User is able to download assignments
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description          | payload             | api              |
      | downloadAssignments | post   | 200             | Download Assignments | downloadAssignments | fresherAssignApi |

    #Krishan
  Scenario Outline: HRIS, User is able to get fresher assignment data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                   | Method | Expected_status | Description                 | api              |
      | getCandidatesFresherAssign | get    | 200             | Get fresher assignment data | fresherAssignApi |

