Feature: HRIS Automation

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200
    
#HRONBOARDINGSAVEDATA
  Scenario: Save the candidate
    When Set endpoint and method and Description and payload "save" and "post" and "Save Candidate" and "save" and "hrSaveDataApi"
    Then Verify Status code 200
    Then Set endpoint and method and Description "getCandidate" and "get" and "Get data for a candidate" and "hrGetDataApi"
    Then Verify Status code 200
    Then Verify response data for save candidate

  Scenario: Accept the offer letter of candidate
    When Set endpoint and method and Description and payload "save" and "post" and "accept offer" and "acceptOffer" and "hrSaveDataApi"
    Then Verify Status code 200
    Then Validate response data of accept offer letter

  Scenario: Update candidate details
    Given Set endpoint and method and Description and payload "update" and "post" and "Update Candidate Details" and "update" and "hrSaveDataApi"
    Then Verify Status code 200
    Then Set endpoint and method and Description "getCandidate" and "get" and "Get data for a candidate" and "hrGetDataApi"
    Then Verify Status code 200
    Then Verify response data for save candidate

  Scenario Outline: Send bulk joining mails
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail Sent Successfully"
    Examples:
      | endpoint            | Method | Expected_status | Description            | payload             | api           |
      | sendBulkJoiningMail | post   | 200             | Send Bulk Joining Mail | sendBulkJoiningMail | hrSaveDataApi |

  Scenario Outline: Upload documents
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data of upload documents
    Examples:
      | endpoint       | Method | Expected_status | Description      | payload        | api           |
      | uploadDocument | post   | 200             | Upload Documents | uploadDocument | hrSaveDataApi |

  Scenario Outline: Download documents
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data of upload documents
    Examples:
      | endpoint         | Method | Expected_status | Description       | payload          | api           |
      | downloadDocument | post   | 200             | Download Document | downloadDocument | hrSaveDataApi |

  Scenario: Save and get roles
    Given Set endpoint and method and Description and payload "saveRoles" and "post" and "Save Roles" and "saveRoles" and "hrSaveDataApi"
    Then Verify Status code 200
    Then Set endpoint and method and Description "getRoles" and "get" and "Get data for all roles" and "hrGetDataApi"
    Then Verify Status code 200
    Then Validate response data of roles

  Scenario Outline: Add skills mail
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail Sent Successfully"
    Examples:
      | endpoint      | Method | Expected_status | Description     | payload       | api           |
      | addSkillsMail | post   | 200             | Add Skills Mail | addSkillsMail | hrSaveDataApi |

  Scenario Outline: Save skills
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data of save skills
    Examples:
      | endpoint               | Method | Expected_status | Description | payload                | api           |
      | saveEmployeeSkillsData | post   | 200             | Save Skills | saveEmployeeSkillsData | hrSaveDataApi |

  Scenario Outline: Send mail manually
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail Sent"
    Examples:
      | endpoint    | Method | Expected_status | Description        | payload     | api           |
      | triggerMail | post   | 200             | Send Mail Manually | triggerMail | hrSaveDataApi |

  Scenario Outline: Update feedback reminder
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Data created"
    Examples:
      | endpoint               | Method | Expected_status | Description              | payload                | api           |
      | updateFeedbackReminder | post   | 200             | Update Feedback Reminder | updateFeedbackReminder | hrSaveDataApi |

  Scenario Outline: Sync official info
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Synced successfully"
    Examples:
      | endpoint         | Method | Expected_status | Description        | payload          | api           |
      | syncOfficialInfo | post   | 200             | Sync Official Info | syncOfficialInfo | hrSaveDataApi |
  
  Scenario: Save and get tpo details
    Given Set endpoint and method and Description and payload "saveTpo" and "post" and "Save TPO" and "savetpo" and "hrSaveDataApi"
    Then Verify Status code 200
    Then Set endpoint and method and Description "tpoDetails" and "get" and "Get tpo details" and "hrGetDataApi"
    Then Verify Status code 200
    Then Validate response data of tpoDetails
    
  Scenario Outline: Mail to tpo
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail Sent Successfully"
    Examples:
      | endpoint  | Method | Expected_status | Description      | payload   | api           |
      | mailToTpo | post   | 200             | Send Mail To TPO | mailtotpo | hrSaveDataApi |

  Scenario Outline: Update all data
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data for all data update
    Examples:
      | endpoint      | Method | Expected_status | Description     | payload       | api           |
      | allDataUpdate | post   | 200             | Update all Data | allDataUpdate | hrSaveDataApi |

  Scenario Outline: Save user access details
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate data message as "User Roles Updated Successfully"
    Examples:
      | endpoint           | Method | Expected_status | Description         | payload            | api           |
      | saveUserAccessData | post   | 200             | User access details | saveUserAccessData | hrSaveDataApi |

  Scenario Outline: Save system config
    Given Set endpoint and method and Description and payload "saveSystemConfig" and "post" and "Save System Config" and "saveSystemConfig" and "hrSaveDataApi"
    Then Verify Status code <Expected_status>
    Then Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate systemConfig response
    Examples:
      | endpoint        | Method | Expected_status | Description            | api          |
      | getSystemConfig | get    | 200             | Get System Config data | hrGetDataApi |

  Scenario: Save mail templates
    Given Set endpoint and method and Description and payload "saveMailTemplates" and "post" and "Save Mail Templates" and "saveMailTemplates" and "hrSaveDataApi"
    Then Verify Status code 200
    Then Store created id from the response
    Given Set endpoint and method and Description "getMailTemplates" and "get" and "Get mail templates" and "hrGetDataApi"
    Then Verify Status code 200
    Then validate mailTemplate response

  Scenario Outline: Get all skill types
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Skill Types Fetched Successfully"
    Examples:
      | endpoint  | Method | Expected_status | Description         | api          |
      | getSkills | get    | 200             | Get all skill types | hrGetDataApi |

  Scenario Outline: Get employee skills data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Employee Skills Details Fetched Successfully"
    Examples:
      | endpoint          | Method | Expected_status | Description              | api          |
      | getEmployeeSkills | get    | 200             | Get employee skills data | hrGetDataApi |

  Scenario Outline: Get MIS detail of all employees
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "MIS Details Fetched Successfully"
    Examples:
      | endpoint     | Method | Expected_status | Description                     | api          |
      | getMISDetail | get    | 200             | Get MIS detail of all employees | hrGetDataApi |

  Scenario Outline: Get skills mail status
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Skills Mail Status Fetched Successfully"
    Examples:
      | endpoint        | Method | Expected_status | Description            | api          |
      | getSkillsStatus | get    | 200             | Get skills mail status | hrGetDataApi |

  Scenario Outline: Get LWF data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "LWF Data Fetched Successfully"
    Examples:
      | endpoint   | Method | Expected_status | Description  | api          |
      | getLwfData | get    | 200             | Get lwf data | hrGetDataApi |

  Scenario Outline: Get TPO details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "TPO Details Fetched Successfully"
    Examples:
      | endpoint   | Method | Expected_status | Description     | api          |
      | tpoDetails | get    | 200             | Get tpo details | hrGetDataApi |

  Scenario Outline: Get all permission types
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Permission Types Fetched Successfully"
    Examples:
      | endpoint         | Method | Expected_status | Description              | api          |
      | getAllPermission | get    | 200             | Get all permission types | hrGetDataApi |

  Scenario Outline: Get data from MIS
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Data Fetched Successfully from MIS for Status: undefined"
    Examples:
      | endpoint       | Method | Expected_status | Description       | api          |
      | getDataFromMis | get    | 200             | Get data from MIS | hrGetDataApi |

  Scenario Outline: Get data of employees in Administration department
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Admin Details Fetched Successfully"
    Examples:
      | endpoint       | Method | Expected_status | Description                         | api          |
      | getAdminDetail | get    | 200             | Get data of employees in Admin dept | hrGetDataApi |

  Scenario Outline: Get data of employees in IT department
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "IT Department Details Fetched Successfully from MIS"
    Examples:
      | endpoint    | Method | Expected_status | Description                      | api          |
      | getItDetail | get    | 200             | Get data of employees in IT dept | hrGetDataApi |

  Scenario Outline: Delete a candidate through Uid
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description                    | api          |
      | deleteCandidate | get    | 200             | Delete a candidate through Uid | hrGetDataApi |

  Scenario Outline: Get data for new candidate
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Data Fetched Successfully"
    Examples:
      | endpoint | Method | Expected_status | Description                | api          |
      | addNew   | get    | 200             | Get data for new candidate | hrGetDataApi |

  Scenario Outline: Get data for all HRs
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "HR Details Fetched Successfully from MIS"
    Examples:
      | endpoint | Method | Expected_status | Description          | api          |
      | getAllHr | get    | 200             | Get data for all HRs | hrGetDataApi |

  Scenario Outline: Get data for all roles
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Data Fetched"
    Examples:
      | endpoint | Method | Expected_status | Description            | api          |
      | getRoles | get    | 200             | Get data for all roles | hrGetDataApi |

  Scenario Outline: Get data for all candidates
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Data Fetched Successfully for All Candidates"
    Examples:
      | endpoint        | Method | Expected_status | Description                 | api          |
      | getAllCandidate | get    | 200             | Get data for all candidates | hrGetDataApi |

  Scenario Outline: Get data of all users
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "User Data Fetched Successfully"
    Examples:
      | endpoint    | Method | Expected_status | Description           | api          |
      | getAllUsers | get    | 200             | Get data of all users | hrGetDataApi |

  Scenario Outline: Get documents to be uploaded
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Data Fetched Successfully for Documents to be Uploaded"
    Examples:
      | endpoint                 | Method | Expected_status | Description             | api          |
      | getDocumentsToBeUploaded | get    | 200             | Get docs to be uploaded | hrGetDataApi |

  Scenario Outline: Get number of employees in different employee onboarding processes
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Data Count for Onboarding Fetched Successfully"
    Examples:
      | endpoint | Method | Expected_status | Description                                               | api          |
      | getCount | get    | 200             | Get no of employees in diff employee onboarding processes | hrGetDataApi |

  Scenario Outline: Get Reporting Manager data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "RM Data Fetched Successfully from MIS"
    Examples:
      | endpoint    | Method | Expected_status | Description | api          |
      | getRmDetail | get    | 200             | Get RM data | hrGetDataApi |

  Scenario Outline: Get buddy details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Buddy Details Fetched Successfully from MIS"
    Examples:
      | endpoint       | Method | Expected_status | Description       | api          |
      | getBuddyDetail | get    | 200             | Get buddy details | hrGetDataApi |

  Scenario Outline: Get address details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Data Fetched successfully"
    Examples:
      | endpoint          | Method | Expected_status | Description         | api          |
      | getAddressDetails | get    | 200             | Get address details | hrGetDataApi |

  Scenario Outline: Get designation details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Data Fetched successfully"
    Examples:
      | endpoint              | Method | Expected_status | Description             | api          |
      | getDesignationDetails | get    | 200             | Get designation details | hrGetDataApi |

  Scenario Outline: Get tech list
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Data Fetched successfully"
    Examples:
      | endpoint    | Method | Expected_status | Description   | api          |
      | getTechList | get    | 200             | Get tech list | hrGetDataApi |

  Scenario Outline: Get mentor list
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Data Fetched successfully"
    Examples:
      | endpoint      | Method | Expected_status | Description     | api          |
      | getMentorList | get    | 200             | Get mentor list | hrGetDataApi |

  Scenario Outline:Get logs data
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Logs Data Fetched Successfully"
    Examples:
      | endpoint       | Method | Expected_status | Description   | api          |
      | getTriggerLogs | get    | 200             | Get logs data | hrGetDataApi |

# # BotAutomate

##FresherAssignment
  Scenario Outline: HRIS, User is able to upload candidate data
    Given Set endpoint and method and Description and payload "saveBulkCandidateFresherAssign" and "post" and "Upload candidate data" and "uploadCandidateData" and "fresherAssignApi"
    Then Verify Status code <Expected_status>
    Then Store created id from the response
    Then Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Fresher Assignment Data Fetched Successfully"
    Then Validate response data for upload candidate data
    Examples:
      | endpoint                   | Method | Expected_status | Description                 | api              |
      | getCandidatesFresherAssign | get    | 200             | Get fresher assignment data | fresherAssignApi |

  Scenario Outline: HRIS, User is able to send assignment mail
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Mail sent successfully"
    Examples:
      | endpoint           | Method | Expected_status | Description          | payload            | api              |
      | sendAssignmentMail | post   | 200             | Send Assignment Mail | sendAssignmentMail | fresherAssignApi |

  Scenario Outline: HRIS, User is able to upload assignments
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Upload Assignment Data Fetched Successfully"
    Then Validate response data for upload assignments
    Examples:
      | endpoint          | Method | Expected_status | Description        | payload           | api              |
      | uploadAssignments | post   | 200             | Upload Assignments | uploadAssignments | fresherAssignApi |

  Scenario Outline: HRIS, User is able to download assignments
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response message "Download Assignment Data Fetched Successfully"
    Then Validate response data for download assignments
    Examples:
      | endpoint            | Method | Expected_status | Description          | payload             | api              |
      | downloadAssignments | post   | 200             | Download Assignments | downloadAssignments | fresherAssignApi |

    #MasterTable
  Scenario Outline: HRIS, User is able to save Master Table data
    Given Set endpoint and method and Description and payload "saveMasterTableData" and "post" and "Save Master Table Data" and "saveMasterTableData" and "masterTableApi"
    Then Verify Status code <Expected_status>
    Then Store created id from the response
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data for save master table
    Examples:
      | endpoint           | Method | Expected_status | Description           | api            |
      | getMasterTableData | get    | 200             | Get Master Table Data | masterTableApi |

  Scenario Outline: HRIS, User is able to update Master Table data
    Given Set endpoint and method and Description and payload "updateMasterTableData" and "post" and "Update Master Table Data" and "updateMasterTableData" and "masterTableApi"
    Then Verify Status code <Expected_status>
    Then Store created id from the response
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Then Validate response data for update master table
    Examples:
      | endpoint           | Method | Expected_status | Description           | api            |
      | getMasterTableData | get    | 200             | Get Master Table Data | masterTableApi |