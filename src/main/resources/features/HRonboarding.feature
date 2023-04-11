Feature: HRIS_API

  Background: API VALIDATION: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

#  getdata
  Scenario Outline: addnew
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | addnew      | get    | 200             |

  Scenario Outline: getallHr
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | getallHr    | get    | 200             |

  Scenario Outline: getRoles
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | getRoles    | get    | 200             |

  Scenario Outline: getDesignation
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status |
      | getDesignation | get    | 200             |

  Scenario Outline: getCandidate
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status |
      | getCandidate | get    | 200             |

  Scenario Outline: getAllCandidate
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status |
      | getAllCandidate | get    | 200             |

  Scenario Outline: getAllUsers
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | getAllUsers | get    | 200             |

  Scenario Outline: getAllCandidateMaster
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status |
      | getAllCandidateMaster | get    | 200             |

  Scenario Outline: getAllTrainingProbationCandidate
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                         | Method | Expected_status |
      | getAllTrainingProbationCandidate | get    | 200             |

  Scenario Outline: getdocumentstobeuploaded
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                 | Method | Expected_status |
      | getdocumentstobeuploaded | get    | 200             |

  Scenario Outline: getCount
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status |
      | getCount | get    | 200             |

  Scenario Outline: getRmDetail
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status |
      | getRmDetail | get    | 200             |

  Scenario Outline: getBuddyDetail
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status |
      | getBuddyDetail    | get    | 200             |

  Scenario Outline: getDataFromMis
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status |
      | getDataFromMis    | get    | 200             |

  Scenario Outline: getadmindetail
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status |
      | getadmindetail    | get    | 200             |

  Scenario Outline: getitdetail
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status |
      | getitdetail    | get    | 200             |

  Scenario Outline: getFeedbackData
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status |
      | getFeedbackData    | get    | 200             |

  Scenario Outline: validateTokenEmployee
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                 | Method | Expected_status |
      | validateTokenEmployee    | get    | 200             |

  Scenario Outline: validatetoken
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status |
      | validatetoken    | get    | 200             |

  Scenario Outline: deleteCandidate
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status |
      | deleteCandidate    | get    | 200             |

  Scenario Outline: getskills
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status |
      | getskills    | get    | 200             |

  Scenario Outline: getEmployeeSkills
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status |
      | getEmployeeSkills  | get    | 200             |

  Scenario Outline: getMISdetail
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status |
      | getMISdetail    | get    | 200             |

  Scenario Outline: getSkillsStatus
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status |
      | getSkillsStatus    | get    | 200             |

  Scenario Outline: getlwfdata
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status |
      | getlwfdata    | get    | 200             |

  Scenario Outline: tpodetails
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status |
      | tpodetails    | get    | 200             |

  Scenario Outline: getAllPermission
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status |
      | getAllPermission   | get    | 200             |

  Scenario Outline: getSystemConfig
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status |
      | getSystemConfig   | get    | 200             |

  Scenario Outline: getTriggerLogs
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status |
      | getTriggerLogs   | get    | 200             |

  Scenario Outline: getMailTemplates
    Given Set endpoint and method <endpoint> and <Method>
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status |
      | getMailTemplates   | get    | 200             |

    #savedata
