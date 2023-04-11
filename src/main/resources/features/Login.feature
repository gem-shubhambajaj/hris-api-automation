Feature: HRIS API Authentication

#  Background: Authorize to HRIS
#  Given User is able to successfully fetch access token

#  Scenario: test step
#  Given fetch response

 Scenario Outline: API VALIDATION: Login Dashboard Authentication
    Given Set endpoint "<endpoint>" and method "<method>" and payload "<payload>" for Login Dashboard Authentication
    Then Verify dashboard status code <expectedStatus>
    Examples:
      | endpoint | method | expectedStatus | payload |
      | postApi  | post   | 200            | login   |

