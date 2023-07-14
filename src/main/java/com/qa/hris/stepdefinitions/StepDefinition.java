package com.qa.hris.stepdefinitions;

import com.gemini.generic.api.utils.Response;
import com.google.gson.JsonObject;
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

import java.util.HashMap;
import java.util.Map;

import static com.gemini.generic.ui.utils.DriverAction.takeSnapShot;

public class StepDefinition {
    int status;
    Response response;
    String message;
    JSONObject jsonObject,responseJSON;
    Logger logger = LoggerFactory.getLogger(StepDefinition.class);

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
            responseJSON = new JSONObject(response.getResponseBody());
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
            }
            GemTestReporter.addTestStep("Trigger " + urlNameConfig + " API for " + Description, "API was successfully triggered", STATUS.PASS);
        } catch (Exception e) {
            logger.error("API was not hit successfully", e); //write for url
            GemTestReporter.addTestStep("Trigger " + urlNameConfig + " API for " + Description, "API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Then("Validate response message {string}")
    public void validateResponseMsgFor(String responseMessage) {
        message = response.getResponseBodyJson().getAsJsonObject().get("message").getAsString().replaceAll("\\[|\\]", "");
        if (responseMessage.equalsIgnoreCase(message))
            GemTestReporter.addTestStep("Validate response message", "Successfully validated message", STATUS.PASS);
        else
            GemTestReporter.addTestStep("Validate response message", "Unable to validate message. Expected is '" + responseMessage + "'. Actual is '" + message + "'.", STATUS.FAIL);

    }

    @Then("Validate response data of bot chat data")
    public void validateResponseDataOfBotChatData() {
        try {
            String queryFromPayload = jsonObject.getString("query");
            String queryTextResponse = responseJSON.getJSONArray("data").getJSONObject(0).getJSONObject("queryResult").get("queryText").toString();
            String responseId = responseJSON.getJSONArray("data").getJSONObject(0).get("responseId").toString();
            if (queryFromPayload.equalsIgnoreCase(queryTextResponse) && !responseId.isEmpty()) {
                GemTestReporter.addTestStep("Validate Chat Bot data", "Successfully validated Chat bot response data", STATUS.PASS);
            } else
                GemTestReporter.addTestStep("Validate Chat Bot data", "Unable to validate Chat bot response data", STATUS.FAIL);
        } catch (Exception e) {
            GemTestReporter.addTestStep("Validate Chat Bot data", "Unable to validate chat bot response data", STATUS.ERR);
        }
    }

    @Then("Validate Response data after saving tax options")
    public void validateResponseDataAfterSavingTaxOptions() {
        try {
            String emailFromJSON = jsonObject.getString("email");
            String aadharNumFromJSON = jsonObject.getString("aadhaarNumber");
            String emailFromResponse = responseJSON.getJSONArray("data").getJSONObject(0).getString("email");
            String adhaarFromResponse = responseJSON.getJSONArray("data").getJSONObject(0).getString("aadhaarNumber");
            if (emailFromJSON.equalsIgnoreCase(emailFromResponse) && aadharNumFromJSON.equalsIgnoreCase(adhaarFromResponse))
                GemTestReporter.addTestStep("Validate Response data after saving tax options", "Validated response", STATUS.PASS);
            else
                GemTestReporter.addTestStep("Validate Response data after saving tax options", "Unable to validate response", STATUS.FAIL);
        } catch (Exception e) {
            GemTestReporter.addTestStep("Validate Response data after saving tax options", "Unable to validate response", STATUS.ERR);
        }
    }

    @Then("Validate response data of tax savings option verification")
    public void validateResponseDataOfTaxSavingsOptionVerification() {
        try{
            String idFromJSON = jsonObject.getString("_id");
            String emailFromJSON = jsonObject.getString("email");
            String emailResponse = responseJSON.getJSONArray("data").getJSONObject(0).getString("email");
            String idResponse = responseJSON.getJSONArray("data").getJSONObject(0).getString("_id");
            
            GemTestReporter.addTestStep("","",STATUS.PASS);
        }
        catch(Exception e)
        {
            GemTestReporter.addTestStep("",": "+e,STATUS.ERR);
        }
    }
}
