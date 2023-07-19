Feature: HRIS API Authentication

 Scenario Outline: login successfully in dashboard
    Given Set endpoint "<endpoint>" and method "<method>" and payload "<payload>" for Login Dashboard Authentication
    Then Verify dashboard status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus | payload |
      | postApi  | post   | 200            | login   |

