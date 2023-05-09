package com.qa.hris.commonutils;

import com.gemini.generic.api.utils.*;
import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.gemini.generic.tdd.GemjarTestngBase;
import com.gemini.generic.utils.ProjectConfigData;
import com.qa.hris.stepdefinitions.HROnboardingStep;
import org.apache.http.HttpStatus;
import org.testng.Assert;

import java.util.Map;

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
            String payload = ProjectSampleJson.getSampleDataString(sample);
            request.setRequestPayload(payload);
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
    public static Response apiWithoutPayloads(String urlNameFromConfig, String method, Map<String, String> headers, String step,String api) throws Exception {
        Response response = new Response();
        try {
            Request request = new Request();
//            String url = ProjectConfigData.getProperty(urlNameFromConfig);
//            String url2 = GlobalVariable.baseURL1 + url;
            String url=null;
            switch (api){
                case "MasterTableApi":
                {
                    url = GlobalVariable.baseURL3;
                    break;
                }
                case "HRGetDataApi":
                {
                    url = GlobalVariable.baseURL1;
                    break;
                }
                case "ExitAutomationApi":
                {
                    url = GlobalVariable.baseURL4;
                    break;
                }
                case "TrainingApi":
                {
                    url = GlobalVariable.baseURL6;
                    break;
                }
                case "HRonboardCronApi":
                {
                    url = GlobalVariable.baseURL7;
                    break;
                }
                case "accountsDataApi":
                {
                    url = GlobalVariable.baseURL8;
                    break;
                }
                case "fresherAssignApi":
                {
                    url = GlobalVariable.baseURL9;
                    break;
                }
                case "certificationApi":
                {
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
    public static Response apiWithPayloads(String urlNameFromConfig, String method, Map<String, String> headers, String step, String payloadName, String api) throws Exception {
        Response response = new Response();
        try {
            Request request = new Request();
            String url=null;
            switch (api){
                case "MasterTableApi":
                {
                    url = GlobalVariable.baseURL3;
                    break;
                }
                case "HRSaveDataApi":
                {
                    url = GlobalVariable.baseURL2;
                    break;
                }
                case "ExitAutomationApi":
                {
                    url = GlobalVariable.baseURL4;
                    break;
                }
                case "botAutomationApi":
                {
                    url = GlobalVariable.baseURL5;
                    break;
                }
                 case "TrainingApi":
                {
                    url = GlobalVariable.baseURL6;
                    break;
                }
                case "HRonboardCronApi":
                {
                    url = GlobalVariable.baseURL7;
                    break;
                }
                case "accountsDataApi":
                {
                    url = GlobalVariable.baseURL8;
                    break;
                }
                case "fresherAssignApi":
                {
                    url = GlobalVariable.baseURL9;
                    break;
                }
                case "certificationApi":
                {
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
            String payload = ProjectSampleJson.getSampleDataString(payloadName);
            request.setRequestPayload(payload);

            response = ApiInvocation.handleRequest(request);
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
}