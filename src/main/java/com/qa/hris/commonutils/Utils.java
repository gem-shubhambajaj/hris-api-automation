package com.qa.hris.commonutils;

import com.gemini.generic.api.utils.*;
import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.gemini.generic.tdd.GemjarTestngBase;
import com.gemini.generic.utils.ProjectConfigData;
import io.cucumber.java.en.When;
import org.json.*;
import com.qa.hris.stepdefinitions.StepDefinition;
import org.apache.http.HttpStatus;
import org.json.simple.parser.JSONParser;
import org.testng.Assert;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Map;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Utils extends GemjarTestngBase {
    static Logger logger = LoggerFactory.getLogger(StepDefinition.class);


    public static void verifyStatusCode(int expected, int actual) {
        if (expected == actual) {
            GemTestReporter.addTestStep("Status Verification", "Expected Status :" + expected + ",<br>Actual :" + actual, STATUS.PASS);
        } else {
            GemTestReporter.addTestStep("Status Verification", "Expected Status :" + expected + ",<br>Actual :" + actual, STATUS.FAIL);
        }
    }

    public static String getAuthorization() {
        return Utils.generateAuthToken();
    }

    public static String getUser() {
        return GlobalVariable.user;
    }

    public static String apiCalling() {
        return "https://dleae1blka.execute-api.ap-south-1.amazonaws.com/uat/users/auth";
    }

    public static Response loginUser(String urlNameFromConfig, String method, String sample, String step) {
        Response response = new Response();
        try {
            Request request = new Request();
            String url = ProjectConfigData.getProperty(urlNameFromConfig);
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            if (!step.isEmpty()) {
                request.setStep(step);
            }
//            String payload = ProjectSampleJson.getSampleDataString(sample);
            String filePath = "src/main/resources/login.json";
            String jsonString = new String(Files.readAllBytes(Paths.get(filePath)));
            request.setRequestPayload(jsonString);
            response = ApiInvocation.handleRequest(request);
            System.out.println("Response--------------------------"+response.getResponseBody());
            if (response.getStatus() == HttpStatus.SC_OK) {
                GlobalVariable.token = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("token").getAsString();
            }
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
            if ((response.getResponseBody()) != null) {
                GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
            } else {
                GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
            }
        } catch (Exception e) {
            logger.info("Some Error Occurred", e);
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
        }
        return response;
    }

    public static String generateAuthToken() {
        String authToken;
        Request request = new Request();
        String url = apiCalling();
        GemTestReporter.addTestStep("Url for Auth Request", url, STATUS.INFO);
        request.setURL(url);
        request.setMethod("post");
        request.setRequestPayload("{\n" + "  \"email\": \"shubham.bajaj@geminisolutions.com\",\n" + "  \"_id\": \"\"\n" + "}");
        try {
            Response response = ApiInvocation.handleRequest(request);
            authToken = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("token").getAsString();
            return authToken;
        } catch (Exception e) {
            Assert.fail("Failed to generate Auth token due to exception: " + e);
            return null;
        }
    }

    // check the response
    public static void responseCheck(Response response) {
        if ((response.getResponseBody()) != null) {
            GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
        } else {
            GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
        }
    }

    //send APIwithoutPayload
    public static Response apiWithoutPayloads(String urlNameFromConfig, String method, Map<String, String> headers, String step, String api) {
        Response response = new Response();
        try {
            Request request = new Request();
            String url = null;
            switch (api) {
                case "MasterTableApi": {
                    url = GlobalVariable.baseURL3;
                    break;
                }
                case "HRGetDataApi": {
                    url = GlobalVariable.baseURL1;
                    break;
                }
                case "ExitAutomationApi": {
                    url = GlobalVariable.baseURL4;
                    break;
                }
                case "TrainingApi": {
                    url = GlobalVariable.baseURL6;
                    break;
                }
                case "HRonboardCronApi": {
                    url = GlobalVariable.baseURL7;
                    break;
                }
                case "accountsDataApi": {
                    url = GlobalVariable.baseURL8;
                    break;
                }
                case "fresherAssignApi": {
                    url = GlobalVariable.baseURL9;
                    break;
                }
                case "certificationApi": {
                    url = GlobalVariable.baseURL10;
                    break;
                }
            }
            url += ProjectConfigData.getProperty(urlNameFromConfig);
            switch(urlNameFromConfig){
                case "deleteCandidate":
                case "getCandidate":
                {
                    url = url.replace("{uid}",GlobalVariable.uid);
                    break;
                }
                case "getAllCandidateMaster":
                {
                    url = url.replace("{authToken}",GlobalVariable.token);
                    break;
                }
            }
            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            if (!headers.isEmpty()) {
                request.setHeaders(headers);
            }
            if (!step.isEmpty()) {
                request.setStep(step);
            }
            response = ApiInvocation.handleRequest(request);
            System.out.println();
            System.out.println(urlNameFromConfig + "---" + response.getResponseBody());
            System.out.println();
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Executed Successfully", STATUS.PASS);
            if (step.isEmpty()) {
                GemTestReporter.addTestStep("Message", response.getErrorMessage(), STATUS.INFO);
            }
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
            if ((response.getResponseBody()) != null) {
                GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
            } else {
                GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
            }
        } catch (Exception exception) {
            logger.info("Request didn't Execute Successfully ", exception);
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
        }
        return response;
    }

    //send APIwithPayload
    public static Response apiWithPayloads(String urlNameFromConfig, String method, Map<String, String> headers, String step, JSONObject payloadName, String api) {
        Response response = new Response();
        try {
            Request request = new Request();
            String url = null;
            switch (api) {
                case "MasterTableApi": {
                    url = GlobalVariable.baseURL3;
                    break;
                }
                case "HRSaveDataApi": {
                    url = GlobalVariable.baseURL2;
                    break;
                }
                case "ExitAutomationApi": {
                    url = GlobalVariable.baseURL4;
                    break;
                }
                case "botAutomationApi": {
                    url = GlobalVariable.baseURL5;
                    break;
                }
                case "TrainingApi": {
                    url = GlobalVariable.baseURL6;
                    break;
                }
                case "HRonboardCronApi": {
                    url = GlobalVariable.baseURL7;
                    break;
                }
                case "accountsDataApi": {
                    url = GlobalVariable.baseURL8;
                    break;
                }
                case "fresherAssignApi": {
                    url = GlobalVariable.baseURL9;
                    break;
                }
                case "certificationApi": {
                    url = GlobalVariable.baseURL10;
                    break;
                }
            }
            url += ProjectConfigData.getProperty(urlNameFromConfig);

            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(url);
            request.setMethod(method);
            if (!headers.isEmpty()) {
                request.setHeaders(headers);
            }
            if (!step.isEmpty()) {
                request.setStep(step);
            }
//            String jsonObj = ProjectSampleJson.getSampleDataString(payloadName);
            String jsonObj = payloadName.toString();
            request.setRequestPayload(jsonObj);


            response = ApiInvocation.handleRequest(request);
            System.out.println();
            System.out.println(urlNameFromConfig + "---" + response.getResponseBody());
            System.out.println();
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);

            responseCheck(response);
        } catch (Exception exception) {
            logger.info("Request doesn't Executed Successfully ");
            if ((response.getResponseBody()) != null) {
                GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
            } else {
                GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
            }
        }
        return response;
    }

    public static String generateName() {
        StringBuilder sb = new StringBuilder();
        Random random = new Random();
        for (int i = 0; i < 6; i++) {
            char randomAlphabet = (char) (random.nextInt(26) + 'A');
            sb.append(randomAlphabet);
        }
        System.out.println(sb);
        return sb.toString();
    }

    public static String generatePhoneNumber() {
        Random random = new Random();
        StringBuilder num = new StringBuilder();
        num.append(9);
        for (int i = 0; i < 9; i++) {
            int randomNum = random.nextInt(9);
            num.append(randomNum);
        }
        return num.toString();
    }

    public static JSONObject updateDetails(String payload) {
        JSONObject jsonFile = new JSONObject();
        String filePath = "src/main/resources/" + payload + ".json";
        try {
            String jsonString = new String(Files.readAllBytes(Paths.get(filePath)));
            switch (payload) {
                case "acceptOffer":
                case "updateCertification":
                case "savetpo":
                case "syncOfficialInfo":
                case "userAuth":
                case "triggerMail":
                case "sendTrainingMail":
                case "trainingSave":
                case "downloadDocument":
                case "uploadDocument":
                case "sendBulkJoiningMail":
                case "allDataUpdate": {
                    jsonString = jsonString.replace("{uid}", GlobalVariable.uid);
                    break;
                }
                case "update": {
                    jsonString = jsonString.replace("{uid}", GlobalVariable.uid);
                }
                case "save": {
                    String sb = generateName();
                    System.out.println(sb);
                    String num = generatePhoneNumber();
                    System.out.println(num);
                    jsonString = jsonString.replace("{name}", sb).replace("{email}", sb + "@gmail.com").replace("{number}", num);
                    break;
                }

                case "saveBulkCandidate": {
                    String name1 = generateName();
                    String name2 = generateName();
                    jsonString = jsonString.replace("{name1}", name1).replace("{name2}", name2).replace("{email1}", name1 + "@gmail.com").replace("{email2}", name2 + "@gmail.com");
                    break;
                }
                case "mailtotpo": {
                    jsonString = jsonString.replace("{uid}", GlobalVariable.tpoId);
                    break;
                }
                case "saveTaxSavingOptions": {
                    String name = generateName();
                    String empCode = generateEmpCode();
                    jsonString = jsonString.replace("{name}", name).replace("{code}", empCode);
                    break;
                }
                case "taxSavingSetVerified": {
                    jsonString = jsonString.replace("{email}", GlobalVariable.taxSaving_emailId).replace("{uid}", GlobalVariable.taxSaving_id);
                    break;
                }
                case "saveGapAnalysisForm":{
                    jsonString = jsonString.replace("{num}", generatePhoneNumber());
                    break;
                }
            }
            jsonFile = new JSONObject(jsonString);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return jsonFile;

    }

    public static String generateEmpCode() {
        Random random = new Random();
        StringBuilder num = new StringBuilder();
        for (int i = 0; i < 4; i++) {
            int randomNum = random.nextInt(9);
            num.append(randomNum);
        }
        return num.toString();
    }

    @When("Update name, email and phone number of User in payload {string}")
    public void updateNameEmailAndPhoneNumberOfUserInPayload(String payload) {
        try {
            StringBuilder sb = new StringBuilder();
            Random random = new Random();
            for (int i = 0; i < 6; i++) {
                char randomAlphabet = (char) (random.nextInt(26) + 'A');
                sb.append(randomAlphabet);
            }
            System.out.println(sb);
            StringBuilder num = new StringBuilder();
            for (int i = 0; i < 9; i++) {
                int randomNum = random.nextInt(9);
                num.append("9").append(randomNum);
            }

            System.out.println(num);
            String filePath = "src/main/resources/" + payload + ".json";
            JSONParser parser = new JSONParser();
            String jsonString = new String(Files.readAllBytes(Paths.get(filePath)));
            jsonString.replace("{name}", sb.toString()).replace("{email}", sb + "@gmail.com").replace("{number}", num);

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
}
