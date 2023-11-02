package com.qa.hris.stepdefinitions;

import com.gemini.generic.api.utils.ApiInvocation;
import com.gemini.generic.api.utils.Request;
import com.gemini.generic.api.utils.Response;
import com.ibm.icu.impl.Assert;
import com.qa.hris.commonutils.Utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.json.JSONObject;

import java.io.IOException;


public class LoginPage {

    static int status;
    static Response response;
    @Given("Set endpoint {string} and method {string} and payload {string} for Login Dashboard Authentication")
    public void loginDashboardAuth(String url, String method, String payload) throws IOException {
        String updatedPayload = Utils.updateLogin(payload);
        response = Utils.loginUser(url, method, updatedPayload, "LoginUser");
        status = response.getStatus();
    }

    @Then("Verify dashboard status code {int}")
    public void checkStatusCode(int Expected) {
        Utils.verifyStatusCode(Expected, status);
    }

    @Given("^User is able to successfully fetch access token$")
    public static void authMethod(){
        Request request = new Request();
        String url = "https://dleae1blka.execute-api.ap-south-1.amazonaws.com/uat/users/auth";
        request.setURL(url);
        request.setMethod("POST");
        request.setRequestPayload("{\n" +
                "  \"email\": \"shubham.bajaj@geminisolutions.com\",\n" +
                "  \"_id\": \"\"\n" +
                "}");

        try{
            response = ApiInvocation.handleRequest(request);
        }
        catch(Exception e ){
            Assert.fail("Failed to generate Auth token due to exception: "+e);
        }
    }

    @Given("^fetch response$")
    public void printResponse(){
        System.out.println(response);
    }

}
