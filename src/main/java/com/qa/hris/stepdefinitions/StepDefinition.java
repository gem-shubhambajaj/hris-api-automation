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
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class StepDefinition {
    int status;

    JSONObject jsonObject;

    Logger logger = LoggerFactory.getLogger(StepDefinition.class);
    Response response;
    String message;

    String requestData;

    String actualName;

    String expectedName;

    String actualNumber;

    String expectedNumber;

    ArrayList<String> expectedArrayList = new ArrayList<>();

    ArrayList<String> actualArrayList = new ArrayList<>();

    //setting the endpoint and method for API
    @Given("Set endpoint and method and Description {string} and {string} and {string} and {string}")
    public void setEndpointAndMethodAndDescription(String url, String method, String Description, String api) {
        try {
            Map<String, String> header = new HashMap<>();
            header.put("Authorization", GlobalVariable.token);
            response = Utils.apiWithoutPayloads(url, method, header, Description, api);
            status = Integer.parseInt(response.getResponseBodyJson().getAsJsonObject().get("statusCode").getAsString().replaceAll("\\[|\\]", ""));
            GemTestReporter.addTestStep("Trigger " + url + " API for " + Description, "API was successfully triggered", STATUS.PASS);
        } catch (Exception e) {
            logger.error("API was not hit successfully", e);
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
            response = Utils.apiWithPayloads(urlNameConfig, method, header, step, jsonObject, api);
            status = Integer.parseInt(response.getResponseBodyJson().getAsJsonObject().get("statusCode").getAsString().replaceAll("\\[|\\]", ""));
            if (payload.equalsIgnoreCase("save")) {
                GlobalVariable.uid = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("uid").getAsString();
            } else if (payload.equalsIgnoreCase("savetpo")) {
                GlobalVariable.tpoId = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("_id").getAsString();
            } else if (payload.equalsIgnoreCase("saveTaxSavingOptions")) {
                GlobalVariable.taxSavingEmailId = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("email").getAsString();
                JSONObject result = new JSONObject(response.getResponseBody());
                JSONArray taxSavingOptions = result.getJSONObject("data").getJSONArray("taxSavingOptions");
                JSONObject firstOption = taxSavingOptions.getJSONObject(0);
                GlobalVariable.taxSavingId = firstOption.getString("_id");
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
            logger.error("API was not hit successfully", e); //write for url
            GemTestReporter.addTestStep("Trigger " + urlNameConfig + " API for " + Description, "API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Then("Verify candidate is saved")
    public void verifyCandidateIsSaved() {
        response.toString();
    }

    @Then("Verify update response")
    public void verifyUpdateResponse() {
        expectedName = jsonObject.getJSONObject("candidateDetails").getJSONObject("name").get("fullName").toString();
        expectedArrayList.add(expectedName);
        actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("updatedRecord").getAsJsonObject().get("candidateDetails").getAsJsonObject().get("name").getAsJsonObject().get("fullName").getAsString();
        actualArrayList.add(actualName);
        Utils.compareJson(expectedArrayList,actualArrayList);
    }

    @Then("Verify candidate uploaded document is present")
    public void verifyCandidateUploadedDocumentIsPresent() {
        if (response.toString().contains(GlobalVariable.uid)){
            GemTestReporter.addTestStep("Verify candidate uploaded document is present","Candidate uploaded document is present",STATUS.PASS);
        }else {
            GemTestReporter.addTestStep("Verify candidate uploaded document is present","Candidate uploaded document is not present",STATUS.FAIL);
        }
    }

    @Then("Validate response message {string}")
    public void validateResponseMsgFor(String responseMessage) {
        message = response.getResponseBodyJson().getAsJsonObject().get("message").getAsString().replaceAll("\\[|\\]", "");
        if(responseMessage.equalsIgnoreCase(message))
            GemTestReporter.addTestStep("Validate response message","Successfully validated message",STATUS.PASS);
        else
            GemTestReporter.addTestStep("Validate response message","Unable to validate message. Expected is '"+responseMessage+"'. Actual is '"+message+"'.",STATUS.FAIL);

    }

    @Then("Verify uploaded file name is present in response")
    public void verifyUploadedFileNameIsPresentInResponse() {
        expectedName = jsonObject.getJSONArray("uploadedDocuments").getJSONObject(0).get("filename").toString();
        expectedArrayList.add(expectedName);
        actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("fileName").getAsString();
        actualArrayList.add(actualName);
        Utils.compareJson(expectedArrayList,actualArrayList);

    }

    @Then("Verify sent name is present in API response")
    public void verifySentNameIsPresentInAPIResponse() {
        String expectedDescription = jsonObject.get("description").toString();
        String actualDescription = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("description").getAsString();
        expectedName = jsonObject.get("displayName").toString();
        actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("name").getAsString();
        expectedArrayList.add(expectedDescription);
        expectedArrayList.add(expectedName);
        actualArrayList.add(actualDescription);
        actualArrayList.add(actualName);
        Utils.compareJson(expectedArrayList,actualArrayList);
    }

    @Then("Verify request body with response body")
    public void verifyRequestBodyWithResponseBody() {
        expectedName = jsonObject.getJSONObject("candidateDetails").getJSONObject("name").get("fullName").toString();
        expectedNumber = jsonObject.getJSONObject("candidateDetails").get("primaryContactNumber").toString();
        expectedArrayList.add(expectedName);
        expectedArrayList.add(expectedNumber);
        actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("candidateDetails").getAsJsonObject().get("name").getAsJsonObject().get("fullName").getAsString();
        actualNumber = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("candidateDetails").getAsJsonObject().get("primaryContactNumber").getAsString();
        actualArrayList.add(actualName);
        actualArrayList.add(actualNumber);
        Utils.compareJson(expectedArrayList,actualArrayList);
    }
}
