package com.qa.hris.commonutils;

import com.gemini.generic.api.utils.ApiInvocation;
import com.gemini.generic.api.utils.Request;
import com.gemini.generic.api.utils.Response;
import com.gemini.generic.reporting.GemTestReporter;
import com.gemini.generic.reporting.STATUS;
import com.gemini.generic.tdd.GemjarTestngBase;
import com.gemini.generic.utils.ProjectConfigData;
import io.cucumber.java.en.Given;
import io.restassured.path.json.JsonPath;
import org.apache.http.HttpStatus;
import org.testng.Assert;
import org.testng.annotations.Test;

import java.util.HashMap;
import java.util.Map;

public class Utils extends GemjarTestngBase {

//    @Test
//    public void sample() throws Exception {
//
//        Request request = new Request();
//        String url = ProjectConfigData.getProperty("Gett");
//        request.setURL(url);
//        request.setMethod("post");
//        request.setStep("Test to check the Post API");
//        Response response = ApiInvocation.handleRequest(request);
//        System.out.println(response.getStatus());
//    }

    public static String GetToken() {
        return GlobalVariable.token;
    }

    public static void VerifyStatusCode(int expected, int actual) {
        if (expected == actual) {
            GemTestReporter.addTestStep("Status Verification", "Expected Status :" + expected + ",<br>Actual :" + actual, STATUS.PASS);
        } else {
            GemTestReporter.addTestStep("Status Verification", "Expected Status :" + expected + ",<br>Actual :" + actual, STATUS.FAIL);
        }
    }

    public static String GetAuthorization() {
        return Utils.generateAuthToken();
    }

    public static HashMap getAuthentication() {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("Authorization", GetAuthorization());
        return token;
    }

    public static String GetUser() {
        return GlobalVariable.user;
    }

    public static String APIcalling() {
        String commonAPI = "https://dleae1blka.execute-api.ap-south-1.amazonaws.com/uat/users/auth";
        return commonAPI;
    }

    public static Response LoginUser(String UrlNameFromConfig, String method, Map<String, String> headers, String step) throws Exception {
        Response response = new Response();
        try {
            Request request = new Request();
//            String url = APIcalling() + ProjectConfigData.getProperty(UrlNameFromConfig);
            /*+ ProjectConfigData.getProperty(UrlNameFromConfig)*/
            UrlNameFromConfig = APIcalling();
//            GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
            request.setURL(UrlNameFromConfig);
            request.setMethod(method);
            if (!headers.isEmpty()) {
                request.setHeaders(headers);
            }
            if (!step.isEmpty()) {
                request.setStep(step);
            }

            response = ApiInvocation.handleRequest(request);
            if (response.getStatus() == HttpStatus.SC_OK) {
                GlobalVariable.token = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("token").getAsString();
//                JsonPath p = response.jsonPath();
//                GlobalVariable.token = response.getResponseBodyJson().getAsJsonObject().get("Token").getAsString();
            }
//            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Executed Successfully", STATUS.PASS);
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
            if ((response.getResponseBody()) != null) {
                GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
            } else {
                GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
            }
        } catch (Exception e) {
            GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
            GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
        }
        return response;
    }

    public static String generateAuthToken() {
        String authToken;
        Request request = new Request();
        String url = APIcalling();
        GemTestReporter.addTestStep("Url for Auth Request", url, STATUS.INFO);
        request.setURL(url);
        request.setMethod("post");
        request.setRequestPayload("{\n" +
                "  \"email\": \"ananya.jain@geminisolutions.com\",\n" +
                "  \"_id\": \"\"\n" +
                "}");
        try{
            Response response = ApiInvocation.handleRequest(request);
            System.out.println(response);
            authToken = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("token").getAsString();
            return authToken;
        }catch(Exception e ){
            Assert.fail("Failed to generate Auth token due to exception: "+e);
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

        //send API without Payload
        public static Response apiWithoutPayloads(String UrlNameFromConfig, String method, Map<String, String> headers, String step) throws Exception {
            Response response = new Response();
            try {
                Request request = new Request();
                String url = ProjectConfigData.getProperty(UrlNameFromConfig);
                url = GlobalVariable.BASE_URL + url;

                System.out.println("URL - " + url);

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
                GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
                responseCheck(response);
            } catch (Exception exception) {
                logger.info("Request doesn't Executed Successfully ", exception);
                GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
            }
            return response;
        }

        //Verify status code
        public static void verifyStatusCode(int expected, int actual) {
            if (expected == actual) {
                GemTestReporter.addTestStep("Status Verification", "Expected Status :" + expected + ",<br>Actual :" + actual, STATUS.PASS);
            } else {
                GemTestReporter.addTestStep("Status Verification", "Expected Status :" + expected + ",<br>Actual :" + actual, STATUS.FAIL);
            }
        }

        //send API with Payload
        public static Response apiWithPayloads(String UrlNameFromConfig, String method, String payloadName, Map<String, String> headers, String step) throws Exception {
            Response response = new Response();
            try {
                Request request = new Request();
                String url = ProjectConfigData.getProperty(UrlNameFromConfig);
                url = GlobalVariable.BASE_URL + url;
                GemTestReporter.addTestStep("Url for " + method.toUpperCase() + " Request", url, STATUS.INFO);
                request.setURL(url);
                request.setMethod(method);
                if (!headers.isEmpty()) {
                    request.setHeaders(headers);
                }
                if (!step.isEmpty()) {
                    request.setStep(step);
                }
                if (!payloadName.equals("")) {
                    String payload = ProjectSampleJson.getSampleDataString(payloadName);
                    JsonParser parser = new JsonParser();
                    JsonObject pay = (JsonObject) parser.parse(payload);
                    String payloads = String.valueOf(ApiHealthCheckUtils.result(pay));
                    request.setRequestPayload(payloads);
                    GemTestReporter.addTestStep("Payload ", String.valueOf(payloads), STATUS.INFO);
                }
                response = ApiInvocation.handleRequest(request);
// GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Executed Successfully", STATUS.PASS);
                GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
                if ((response.getResponseBody()) != null) {
                    GemTestReporter.addTestStep("Response Body", response.getResponseBody(), STATUS.INFO);
                } else {
                    GemTestReporter.addTestStep("Response Body", "No-Response", STATUS.INFO);
                }

            } catch (Exception e) {
                GemTestReporter.addTestStep(method.toUpperCase() + " Request Verification ", method.toUpperCase() + " Request Did not Executed Successfully", STATUS.FAIL);
                GemTestReporter.addTestStep("Response Message", response.getResponseMessage(), STATUS.INFO);
            }
            return response;
        }
    }
}