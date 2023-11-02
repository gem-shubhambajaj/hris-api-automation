@reg
Feature: HRIS Automation

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

  Scenario Outline: HRIS, User Authentication
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint | Method | Expected_status | Description         | payload  | api              |
      | userAuth | post   | 200             | User Authentication | userAuth | certificationApi |

  Scenario Outline: HRIS, Update Certification
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description          | payload             | api              |
      | updateCertification | put    | 200             | Update Certification | updateCertification | certificationApi |

  Scenario Outline: HRIS, Post Certification
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description        | payload           | api              |
      | postCertification | post   | 200             | Post Certification | postCertification | certificationApi |

  Scenario Outline: create certification type
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                | Method | Expected_status | Description               | payload           | api              |
      | createCertificationType | post   | 200             | create certification type | certificationType | certificationApi |

  Scenario Outline: post certification reminder mail
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status | Description                      | payload               | api              |
      | certificationReminder | post   | 200             | Post certification reminder mail | certificationReminder | certificationApi |

  Scenario Outline: get employees by manager
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint     | Method | Expected_status | Description              | payload      | api              |
      | getEmployees | post   | 200             | Get employees by manager | getEmployees | certificationApi |

  Scenario Outline: generate certificate from JSON
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status | Description                    | payload            | api              |
      | getCertificateJSON | post   | 200             | Generate certificate from JSON | getCertificateJSON | certificationApi |

  Scenario Outline: get certificate upload URL
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                | Method | Expected_status | Description                | payload                 | api              |
      | getCertificateUploadURL | post   | 200             | Get Certificate Upload URL | getCertificateUploadURL | certificationApi |

  Scenario Outline: get certificate download Url
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                  | Method | Expected_status | Description                  | payload                   | api              |
      | getCertificateDownloadURL | post   | 200             | Get Certificate Download Url | getCertificateDownloadURL | certificationApi |

  Scenario Outline: get certifications
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description        | api              |
      | getCertificate | get    | 200             | Get certifications | certificationApi |

  Scenario Outline: get certifications type
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status | Description           | api              |
      | GetCertificationsType | get    | 200             | GetCertificationsType | certificationApi |

  Scenario Outline: get certifications of employee
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                 | Method | Expected_status | Description                    | api              |
      | getCertificationEmployee | get    | 200             | Get certifications of employee | certificationApi |

  Scenario Outline: get employees details from MIS
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint             | Method | Expected_status | Description                    | api              |
      | getEmployeeDetailMIS | get    | 200             | Get employees details from MIS | certificationApi |

  Scenario Outline: get management for certifications
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                   | Method | Expected_status | Description                       | api              |
      | getManagementCertification | get    | 200             | Get management for certifications | certificationApi |

  Scenario Outline: get certifications by time
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint               | Method | Expected_status | Description                | api              |
      | getCertificationByTime | get    | 200             | Get certifications by time | certificationApi |

  Scenario Outline: HRIS, Team certification reminder
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                  | Method | Expected_status | Description                 | api              |
      | teamCertificationReminder | get    | 200             | Team certification reminder | certificationApi |

  Scenario Outline: get technology details
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint       | Method | Expected_status | Description            | api              |
      | getTechDetails | get    | 200             | Get Technology Details | certificationApi |

  Scenario Outline: generate certificate
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint            | Method | Expected_status | Description          | api              |
      | generateCertificate | get    | 200             | Generate Certificate | certificationApi |

  Scenario Outline: get certifications mail status
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                   | Method | Expected_status | Description                    | api              |
      | getCertificationMailStatus | get    | 200             | Get certifications Mail status | certificationApi |

  Scenario Outline: delete certifications of employee
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint          | Method | Expected_status | Description                    | api              |
      | deleteCertificate | delete | 200             | Get certifications of employee | certificationApi |

