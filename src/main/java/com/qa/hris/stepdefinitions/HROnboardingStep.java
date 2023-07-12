package com.qa.hris.stepdefinitions;

import com.gemini.generic.api.utils.ProjectSampleJson;
import com.gemini.generic.api.utils.Response;
import com.google.gson.JsonElement;
import com.qa.hris.commonutils.Utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.qa.hris.commonutils.GlobalVariable;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

public class HROnboardingStep {
    int status;

    JSONObject jsonObject;

    String getResponse;
    Logger logger = LoggerFactory.getLogger(HROnboardingStep.class);

    //setting the endpoint and method for API
    @Given("Set endpoint and method and Description {string} and {string} and {string} and {string}")
    public void setEndpointAndMethodAndDescription(String url, String method, String Description, String api) {
        JsonElement response;
        try {
            Map<String, String> header = new HashMap<>();
            header.put("Authorization", GlobalVariable.token);
            System.out.println("TOKEN: " + GlobalVariable.token);
            response = Utils.apiWithoutPayloads(url, method, header, Description, api).getResponseBodyJson();
            getResponse = String.valueOf(response);
            status = Integer.parseInt(response.getAsJsonObject().get("statusCode").getAsString().replaceAll("\\[|\\]", ""));
            GemTestReporter.addTestStep("Trigger " + url + " API for " + Description, "API was successfully triggered", STATUS.PASS);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e);
            GemTestReporter.addTestStep("Trigger " + url + " API for " + Description, "API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Then("Verify Status code {int}")
    public void verifyStatusCodeExpectedStatus(int Expected) {
        Utils.verifyStatusCode(Expected, status); //write in try catch
    }

    @Given("Set endpoint and method and Description and payload {string} and {string} and {string} and {string} and {string}")
    public void setParameters(String urlNameConfig, String method, String Description, String payload, String api) {
        jsonObject = Utils.updateDetails(payload);
        HashMap<String, String> header = new HashMap<>();
        header.put("Authorization", GlobalVariable.token);
        String step = "";
        try {
            Response response = Utils.apiWithPayloads(urlNameConfig, method, header, step, jsonObject, api);
            getResponse = String.valueOf(response);
            System.out.println("-----------------------------------------------------------------------------------------------------------------------------------");
            System.out.println(urlNameConfig + "---" + response);
            status = Integer.parseInt(response.getResponseBodyJson().getAsJsonObject().get("statusCode").getAsString().replaceAll("\\[|\\]", ""));
            if (payload.equalsIgnoreCase("save")) {
                GlobalVariable.uid = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("uid").getAsString();
            } else if (payload.equalsIgnoreCase("savetpo")) {
                GlobalVariable.tpoId = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("_id").getAsString();
            } else if (payload.equalsIgnoreCase("saveTaxSavingOptions")) {
                GlobalVariable.taxSaving_emailId = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("email").getAsString();
                JSONObject result = new JSONObject(response.getResponseBody());
                JSONArray taxSavingOptions = result.getJSONObject("data").getJSONArray("taxSavingOptions");
                JSONObject firstOption = taxSavingOptions.getJSONObject(0);
                GlobalVariable.taxSaving_id = firstOption.getString("_id");
            } else if (payload.equalsIgnoreCase("postCertification")) {
                JSONObject result = new JSONObject(response.getResponseBody());
                JSONArray certification = result.getJSONObject("data").getJSONArray("certification");
                JSONObject firstOption = certification.getJSONObject(0);
                GlobalVariable.certificationUid = firstOption.getString("_id");
            }
            else if (payload.equalsIgnoreCase("saveMasterTableData")) {
                GlobalVariable.masterId = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("_id").getAsString();
                GlobalVariable.masterName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("fullName").getAsString();
            }
            GemTestReporter.addTestStep("Trigger " + urlNameConfig + " API for " + Description, "API was successfully triggered", STATUS.PASS);
        } catch (Exception e) {
            logger.info("API was not hit successfully", e); //write for url
            GemTestReporter.addTestStep("Trigger " + urlNameConfig + " API for " + Description, "API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Then("Verify candidate is saved")
    public void verifyCandidateIsSaved() {
        if (getResponse.contains(GlobalVariable.uid)) {
            GemTestReporter.addTestStep("Verify candidate is saved", "Candidate is saved successfully", STATUS.PASS);
        } else {
            GemTestReporter.addTestStep("Verify candidate is saved", "Candidate is not saved successfully", STATUS.FAIL);
        }
    }

    @Then("Verify update response")
    public void verifyUpdateResponse() {
        JSONObject newObject = jsonObject;
        if (getResponse.contains(newObject.getJSONObject("hrSpokes").get("name").toString())){
            GemTestReporter.addTestStep("Verify response contains request payload","Response validated successfully",STATUS.PASS);
        }else {
            GemTestReporter.addTestStep("Verify response contains request payload", "Response not validated successfully", STATUS.FAIL);
        }
    }

    @Then("Verify candidate uploaded document is present")
    public void verifyCandidateUploadedDocumentIsPresent() {
        if (getResponse.contains(GlobalVariable.uid)){
            GemTestReporter.addTestStep("Verify candidate uploaded document is present","Candidate uploaded document is present",STATUS.PASS);
        }else {
            GemTestReporter.addTestStep("Verify candidate uploaded document is present","Candidate uploaded document is not present",STATUS.FAIL);
        }
    }
}
