package com.qa.hris.stepdefinitions;

import com.gemini.generic.api.utils.Response;
import com.qa.hris.commonutils.Utils;
import io.cucumber.java.en.And;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import org.apache.commons.codec.binary.Base64;
import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import com.qa.hris.commonutils.GlobalVariable;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import static com.gemini.generic.ui.utils.DriverAction.takeSnapShot;

public class StepDefinition {
    int status;
    Logger logger = LoggerFactory.getLogger(StepDefinition.class);
    Response response;
    String message;
    JSONObject jsonObject, responseJSON, saveResignJSONObject;

    String actualName, expectedName, actualNumber, expectedNumber;

    String actualEmail;

    String expectedEmail;

    String expectedId;

    String actualId;

    ArrayList<String> expectedArrayList = new ArrayList<>();
    ArrayList<String> actualArrayList = new ArrayList<>();

    //setting the endpoint and method for API
    @Given("Set endpoint and method and Description {string} and {string} and {string} and {string}")
    public void setEndpointAndMethodAndDescription(String url, String method, String Description, String api) {
        try {
            Map<String, String> header = new HashMap<>();
            byte[] token = Base64.decodeBase64(GlobalVariable.token);
            header.put("Authorization", new String(token));
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
        byte[] token = Base64.decodeBase64(GlobalVariable.token);
        header.put("Authorization", new String(token));
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
            } else if (payload.equalsIgnoreCase("postCertification")) {
                JSONObject result = new JSONObject(response.getResponseBody());
                JSONArray certification = result.getJSONObject("data").getJSONArray("certification");
                JSONObject firstOption = certification.getJSONObject(0);
                GlobalVariable.certificationUid = firstOption.getString("_id");
            }
            else if (payload.equalsIgnoreCase("saveMasterTableData")) {
                GlobalVariable.id = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("_id").getAsString();
                GlobalVariable.masterName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("fullName").getAsString();
            } else if (payload.equalsIgnoreCase("saveResignationData")) {
                saveResignJSONObject = jsonObject;
            } else if (payload.equalsIgnoreCase("uploadCandidateData")) {
                GlobalVariable.uid = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("_id").getAsString();
                GlobalVariable.id = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("participents").getAsJsonArray().get(0).getAsJsonObject().get("_id").getAsString();
            }
            GemTestReporter.addTestStep("Trigger " + urlNameConfig + " API for " + Description, "API was successfully triggered", STATUS.PASS);
        } catch (Exception e) {
            logger.error("API was not hit successfully", e); //write for url
            GemTestReporter.addTestStep("Trigger " + urlNameConfig + " API for " + Description, "API was not successfully triggered", STATUS.FAIL);
        }
    }

    @Then("Verify update response")
    public void verifyUpdateResponse() {
        try {
            expectedName = jsonObject.getJSONObject("candidateDetails").getJSONObject("name").get("fullName").toString();
            expectedArrayList.add(expectedName);
            actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("updatedRecord").getAsJsonObject().get("candidateDetails").getAsJsonObject().get("name").getAsJsonObject().get("fullName").getAsString();
            actualArrayList.add(actualName);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Validate update response", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Verify candidate uploaded document is present")
    public void verifyCandidateUploadedDocumentIsPresent() {
        try {
            if (response.toString().contains(GlobalVariable.uid)) {
                GemTestReporter.addTestStep("Verify candidate uploaded document is present", "Candidate uploaded document is present", STATUS.PASS);
            } else {
                GemTestReporter.addTestStep("Verify candidate uploaded document is present", "Candidate uploaded document is not present", STATUS.FAIL);
            }
        }catch (Exception e) {
            GemTestReporter.addTestStep("Verify candidate uploaded document is present", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate response message {string}")
    public void validateResponseMsgFor(String responseMessage) {
        try {
            message = response.getResponseBodyJson().getAsJsonObject().get("message").getAsString().replaceAll("\\[|\\]", "");
            if (responseMessage.equalsIgnoreCase(message))
                GemTestReporter.addTestStep("Validate response message", "Successfully validated message", STATUS.PASS);
            else
                GemTestReporter.addTestStep("Validate response message", "Unable to validate message. Expected is '" + responseMessage + "'. Actual is '" + message + "'.", STATUS.FAIL);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Validate response message", "Unable to validate: " + e, STATUS.ERR);
        }

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
            String emailFromResponse = responseJSON.getJSONObject("data").get("email").toString();
            String adhaarFromResponse = responseJSON.getJSONObject("data").get("aadhaarNumber").toString();
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
        try {
            String emailFromJSON = jsonObject.getString("email");
            expectedArrayList.add(emailFromJSON);
            String emailResponse = responseJSON.getJSONObject("data").get("email").toString();
            actualArrayList.add(emailResponse);
            Utils.compareJson(expectedArrayList, actualArrayList);
        } catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate response data of upload documents")
    public void verifyUploadedFileNameIsPresentInResponse() {
        try {
            expectedName = jsonObject.getJSONArray("uploadedDocuments").getJSONObject(0).get("filename").toString();
            expectedArrayList.add(expectedName);
            actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("fileName").getAsString();
            actualArrayList.add(actualName);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Verify response of upload documents", "Unable to validate: " + e, STATUS.ERR);
        }

    }

    @Then("Validate response data of roles")
    public void verifySentNameIsPresentInAPIResponse() {
        try {
            String expectedDescription = jsonObject.get("description").toString();
            String actualDescription = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("description").getAsString();
            expectedName = jsonObject.get("displayName").toString();
            actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("name").getAsString();
            expectedArrayList.add(expectedDescription);
            expectedArrayList.add(expectedName);
            actualArrayList.add(actualDescription);
            actualArrayList.add(actualName);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of roles", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Verify response data for save candidate")
    public void verifyRequestBodyWithResponseBody() {
        try {
            expectedName = jsonObject.getJSONObject("candidateDetails").getJSONObject("name").get("fullName").toString();
            expectedNumber = jsonObject.getJSONObject("candidateDetails").get("primaryContactNumber").toString();
            expectedArrayList.add(expectedName);
            expectedArrayList.add(expectedNumber);
            actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("candidateDetails").getAsJsonObject().get("name").getAsJsonObject().get("fullName").getAsString();
            actualNumber = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("candidateDetails").getAsJsonObject().get("primaryContactNumber").getAsString();
            actualArrayList.add(actualName);
            actualArrayList.add(actualNumber);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }
        catch (Exception e) {
            GemTestReporter.addTestStep("Verify response data for save candidate", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate export URL from response data")
    public void validateExportURLFromResponseData() {
        try {
            String urlFromJSON = response.getResponseBodyJson().getAsJsonObject().get("data").toString();
            if (urlFromJSON.contains("tinyurl"))
                GemTestReporter.addTestStep("Validate export URL from response data", "Successfully validated", STATUS.PASS);
            else
                GemTestReporter.addTestStep("Validate export URL from response data", "Unable to validate", STATUS.FAIL);

        } catch (Exception e) {
            GemTestReporter.addTestStep("Validate export URL from response data", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate certificate user authentication response")
    public void validateCertificateUserAuthenticationResponse() {
        try {
            String emailFromJSON = jsonObject.getString("email");
            String emailFromResponse = responseJSON.getJSONObject("data").getJSONObject("HrDetails").getString("Email");
            String tokenFromResponse = responseJSON.getJSONObject("data").getString("token");
            expectedArrayList.add(emailFromJSON);
            expectedArrayList.add(GlobalVariable.token);
            actualArrayList.add(emailFromResponse);
            actualArrayList.add(tokenFromResponse);
            Utils.compareJson(expectedArrayList, actualArrayList);
        } catch (Exception e) {
            GemTestReporter.addTestStep("Validate Certificate user authentication", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate response of certification reminder mail")
    public void validateResponseOfCertificationReminderMail() {
        try {
            String emailFromJSON = jsonObject.getJSONArray("data").getJSONObject(0).getString("Email");
            expectedName = jsonObject.getJSONArray("data").getJSONObject(0).getString("EmployeeName");
            String emailFromResponse = responseJSON.getJSONArray("data").getJSONObject(0).getString("Email");
            actualName = responseJSON.getJSONArray("data").getJSONObject(0).getString("EmployeeName");
            expectedArrayList.add(emailFromJSON);
            expectedArrayList.add(expectedName);
            actualArrayList.add(emailFromResponse);
            actualArrayList.add(actualName);
            Utils.compareJson(expectedArrayList, actualArrayList);
        } catch (Exception e) {
            GemTestReporter.addTestStep("Validate response of Certification reminder mail", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate response data of certificate download URL")
    public void validateResponseDataOfCertificateDownloadURL() {
        try {
            String filenameFromJSON = jsonObject.getJSONArray("uploadedDocuments").getJSONObject(0).getString("filename");
            String filenameFromResponse = responseJSON.getJSONArray("data").getJSONObject(0).getString("fileName");
            expectedArrayList.add(filenameFromJSON);
            actualArrayList.add(filenameFromResponse);
            Utils.compareJson(expectedArrayList, actualArrayList);
        } catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of certificate download URL", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate response data of certificate upload URL")
    public void validateResponseDataOfCertificateUploadURL() {
        try {
            String filenameFromJSON = jsonObject.getJSONArray("uploadedDocuments").getJSONObject(0).getString("filename");
            String filenameFromResponse = responseJSON.getJSONArray("data").getJSONObject(0).getString("fileName");
            if (filenameFromJSON.contains(filenameFromResponse))
                GemTestReporter.addTestStep("Validate response data of certificate upload URL", "Successfully validated", STATUS.PASS);

        } catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of certificate upload URL", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate response message of get employee by manager")
    public void validateResponseMessageOfGetEmployeeByManager() {
        try {
            String responseMessage = responseJSON.getString("message");
            String managerNameFromJSON = jsonObject.getString("name");
            responseMessage = responseMessage.split(":")[1].trim();
            if (managerNameFromJSON.equalsIgnoreCase(responseMessage))
                GemTestReporter.addTestStep("Validate response message of get employee by manager", "Validated successfully", STATUS.PASS);
        } catch (Exception e) {
            GemTestReporter.addTestStep("Validate response message of get employee by manager", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @And("Validate response data of resignation")
    public void validateResponseDataOfResignation() {
        try {
            String emailFromResponse = responseJSON.getJSONObject("data").getJSONObject("applicantDetails").getString("employeeEmail");
            String emailFromJSON = saveResignJSONObject.getString("email");
            expectedArrayList.add(emailFromJSON);
            actualArrayList.add(emailFromResponse);
            Utils.compareJson(expectedArrayList, actualArrayList);
        } catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of resignation", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @And("Validate revoke resignation response data")
    public void validateRevokeResignationResponseData() {
        try{
            String emailFromResponse = responseJSON.getJSONObject("data").getJSONObject("applicantDetails").getString("employeeEmail");
            String emailFromJSON = saveResignJSONObject.getString("email");
            expectedArrayList.add(emailFromJSON);
            actualArrayList.add(emailFromResponse);
            Utils.compareJson(expectedArrayList,actualArrayList);
        }
        catch(Exception e)
        {
            GemTestReporter.addTestStep("Validate revoke resignation data","Unable to validate: "+e,STATUS.ERR,takeSnapShot());
        }
    }

    @Then("Validate response data of save skills")
    public void verifyPostRequestInPresentInGetResponse() {
        try {
            expectedName = jsonObject.getString("name");
            expectedEmail = jsonObject.getString("email");
            expectedArrayList.add(expectedName);
            expectedArrayList.add(expectedEmail);
            actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("name").getAsString();
            actualEmail = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("email").getAsString();
            actualArrayList.add(actualName);
            actualArrayList.add(actualEmail);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of save skills", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate response data of tpoDetails")
    public void verifyRequestWithGetResponse() {
        try {
            expectedName = jsonObject.getString("tpoName");
            expectedEmail = jsonObject.getString("tpoEmail");
            expectedId = jsonObject.getString("_id");
            expectedArrayList.add(expectedName);
            expectedArrayList.add(expectedEmail);
            expectedArrayList.add(expectedId);
            actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("tpoName").getAsString();
            actualEmail = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("tpoEmail").getAsString();
            actualId = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("_id").getAsString();
            actualArrayList.add(actualName);
            actualArrayList.add(actualEmail);
            actualArrayList.add(actualId);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }
        catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of tpoDetails", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate data message as {string}")
    public void validateDataMessageAs(String responseMessage) {
        try {
            message = response.getResponseBodyJson().getAsJsonObject().get("data").getAsString();
            if (responseMessage.equalsIgnoreCase(message))
                GemTestReporter.addTestStep("Validate response message", "Successfully validated message", STATUS.PASS);
            else
                GemTestReporter.addTestStep("Validate response message", "Unable to validate message. Expected is '" + responseMessage + "'. Actual is '" + message + "'.", STATUS.FAIL);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Verify data message", "Unable to validate: " + e, STATUS.ERR);
        }

    }

    @Then("Validate systemConfig response")
    public void validateSystemConfigResponse() {
        try {
            String expectedMailCc = jsonObject.getJSONArray("mailCc").get(0).toString();
            expectedArrayList.add(expectedMailCc);
            String actualMailCc = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("mailCc").getAsString();
            actualArrayList.add(actualMailCc);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of systemConfig", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Store created id from the response")
    public void storeCreatedIdFromTheResponse() {
        try {
            expectedId = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("_id").getAsString();
        }catch (Exception e) {
            GemTestReporter.addTestStep("Store created id from the response", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("validate mailTemplate response")
    public void validateMailTemplateResponse() {
        try {
            actualId = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("_id").getAsString();
            expectedName = jsonObject.getString("name");
            expectedArrayList.add(expectedId);
            expectedArrayList.add(expectedName);
            actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("name").getAsString();
            actualArrayList.add(actualId);
            actualArrayList.add(actualName);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of mailTemplate", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate response data for all data update")
    public void validateResponseMessageForAllDataUpdate() {
        try {
            expectedId = jsonObject.getString("_id");
            expectedArrayList.add(expectedId);
            actualId = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("updatedRecord").getAsJsonObject().get("_id").getAsString();
            actualArrayList.add(actualId);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of all data", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate response data of accept offer letter")
    public void validateResponseDataOfAcceptOfferLetter() {
        try {
            expectedId = jsonObject.getString("_id");
            expectedArrayList.add(expectedId);
            actualId = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("uid").getAsString();
            actualArrayList.add(actualId);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of accept offer letter", "Unable to validate: " + e, STATUS.ERR);
        }

    }

    @Then("Validate response data for save master table")
    public void validateResponseDataForSaveMasterTable() {
        try {
            expectedName = jsonObject.getString("fullName");
            expectedArrayList.add(expectedId);
            expectedArrayList.add(expectedName);
            actualId = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("_id").getAsString();
            actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("fullName").getAsString();
            actualArrayList.add(actualId);
            actualArrayList.add(actualName);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of save master table", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate response data for update master table")
    public void validateResponseDataForUpdateMasterTable() {
        try {
            expectedNumber = jsonObject.getString("mobile1");
            expectedArrayList.add(expectedId);
            expectedArrayList.add(expectedNumber);
            actualId = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("_id").getAsString();
            actualNumber = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("mobile1").getAsString();
            actualArrayList.add(actualId);
            actualArrayList.add(actualNumber);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of update master table", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate response data for upload candidate data")
    public void validateResponseDataForUploadCandidateData() {
        try {
            expectedArrayList.add(expectedId);
            actualId = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("_id").getAsString();
            actualArrayList.add(actualId);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of upload candidate data", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate response data for upload assignments")
    public void validateResponseDataForUploadAssignments() {
        try {
            expectedName = jsonObject.getJSONArray("uploadedDocuments").getJSONObject(0).getString("filename");
            expectedArrayList.add(expectedName);
            actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("fileName").getAsString();
            actualArrayList.add(actualName);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of upload assignment", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Then("Validate response data for download assignments")
    public void validateResponseDataForDownloadAssignments() {
        try {
            expectedName = jsonObject.getJSONArray("uploadedDocuments").getJSONObject(0).getString("filename");
            expectedArrayList.add(expectedName);
            actualName = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonArray().get(0).getAsJsonObject().get("fileName").getAsString();
            actualArrayList.add(actualName);
            Utils.compareJson(expectedArrayList, actualArrayList);
        }catch (Exception e) {
            GemTestReporter.addTestStep("Validate response data of download assignment", "Unable to validate: " + e, STATUS.ERR);
        }
    }

    @Given("Set endpoint {string} and method {string} and payload {string} for Authentication token Generation")
        public void tokenGeneration(String url, String method, String payload) throws Exception {
           int response = Utils.generateToken(method);
            status = response;
        }
}
