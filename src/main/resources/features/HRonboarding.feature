Feature: HRIS_API

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200


    #savedata
  Scenario: HRIS, User is able to save the candidate
    When Set endpoint and method and Description and payload "save" and "post" and "Save Candidate" and "save" and "HRSaveDataApi"
    Then Verify Status code 200


  Scenario Outline: HRIS, User is able to update candidate details
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description              | payload | api           |
      | update   | post   | 200             | Update Candidate Details | update  | HRSaveDataApi |


  Scenario Outline: HRIS, User is able to save bulk candidates
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description         | payload           | api           |
      | saveBulkCandidate | post   | 200             | Save Bulk Candidate | saveBulkCandidate | HRSaveDataApi |
##500 error in db

  Scenario Outline: HRIS, User is able to send bulk joining mails
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description            | payload             | api           |
      | sendBulkJoiningMail | post   | 200             | Send Bulk Joining Mail | sendBulkJoiningMail | HRSaveDataApi |
#  {"statusCode":"[502]","message":"Mail Sending Failed","data":[]} -- Swagger response body is "null"


#
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
#
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

  Scenario Outline: HRIS, User is able to trigger logger
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | Description    | payload       | api           |
      | triggerLogger | post   | 200             | Trigger Logger | triggerLogger | HRSaveDataApi |

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

#getdata

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

  Scenario Outline: HRIS, User is able to get data for a designation
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description                | api          |
      | getDesignation | get    | 200             | Get data for a designation | HRGetDataApi |

  Scenario Outline: HRIS, User is able to get data for a candidate
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description              | api          |
      | getCandidate | get    | 200             | Get data for a candidate | HRGetDataApi |

  Scenario Outline: HRIS, User is able to get data for all candidates
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description                 | api          |
      | getAllCandidate | get    | 200             | Get data for all candidates | HRGetDataApi |

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

  Scenario Outline: HRIS, User is able to get documents to be uploaded
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                 | Method | Expected_status | Description             | api          |
      | getDocumentsToBeUploaded | get    | 200             | Get docs to be uploaded | HRGetDataApi |

  Scenario Outline: HRIS, User is able to get number of employees in different employee onboarding processes
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description                                               | api          |
      | getCount | get    | 200             | Get no of employees in diff employee onboarding processes | HRGetDataApi |

  Scenario Outline: HRIS, User is able to get Reporting Manager data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description | api          |
      | getRmDetail | get    | 200             | Get RM data | HRGetDataApi |

  Scenario Outline: HRIS, User is able to get buddy details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description       | api          |
      | getBuddyDetail | get    | 200             | Get buddy details | HRGetDataApi |

  Scenario Outline: HRIS, User is able to get data from MIS
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description       | api          |
      | getDataFromMis | get    | 200             | Get data from MIS | HRGetDataApi |
#
  Scenario Outline: HRIS, User is able to get data of employees in Administration department
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description                         | api          |
      | getAdminDetail | get    | 200             | Get data of employees in Admin dept | HRGetDataApi |
#
  Scenario Outline: HRIS, User is able to get data of employees in IT department
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description                      | api          |
      | getItDetail | get    | 200             | Get data of employees in IT dept | HRGetDataApi |
#
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
#
  Scenario Outline: HRIS, User is able to get all skill types
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | Description         | api          |
      | getSkills | get    | 200             | Get all skill types | HRGetDataApi |
#
  Scenario Outline: HRIS, User is able to get employee skills data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description              | api          |
      | getEmployeeSkills | get    | 200             | Get employee skills data | HRGetDataApi |
#
  Scenario Outline: HRIS, User is able to get MIS detail of all employees
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description                     | api          |
      | getMISDetail | get    | 200             | Get MIS detail of all employees | HRGetDataApi |

  Scenario Outline: HRIS, User is able to get skills mail status
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description            | api          |
      | getSkillsStatus | get    | 200             | Get skills mail status | HRGetDataApi |
#
  Scenario Outline: HRIS, User is able to get lwf data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | Description  | api          |
      | getLwfData | get    | 200             | Get lwf data | HRGetDataApi |
#
  Scenario Outline: HRIS, User is able to get tpo details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | Description     | api          |
      | tpoDetails | get    | 200             | Get tpo details | HRGetDataApi |
#
  Scenario Outline: HRIS, User is able to get all permission types
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description              | api          |
      | getAllPermission | get    | 200             | Get all permission types | HRGetDataApi |
#
  Scenario Outline: HRIS, User is able to get System Configuration data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description            | api          |
      | getSystemConfig | get    | 200             | Get System Config data | HRGetDataApi |

  Scenario Outline: HRIS, User is able to get logs data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description   | api          |
      | getTriggerLogs | get    | 200             | Get logs data | HRGetDataApi |

  Scenario Outline: HRIS, User is able to get mail templates
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | api          |
      | getMailTemplates | get    | 200             | Get mail templates | HRGetDataApi |


