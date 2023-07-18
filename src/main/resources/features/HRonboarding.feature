Feature: HRIS_API

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

    #savedata
  Scenario Outline: HRIS, User is able to save the candidate
    When Set endpoint and method and Description and payload "save" and "post" and "Save Candidate" and "save" and "hrSaveDataApi"
    Then Verify Status code 200
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Verify response data for save candidate
    Examples:
      | endpoint     | Method | Expected_status | Description              | api          |
      | getCandidate | get    | 200             | Get data for a candidate | hrGetDataApi |

  Scenario: HRIS, User is able to accept the offer letter of candidate
    When Set endpoint and method and Description and payload "save" and "post" and "accept offer" and "acceptOffer" and "hrSaveDataApi"
    Then Verify Status code 200
    Then Validate response data of accept offer letter
#
  Scenario Outline: HRIS, User is able to update candidate details
    Given Set endpoint and method and Description and payload "update" and "post" and "Update Candidate Details" and "update" and "hrSaveDataApi"
    Then Verify Status code <Expected_status>
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Verify response data for save candidate
    Examples:
      | endpoint     | Method | Expected_status | Description              | api          |
      | getCandidate | get    | 200             | Get data for a candidate | hrGetDataApi |

    #500 issue
  Scenario Outline: HRIS, User is able to save bulk candidates
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description         | payload           | api           |
      | saveBulkCandidate | post   | 200             | Save Bulk Candidate | saveBulkCandidate | hrSaveDataApi |
#500 error in db

  Scenario Outline: HRIS, User is able to send bulk joining mails
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail Sent Successfully"
    Examples:
      | endpoint            | Method | Expected_status | Description            | payload             | api           |
      | sendBulkJoiningMail | post   | 200             | Send Bulk Joining Mail | sendBulkJoiningMail | hrSaveDataApi |

  Scenario Outline: HRIS, User is able to upload documents
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data of upload documents
    Examples:
      | endpoint       | Method | Expected_status | Description      | payload        | api           |
      | uploadDocument | post   | 200             | Upload Documents | uploadDocument | hrSaveDataApi |
#
#  Scenario Outline: HRIS, User is able to get documents to be uploaded
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Then Verify candidate uploaded document is present
#    Examples:
#      | endpoint                 | Method | Expected_status | Description             | api          |
#      | getDocumentsToBeUploaded | get    | 200             | Get docs to be uploaded | hrGetDataApi |
#
  Scenario Outline: HRIS, User is able to download documents
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data of upload documents
    Examples:
      | endpoint         | Method | Expected_status | Description       | payload          | api           |
      | downloadDocument | post   | 200             | Download Document | downloadDocument | hrSaveDataApi |
#
  Scenario Outline: HRIS, User is able to save roles
    Given Set endpoint and method and Description and payload "saveRoles" and "post" and "Save Roles" and "saveRoles" and "hrSaveDataApi"
    Then Verify Status code <Expected_status>
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data of roles
    Examples:
      | endpoint | Method | Expected_status | Description            | api          |
      | getRoles | get    | 200             | Get data for all roles | hrGetDataApi |
##
  Scenario Outline: HRIS, User is able to add skills mail
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail Sent Successfully"
    Examples:
      | endpoint      | Method | Expected_status | Description     | payload       | api           |
      | addSkillsMail | post   | 200             | Add Skills Mail | addSkillsMail | hrSaveDataApi |
##
  Scenario: HRIS, User is able to save skills
    Given Set endpoint and method and Description and payload "saveEmployeeSkillsData" and "post" and "Save Skills" and "saveEmployeeSkillsData" and "hrSaveDataApi"
    Then Verify Status code 200
    Then Validate response data of save skills
##
  Scenario Outline: HRIS, User is able to send mail manually
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail Sent"
    Examples:
      | endpoint    | Method | Expected_status | Description        | payload     | api           |
      | triggerMail | post   | 200             | Send Mail Manually | triggerMail | hrSaveDataApi |
##
  Scenario Outline: HRIS, User is able to update feedback reminder
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Data created"
    Examples:
      | endpoint               | Method | Expected_status | Description              | payload                | api           |
      | updateFeedbackReminder | post   | 200             | Update Feedback Reminder | updateFeedbackReminder | hrSaveDataApi |
#
##Krishan
  Scenario Outline: HRIS, User is able to sync official info
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Synced successfully"
    Examples:
      | endpoint         | Method | Expected_status | Description        | payload          | api           |
      | syncOfficialInfo | post   | 200             | Sync Official Info | syncOfficialInfo | hrSaveDataApi |
##
#  #Krishan
  Scenario Outline: HRIS, User is able to save tpo
    Given Set endpoint and method and Description and payload "saveTpo" and "post" and "Save TPO" and "savetpo" and "hrSaveDataApi"
    Then Verify Status code <Expected_status>
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data of tpoDetails
    Examples:
      | endpoint   | Method | Expected_status | Description     | api          |
      | tpoDetails | get    | 200             | Get tpo details | hrGetDataApi |
#
#    #Krishan
  Scenario Outline: HRIS, User is able to send mail to tpo
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail Sent Successfully"
    Examples:
      | endpoint  | Method | Expected_status | Description      | payload   | api           |
      | mailToTpo | post   | 200             | Send Mail To TPO | mailtotpo | hrSaveDataApi |

# will not run in regression
#  Scenario Outline: HRIS, User is able to send bulk feedback reminder
#    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint             | Method | Expected_status | Description                 | payload              | api           |
#      | bulkFeedbackReminder | post   | 200             | Send Bulk Feedback Reminder | bulkfeedbackreminder | hrSaveDataApi |
##
  Scenario Outline: HRIS, User is able to update all data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data for all data update
    Examples:
      | endpoint      | Method | Expected_status | Description     | payload       | api           |
      | allDataUpdate | post   | 200             | Update all Data | allDataUpdate | hrSaveDataApi |
##done
#
  Scenario Outline: HRIS, User is able to save user access details
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate data message as "User Roles Updated Successfully"
    Examples:
      | endpoint           | Method | Expected_status | Description         | payload            | api           |
      | saveUserAccessData | post   | 200             | User access details | saveUserAccessData | hrSaveDataApi |
##
#   #Krishan
  Scenario Outline: HRIS, User is able to save system config
    Given Set endpoint and method and Description and payload "saveSystemConfig" and "post" and "Save System Config" and "saveSystemConfig" and "hrSaveDataApi"
    Then Verify Status code <Expected_status>
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate systemConfig response
    Examples:
      | endpoint        | Method | Expected_status | Description            | api          |
      | getSystemConfig | get    | 200             | Get System Config data | hrGetDataApi |

#  Scenario Outline: HRIS, User is able to send bulk probation completion letters
#    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint                      | Method | Expected_status | Description                           | payload                       | api           |
#      | bulkProbationCompletionLetter | post   | 200             | Send Bulk Probation Completion Letter | bulkProbationCompletionLetter | hrSaveDataApi |

  #Krishan
  Scenario Outline: HRIS, User is able to save mail templates
    Given Set endpoint and method and Description and payload "saveMailTemplates" and "post" and "Save Mail Templates" and "saveMailTemplates" and "hrSaveDataApi"
    Then Verify Status code <Expected_status>
    Then Store created id from the response
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then validate mailTemplate response
    Examples:
      | endpoint         | Method | Expected_status | Description        | api          |
      | getMailTemplates | get    | 200             | Get mail templates | hrGetDataApi |

##getdata
#
#  #Krishan
#  Scenario Outline: HRIS, User is able to get data for new candidate
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Then Verify candidate is saved
#    Examples:
#      | endpoint | Method | Expected_status | Description                | api          |
#      | addNew   | get    | 200             | Get data for new candidate | hrGetDataApi |
#  Scenario Outline: HRIS, User is able to get data for all candidates
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Then Verify candidate is saved
#    Examples:
#      | endpoint        | Method | Expected_status | Description                 | api          |
#      | getAllCandidate | get    | 200             | Get data for all candidates | hrGetDataApi |
#
#  #Krishan
#  Scenario Outline: HRIS, User is able to get data for all HRs
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint | Method | Expected_status | Description          | api          |
#      | getAllHr | get    | 200             | Get data for all HRs | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get data for all roles
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint | Method | Expected_status | Description            | api          |
#      | getRoles | get    | 200             | Get data for all roles | hrGetDataApi |

  #notInUse
#  Scenario Outline: HRIS, User is able to get data for a designation
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | Method | Expected_status | Description                | api          |
#      | getDesignation | get    | 200             | Get data for a designation | hrGetDataApi |

    #remove
#  Scenario Outline: HRIS, User is able to get data for a candidate
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint     | Method | Expected_status | Description              | api          |
#      | getCandidate | get    | 200             | Get data for a candidate | hrGetDataApi |
#
#    #Krishan
#
##    #Krishan
#  Scenario Outline: HRIS, User is able to get data of all users
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint    | Method | Expected_status | Description           | api          |
#      | getAllUsers | get    | 200             | Get data of all users | hrGetDataApi |
#
#  Scenario Outline: HRIS, User is able to get all candidates
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint              | Method | Expected_status | Description        | api          |
#      | getAllCandidateMaster | get    | 200             | Get all candidates | hrGetDataApi |
#
#  Scenario Outline: HRIS, User is able to get data for training probation candidate
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint                         | Method | Expected_status | Description                               | api          |
#      | getAllTrainingProbationCandidate | get    | 200             | Get data for training probation candidate | hrGetDataApi |
#
#    #Krishan
#
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get number of employees in different employee onboarding processes
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint | Method | Expected_status | Description                                               | api          |
#      | getCount | get    | 200             | Get no of employees in diff employee onboarding processes | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get Reporting Manager data
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint    | Method | Expected_status | Description | api          |
#      | getRmDetail | get    | 200             | Get RM data | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get buddy details
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | Method | Expected_status | Description       | api          |
#      | getBuddyDetail | get    | 200             | Get buddy details | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get data from MIS
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | Method | Expected_status | Description       | api          |
#      | getDataFromMis | get    | 200             | Get data from MIS | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get data of employees in Administration department
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | Method | Expected_status | Description                         | api          |
#      | getAdminDetail | get    | 200             | Get data of employees in Admin dept | hrGetDataApi |
#
#  #Krishan
#  Scenario Outline: HRIS, User is able to get data of employees in IT department
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint    | Method | Expected_status | Description                      | api          |
#      | getItDetail | get    | 200             | Get data of employees in IT dept | hrGetDataApi |
##
#  #Krishan
#  Scenario Outline: HRIS, User is able to get feedback data
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint        | Method | Expected_status | Description       | api          |
#      | getFeedbackData | get    | 200             | Get feedback data | hrGetDataApi |
#
#  Scenario Outline: HRIS, User is able to get data of employee from token
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint              | Method | Expected_status | Description                     | api          |
#      | validateTokenEmployee | get    | 200             | Get data of employee from token | hrGetDataApi |
#
#  Scenario Outline: HRIS, User is able to get data from token
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint      | Method | Expected_status | Description         | api          |
#      | validateToken | get    | 200             | Get data from token | hrGetDataApi |
##
#  Scenario Outline: HRIS, User is able to delete a candidate of Uid
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint        | Method | Expected_status | Description               | api          |
#      | deleteCandidate | get    | 200             | Delete a candidate of Uid | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get all skill types
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint  | Method | Expected_status | Description         | api          |
#      | getSkills | get    | 200             | Get all skill types | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get employee skills data
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint          | Method | Expected_status | Description              | api          |
#      | getEmployeeSkills | get    | 200             | Get employee skills data | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get MIS detail of all employees
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint     | Method | Expected_status | Description                     | api          |
#      | getMISDetail | get    | 200             | Get MIS detail of all employees | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get skills mail status
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint        | Method | Expected_status | Description            | api          |
#      | getSkillsStatus | get    | 200             | Get skills mail status | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get lwf data
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint   | Method | Expected_status | Description  | api          |
#      | getLwfData | get    | 200             | Get lwf data | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get tpo details
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint   | Method | Expected_status | Description     | api          |
#      | tpoDetails | get    | 200             | Get tpo details | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get all permission types
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint         | Method | Expected_status | Description              | api          |
#      | getAllPermission | get    | 200             | Get all permission types | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get address details
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint          | Method | Expected_status | Description         | api          |
#      | getAddressDetails | get    | 200             | Get address details | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get designation details
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint              | Method | Expected_status | Description             | api          |
#      | getDesignationDetails | get    | 200             | Get designation details | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get tech list
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint    | Method | Expected_status | Description   | api          |
#      | getTechList | get    | 200             | Get tech list | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get mentor list
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint      | Method | Expected_status | Description     | api          |
#      | getMentorList | get    | 200             | Get mentor list | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get System Configuration data
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint        | Method | Expected_status | Description            | api          |
#      | getSystemConfig | get    | 200             | Get System Config data | hrGetDataApi |
#
#    #Krishan
#  Scenario Outline: HRIS, User is able to get logs data
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint       | Method | Expected_status | Description   | api          |
#      | getTriggerLogs | get    | 200             | Get logs data | hrGetDataApi |
##
#    #Krishan
#  Scenario Outline: HRIS, User is able to get mail templates
#    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
#    Then Verify Status code <Expected_status>
#    Examples:
#      | endpoint         | Method | Expected_status | Description        | api          |
#      | getMailTemplates | get    | 200             | Get mail templates | hrGetDataApi |
##
#
