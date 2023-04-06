package com.qa.hris.stepdefinitions;

import com.qa.hris.commonutils.Utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.gemini.generic.ui.utils.DriverAction;
import com.qa.hris.commonutils.GlobalVariable;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class HRonboardingStep {

        package com.qa.hris.stepdefinitions.HRonboardingStep;
            int status = 0;

            //setting the endpoint and method for API
            @Given("Set endpoint and method {string} and {string}")
            public void setEndpointAndMethodAnd(String url, String method) {
                HashMap<String, String> header = new HashMap<String, String>();
//                header.put("", "");
            }
             try {
            status = Utils.apiWithoutPayloads(url, method, header, "").getStatus();
             } catch (Exception exception) {
            logger.info("Error - User not able to hit the API", exception);
            GemTestReporter.addTestStep("Hit API", "User not able to hit the API", STATUS.FAIL);
    }

    @Then("Verify Status code <Expected_status>")
    public void verifyStatusCodeExpected_status() {
        {
            try {
                Utils.verifyStatusCode(Expected, status);
            } catch (Exception exception) {
                logger.info("User not able verify thr API status", exception);
                GemTestReporter.addTestStep("Status Check", "User not able verify thr API status", STATUS.FAIL);
            }
    }

            @Given("^Set the Job endpoint (\\w*) method (\\w*) payload (.*) (.*) and form data$")
            public void setTheJobEndpointEndpointMethodMethodPayloadPayloadKeyPayloadValueAndFormData(String url,
                                                                                                      String method, String keys, String values) {
                List<String> payload_keys = Arrays.asList(keys.split(","));
                List<String> payload_values = Arrays.asList(values.split(","));
                HashMap<String, String> token = new HashMap<String, String>();
                token.put("X-REMOTE-USER-EMAIL", "saru.goyal@geminisolutions.com");
                try {
                    status = Utils.APIWithFormData(url, method, token, "", payload_keys, payload_values);
                } catch (Exception exception) {
                    logger.info("User not able set the form data", exception);
                    GemTestReporter.addTestStep("Form-data", "User not able verify thr form-data", STATUS.FAIL);
                }
            }



}

    }
}
