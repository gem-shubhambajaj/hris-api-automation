package com.qa.hris.stepdefinitions;

import com.qa.hris.commonutils.Utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.gemini.generic.ui.utils.DriverAction;
import com.qa.hris.commonutils.GlobalVariable;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

public class HRonboardingStep {
    Logger logger = LoggerFactory.getLogger(HRonboardingStep.class);
    int status = 0;

    //setting the endpoint and method for API
    @Given("^Set endpoint and method (.+) and (.+)$")
    public void setEndpointAndMethod(String url, String method) {
        HashMap<String, String> header = new HashMap<String, String>();
        header.put("Authorization",GlobalVariable.token);
        try {
            status = Utils.apiWithoutPayloads(url, method, header, "").getStatus();
            GemTestReporter.addTestStep("Hit the " + url, "API was successfully triggered", STATUS.PASS);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Then("Verify Status code {int}")
    public void verifyStatusCodeExpected_status(Integer Expected)
    {
        Utils.VerifyStatusCode(Expected, status);
    }

    //    @Given("^Set endpoint and method (\\w*) and method (\\w+)$")
//    public void setEndpointAndMethod(String url, String method) {
//        HashMap<String, String> header = new HashMap<String, String>();
     //   header.put("Authorization",GlobalVariable.token);
//        try {
//            status = Utils.apiWithoutPayloads(url, method, header, "").getStatus();
//            GemTestReporter.addTestStep("Hit the " + url, "API was successfully triggered", STATUS.PASS);
//        } catch (Exception e) {
//            logger.info("API was not hit successfully", e);
//            GemTestReporter.addTestStep("Hit the " + url, "API was not successfully triggered", STATUS.FAIL);
//        }
//    }
//    @Then("^Verify status code (.+)$")
//    public void verifyPolicyStatusCodeExpectedStatus(Integer Expected)
//    {
//        Utils.VerifyStatusCode(Expected, status);
//    }

}
