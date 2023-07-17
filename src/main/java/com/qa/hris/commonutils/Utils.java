package com.qa.hris.commonutils;

import com.gemini.generic.api.utils.*;
import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.gemini.generic.tdd.GemjarTestngBase;
import com.gemini.generic.utils.ProjectConfigData;
import org.json.*;
import com.qa.hris.stepdefinitions.StepDefinition;
import org.apache.http.HttpStatus;

import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
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
            }String filePath = "src/main/resources/login.json";
            String jsonString = new String(Files.readAllBytes(Paths.get(filePath)));
            request.setRequestPayload(jsonString);
            response = ApiInvocation.handleRequest(request);
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
            logger.error("Some error occurred", e);
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
        }
        return response;
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
                case "masterTableApi" -> url = GlobalVariable.masterTable;
                case "hrGetDataApi" -> url = GlobalVariable.hrGetData;
                case "exitAutomationApi" -> url = GlobalVariable.exit;
                case "trainingApi" -> url = GlobalVariable.training;
                case "hrOnboardCronApi" -> url = GlobalVariable.hrOnboardCron;
                case "accountsDataApi" -> url = GlobalVariable.accountsData;
                case "fresherAssignApi" -> url = GlobalVariable.fresherAssign;
                case "certificationApi" -> url = GlobalVariable.certification;
            }
            url += ProjectConfigData.getProperty(urlNameFromConfig);
            switch (urlNameFromConfig) {
                case "deleteCandidate", "getCandidate", "tpoDetails" -> url = url.replace("{uid}", GlobalVariable.uid);
                case "getAllCandidateMaster" -> url = url.replace("{authToken}", GlobalVariable.token);
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
            logger.error("Request didn't Execute Successfully ", exception);
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
                case "masterTableApi" -> url = GlobalVariable.masterTable;
                case "hrSaveDataApi" -> url = GlobalVariable.hrSaveData;
                case "exitAutomationApi" -> url = GlobalVariable.exit;
                case "botAutomationApi" -> url = GlobalVariable.botAutomate;
                case "trainingApi" -> url = GlobalVariable.training;
                case "hrOnboardCronApi" -> url = GlobalVariable.hrOnboardCron;
                case "accountsDataApi" -> url = GlobalVariable.accountsData;
                case "fresherAssignApi" -> url = GlobalVariable.fresherAssign;
                case "certificationApi" -> url = GlobalVariable.certification;
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
            String jsonObj = payloadName.toString();
            request.setRequestPayload(jsonObj);
            response = ApiInvocation.handleRequest(request);
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
            responseCheck(response);
        } catch (Exception exception) {
            logger.error("Request doesn't Executed Successfully ");
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
                case "savetpo":
                case "syncOfficialInfo":
                case "userAuth":
                case "triggerMail":
                case "sendTrainingMail":
                case "trainingSave":
                case "downloadDocument":
                case "uploadDocument":
                case "sendBulkJoiningMail":
                case "allDataUpdate":
                case "updateFeedbackReminder":{
                    jsonString = jsonString.replace("{uid}", GlobalVariable.uid);
                    break;
                }
                case "update": {
                    jsonString = jsonString.replace("{uid}", GlobalVariable.uid);
                }
                case "save":
                case "saveMasterTableData": {
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
                case "saveTaxSavingOptions":
                {
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
                case "deleteCertificate":
                case "updateCertification": {
                    jsonString = jsonString.replace("{uid}", GlobalVariable.certificationUid);
                    break;
                }
                case "saveRoles" :{
                    String name = generateName();
                    jsonString = jsonString.replace("{name}", name);
                    break;
                }
                case "updateMasterTableData":{
                    String phoneNumber = generatePhoneNumber();
                    String name = generateName();
                    jsonString = jsonString.replace("{name}",GlobalVariable.masterName).replace("{number}",phoneNumber).replace("{email1}", name + "@gmail.com");
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

    public static void compareJson(ArrayList<String> expected,ArrayList<String> actual){
        if (expected.equals(actual)){
            GemTestReporter.addTestStep("Compare expected values with actual values","Expected values are same as actual values",STATUS.PASS);
        }else
            GemTestReporter.addTestStep("Compare expected values with actual values","Values not matched",STATUS.FAIL);
    }

}
