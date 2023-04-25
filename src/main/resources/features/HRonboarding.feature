Feature: HRIS_API

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

#getdata
  Scenario Outline: HRIS, User is able to get data for new candidate
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description                |
      | addNew   | get    | 200             | Get data for new candidate |

  Scenario Outline: HRIS, User is able to get data for all HRs
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description          |
      | getAllHr | get    | 200             | Get data for all HRs |

  Scenario Outline: HRIS, User is able to get data for all roles
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description            |
      | getRoles | get    | 200             | Get data for all roles |

  Scenario Outline: HRIS, User is able to get data for a designation
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description                |
      | getDesignation | get    | 200             | Get data for a designation |

  Scenario Outline: HRIS, User is able to get data for a candidate
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description              |
      | getCandidate | get    | 200             | Get data for a candidate |

  Scenario Outline: HRIS, User is able to get data for all candidates
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description                 |
      | getAllCandidate | get    | 200             | Get data for all candidates |

  Scenario Outline: HRIS, User is able to get data of all users
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description           |
      | getAllUsers | get    | 200             | Get data of all users |

  Scenario Outline: HRIS, User is able to get all candidates
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status | Description        |
      | getAllCandidateMaster | get    | 200             | Get all candidates |

  Scenario Outline: HRIS, User is able to get data for training probation candidate
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                         | Method | Expected_status | Description                               |
      | getAllTrainingProbationCandidate | get    | 200             | Get data for training probation candidate |

  Scenario Outline: HRIS, User is able to get documents to be uploaded
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                 | Method | Expected_status | Description             |
      | getDocumentsToBeUploaded | get    | 200             | Get docs to be uploaded |

  Scenario Outline: HRIS, User is able to get number of employees in different employee onboarding processes
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description                                               |
      | getCount | get    | 200             | Get no of employees in diff employee onboarding processes |

  Scenario Outline: HRIS, User is able to get Reporting Manager data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description |
      | getRmDetail | get    | 200             | Get RM data |

  Scenario Outline: HRIS, User is able to get buddy details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description       |
      | getBuddyDetail | get    | 200             | Get buddy details |

  Scenario Outline: HRIS, User is able to get data from MIS
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description       |
      | getDataFromMis | get    | 200             | Get data from MIS |

  Scenario Outline: HRIS, User is able to get data of employees in Administration department
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description                         |
      | getAdminDetail | get    | 200             | Get data of employees in Admin dept |

  Scenario Outline: HRIS, User is able to get data of employees in IT department
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description                      |
      | getItDetail | get    | 200             | Get data of employees in IT dept |

  Scenario Outline: HRIS, User is able to get feedback data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description       |
      | getFeedbackData | get    | 200             | Get feedback data |

  Scenario Outline: HRIS, User is able to get data of employee from token
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status | Description                     |
      | validateTokenEmployee | get    | 200             | Get data of employee from token |

  Scenario Outline: HRIS, User is able to get data from token
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | Description         |
      | validateToken | get    | 200             | Get data from token |

  Scenario Outline: HRIS, User is able to delete a candidate of Uid
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description               |
      | deleteCandidate | get    | 200             | Delete a candidate of Uid |

  Scenario Outline: HRIS, User is able to get all skill types
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | Description         |
      | getSkills | get    | 200             | Get all skill types |

  Scenario Outline: HRIS, User is able to get employee skills data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description              |
      | getEmployeeSkills | get    | 200             | Get employee skills data |

  Scenario Outline: HRIS, User is able to get MIS detail of all employees
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description                     |
      | getMISDetail | get    | 200             | Get MIS detail of all employees |

  Scenario Outline: HRIS, User is able to get skills mail status
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description            |
      | getSkillsStatus | get    | 200             | Get skills mail status |

  Scenario Outline: HRIS, User is able to get lwf data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | Description  |
      | getLwfData | get    | 200             | Get lwf data |

  Scenario Outline: HRIS, User is able to get tpo details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint   | Method | Expected_status | Description     |
      | tpoDetails | get    | 200             | Get tpo details |

  Scenario Outline: HRIS, User is able to get all permission types
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status | Description |
      | getAllPermission   | get    | 200             | Get all permission types |

  Scenario Outline: HRIS, User is able to get System Configuration data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description |
      | getSystemConfig   | get    | 200             | Get System Config data |

  Scenario Outline: HRIS, User is able to get logs data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description   |
      | getTriggerLogs | get    | 200             | Get logs data |

  Scenario Outline: HRIS, User is able to get mail templates
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        |
      | getMailTemplates | get    | 200             | Get mail templates |

    #savedata
  Scenario Outline: HRIS, User is able to save the candidate
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description    | payload |
      | save     | post    | 200             | Save Candidate | save    |

  Scenario Outline: HRIS, User is able to save bulk candidates
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description         | payload           |
      | saveBulkCandidate | post   | 200             | Save Bulk Candidate | saveBulkCandidate |

  Scenario Outline: HRIS, User is able to send bulk joining mails
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description            | payload             |
      | sendBulkJoiningMail | post   | 200             | Send Bulk Joining Mail | sendBulkJoiningMail |

  Scenario Outline: HRIS, User is able to update candidate details
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status | Description              | payload |
      | update             | post   | 200             | Update Candidate Details | update  |

  Scenario Outline: HRIS, User is able to upload documents
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description      | payload        |
      | uploadDocument | post   | 200             | Upload Documents | uploaddocument |

  Scenario Outline: HRIS, User is able to download documents
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description       | payload          |
      | downloadDocument | post   | 200             | Download Document | downloaddocument |

  Scenario Outline: HRIS, User is able to save roles
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | Description | payload   |
      | saveRoles | post   | 200             | Save Roles  | saveRoles |

  Scenario Outline: HRIS, User is able to add skills mail
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | Description     | payload       |
      | addSkillsMail | post   | 200             | Add Skills Mail | addSkillsMail |

  Scenario Outline: HRIS, User is able to save skills
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint               | Method | Expected_status | Description | payload                |
      | saveEmployeeSkillsData | post   | 200             | Save Skills | saveEmployeeSkillsData |

  Scenario Outline: HRIS, User is able to send mail manually
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description        | payload     |
      | triggerMail | post   | 200             | Send Mail Manually | triggermail |

  Scenario Outline: HRIS, User is able to update feedback reminder
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint               | Method | Expected_status | Description              | payload                |
      | updateFeedbackReminder | post   | 200             | Update Feedback Reminder | updateFeedbackReminder |

  Scenario Outline: HRIS, User is able to sync official info
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | payload          |
      | syncOfficialInfo | post   | 200             | Sync Official Info | syncOfficialInfo |

  Scenario Outline: HRIS, User is able to save tpo
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description | payload |
      | saveTpo  | post   | 200             | Save TPO    | savetpo |

  Scenario Outline: HRIS, User is able to send mail to tpo
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | Description      | payload   |
      | mailToTpo | post   | 200             | Send Mail To TPO | mailtotpo |

  Scenario Outline: HRIS, User is able to send bulk feedback reminder
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint             | Method | Expected_status | Description                 | payload              |
      | bulkFeedbackReminder | post   | 200             | Send Bulk Feedback Reminder | bulkfeedbackreminder |

  Scenario Outline: HRIS, User is able to update all data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | Description     | payload       |
      | allDataUpdate | post   | 200             | Update all Data | allDataUpdate |

  Scenario Outline: HRIS, User is able to save user access details
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status | Description         | payload            |
      | saveUserAccessData | post   | 200             | User access details | saveUserAccessData |

  Scenario Outline: HRIS, User is able to save system config
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | payload          |
      | saveSystemConfig | post   | 200             | Save System Config | saveSystemConfig |

  Scenario Outline: HRIS, User is able to trigger logger
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | Description    | payload       |
      | triggerLogger | post   | 200             | Trigger Logger | triggerLogger |

  Scenario Outline: HRIS, User is able to send bulk probation completion letters
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                      | Method | Expected_status | Description                           | payload                       |
      | bulkProbationCompletionLetter | post   | 200             | Send Bulk Probation Completion Letter | bulkProbationCompletionLetter |

  Scenario Outline: HRIS, User is able to save mail templates
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description         | payload           |
      | saveMailTemplates | post   | 200             | Save Mail Templates | saveMailTemplates |