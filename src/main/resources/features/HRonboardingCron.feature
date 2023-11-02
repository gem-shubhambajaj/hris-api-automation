@reg
Feature: HRIS Automation

  Background: Login Dashboard Authentication
    Given Set endpoint "postApi" and method "post" and payload "login" for Login Dashboard Authentication
    Then Verify dashboard status code 200

  Scenario Outline: schedule
    Given Set endpoint and method and Description and payload "<endpoint>" and "<Method>" and "<Description>" and "<payload>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint  | Method | Expected_status | Description | payload       | api              |
      | scheduler | post   | 200             | Scheduler   | cronScheduler | hrOnboardCronApi |

  Scenario Outline: upload docs mail
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint           | Method | Expected_status | Description           | api              |
      | uploadDocsMailCron | get    | 200             | Upload Docs Mail Cron | hrOnboardCronApi |

  Scenario Outline: HRIS, Welcome Mail Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description       | api              |
      | welcomeMailCron | get    | 200             | Welcome Mail Cron | hrOnboardCronApi |

  Scenario Outline: HRIS, Probation End Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description        | api              |
      | probationEndCron | get    | 200             | Probation End Cron | hrOnboardCronApi |

  Scenario Outline: HRIS, Training End Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint        | Method | Expected_status | Description       | api              |
      | trainingEndCron | get    | 200             | Training End Cron | hrOnboardCronApi |

  Scenario Outline: HRIS, First Training End Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint             | Method | Expected_status | Description             | api              |
      | firstTrainingEndCron | get    | 200             | First Training End Cron | hrOnboardCronApi |

  Scenario Outline: HRIS, Training Probation Report Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint                    | Method | Expected_status | Description                    | api              |
      | trainingProbationReportCron | get    | 200             | Training Probation Report Cron | hrOnboardCronApi |

  Scenario Outline: HRIS, tnp Report Last Month Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint               | Method | Expected_status | Description                | api              |
      | tnpReportLastMonthCron | get    | 200             | tnp Report Last Month Cron | hrOnboardCronApi |

  Scenario Outline: HRIS, mis Sync Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint         | Method | Expected_status | Description   | api              |
      | syncOfficialInfo | get    | 200             | mis Sync Cron | hrOnboardCronApi |

  Scenario Outline: update LWF Data Cron
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint      | Method | Expected_status | Description          | api              |
      | updateLWFCron | get    | 200             | update LWF Data Cron | hrOnboardCronApi |

  Scenario Outline: HRIS, Hiring Flyer
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint    | Method | Expected_status | Description  | api              |
      | hiringFlyer | get    | 200             | Hiring Flyer | hrOnboardCronApi |

  Scenario Outline: HRIS, Hiring Manager Reminder
    Given Set endpoint and method and Description "<endpoint>" and "<Method>" and "<Description>" and "<api>"
    Then Verify Status code <Expected_status>
    Examples:
      | endpoint              | Method | Expected_status | Description             | api              |
      | hiringManagerReminder | get    | 200             | Hiring Manager Reminder | hrOnboardCronApi |