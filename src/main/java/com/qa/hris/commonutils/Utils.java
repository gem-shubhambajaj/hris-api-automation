package com.qa.hris.commonutils;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;
import com.gemini.generic.api.utils.*;
import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.gemini.generic.tdd.GemjarTestngBase;
import com.gemini.generic.ui.utils.DriverAction;
import com.gemini.generic.utils.ProjectConfigData;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import org.json.JSONException;
import org.json.*;
import com.qa.hris.stepdefinitions.HROnboardingStep;
import org.apache.http.HttpStatus;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.testng.Assert;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.node.ObjectNode;

import java.io.*;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Utils extends GemjarTestngBase {
    static Logger logger = LoggerFactory.getLogger(HROnboardingStep.class);


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

    public static Response loginUser(String urlNameFromConfig, String method, String sample, String step) throws Exception {
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
        request.setRequestPayload("{\n" +
                "  \"email\": \"shubham.bajaj@geminisolutions.com\",\n" +
                "  \"_id\": \"\"\n" +
                "}");
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
    public static Response apiWithoutPayloads(String urlNameFromConfig, String method, Map<String, String> headers, String step, String api) throws Exception {
        Response response = new Response();
        try {
            Request request = new Request();
//            String url = ProjectConfigData.getProperty(urlNameFromConfig);
//            String url2 = GlobalVariable.baseURL1 + url;
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
//            url =  GlobalVariable.baseURL3+ url;

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

    @Then("check new user json")
    public static void newUser() throws IOException, ParseException {
//        updateJsonValue("src/main/resources/update.json", new String[]{"_id"}, GlobalVariable.uid);
        jsonUpdated();
    }

    public static void updateJsonValue(String filePath, String[] keys, String newValue) {
        try {
            // Read the JSON file
            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode jsonNode = objectMapper.readTree(new File(filePath));

            // Traverse the JSON tree to find the node with the specified keys
            JsonNode nodeToUpdate = jsonNode;
            for (String key : keys) {
                nodeToUpdate = nodeToUpdate.get(key);
                if (nodeToUpdate == null) {
                    System.out.println("Key path not found in JSON file.");
                    return;
                }
            }

            // Update the value
            if (nodeToUpdate.isObject()) {
                ObjectNode objectNode = (ObjectNode) nodeToUpdate;
                objectNode.put(keys[keys.length - 1], newValue);
            } else {
                System.out.println("The value associated with the key path is not an object.");
                return;
            }
            // Write the updated JSON back to the file
            objectMapper.writeValue(new File(filePath), jsonNode);
            System.out.println("Nested JSON value updated successfully.");
        } catch (IOException e) {
            System.out.println("Error occurred while updating nested JSON value: " + e.getMessage());
        }
    }

    public static void jsonUpdated() throws IOException, ParseException {
        String filePath = "src/main/resources/update.json";
        JSONParser parser = new JSONParser();
        String jsonString = new String(Files.readAllBytes(Paths.get(filePath)));
        String newValue = "new value";
        jsonString = jsonString.replace("{uid}", newValue);
        System.out.println(jsonString);
//        Gson gson = new Gson();
        JSONObject json = new JSONObject(jsonString);
        System.out.println(json);
//        Files.write(Paths.get(filePath), jsonString.getBytes());


    }

    //    public static void jsonUpdate() throws IOException {
//
//        FileInputStream inFile = new FileInputStream("File_Location");
//        byte[] str = new byte[inFile.available()];
//        inFile.read(str);
//        String string = new String(str);
//        JSONObject json = JSONEdit.createJSONObject(string);
//        System.out.println(JSONEdit.replacekeyInJSONObject(json,"Address","Addressxxxxxx"));
//    }
//
//    private static JSONObject replacekeyInJSONObject(JSONObject jsonObject, String jsonKey,
//                                                     String jsonValue) {
//
//        for (Object key : jsonObject.keySet()) {
//            if (key.equals(jsonKey) && ((jsonObject.get(jsonKey) instanceof String)||(jsonObject.get(jsonKey) instanceof Number)||jsonObject.get(jsonKey) ==null)) {
//                jsonObject.put(jsonKey, jsonValue);
//                return jsonObject;
//            } else if (jsonObject.get(jsonKey) instanceof JSONObject) {
//                JSONObject modifiedJsonobject = (JSONObject) jsonObject.get(jsonKey);
//                if (modifiedJsonobject != null) {
//                    replacekeyInJSONObject(modifiedJsonobject, jsonKey, jsonValue);
//                }
//            }
//
//        }
//        return jsonObject;
//    }
//
//    private static JSONObject createJSONObject(String jsonString){
//        JSONObject jsonObject=new JSONObject();
//        JSONParser jsonParser=new  JSONParser();
//        if ((jsonString != null) && !(jsonString.isEmpty())) {
//            try {
//                jsonObject=(JSONObject) jsonParser.parse(jsonString);
//            } catch (org.json.simple.parser.ParseException e) {
//                e.printStackTrace();
//            }
//        }
//        return jsonObject;
//    }
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
                case "userAuth":
                case "triggerMail":
                case "taxSavingSetVerified":
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
            }
            jsonFile = new JSONObject(jsonString);
//            String payloadString = ProjectSampleJson.getSampleDataString(payload);
//            payloadString.replace("name", sb.toString());
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return jsonFile;

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
//            String payloadString = ProjectSampleJson.getSampleDataString(payload);
//            payloadString.replace("name", sb.toString());

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

    }
}
