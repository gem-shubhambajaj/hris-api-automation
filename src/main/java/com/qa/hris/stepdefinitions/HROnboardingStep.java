package com.qa.hris.stepdefinitions;

import com.gemini.generic.api.utils.ApiInvocationImpl;
import com.gemini.generic.api.utils.ProjectSampleJson;
import com.gemini.generic.api.utils.Request;
import com.gemini.generic.api.utils.Response;
import com.qa.hris.commonutils.Utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.qa.hris.commonutils.GlobalVariable;

import java.util.HashMap;
import java.util.Map;

public class HROnboardingStep {
    int status;
    Logger logger = LoggerFactory.getLogger(HROnboardingStep.class);

    //setting the endpoint and method for API
    @Given("Set endpoint and method and Description {string} and {string} and {string}")
    public void setEndpointAndMethodAndDescription(String url, String method, String Description) {
        try{
        Map<String, String> header = new HashMap<>();
        header.put("Authorization", GlobalVariable.token);
        System.out.println("TOKEN: " + GlobalVariable.token);
            status=Utils.apiWithoutPayloads(url, method, header, Description).getStatus();
            GemTestReporter.addTestStep("Hit the " + url + " API for " + Description, "API was successfully triggered", STATUS.PASS);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Hit the " + url + " API for " + Description, "API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Then("Verify Status code {int}")
    public void verifyStatusCodeExpectedStatus(int Expected) {
        Utils.verifyStatusCode(Expected, status); //write in try catch
    }

    @Given("Set endpoint and method and Description and payload {string} and {string} and {string} and {string}")
    public void setEndpointAndMethodAndDescriptionAndPayloadEndpointAndMethodAndDescriptionAndPayload(String url, String method, String Description, String payload) throws Exception {
        HashMap<String, String> header = new HashMap<String, String>();
        header.put("Authorization", GlobalVariable.token);
        String step="";
        try {
            status=Utils.apiWithPayloads(url, method, header, step, payload, "").getStatus();
            GemTestReporter.addTestStep("Hit the " + url + " API for " + Description, "API was successfully triggered", STATUS.PASS);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e); //write for url
            GemTestReporter.addTestStep("Hit the " + url + " API for " + Description, "API was not successfully triggered", STATUS.FAIL);
        }
    }

}
