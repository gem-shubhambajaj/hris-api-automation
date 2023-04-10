package com.qa.hris.stepdefinitions;

import com.gemini.generic.api.utils.ApiInvocation;
import com.gemini.generic.api.utils.Request;
import com.gemini.generic.api.utils.Response;
import com.qa.hris.commonutils.Utils;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import org.testng.Assert;

import java.util.HashMap;

public class LoginPage {

    int status;
    static Response response;
    @Given("^Set endpoint \"(.*)\" and method \"(.*)\" for Login Dashboard Authentication$")
    public void LoginDshbrdAuth(String url, String method) throws Exception {
        HashMap<String, String> token = new HashMap<String, String>();
        token.put("authorization", Utils.GetAuthorization());
        response = Utils.LoginUser(url, method, token, "LoginUser");
        status = response.getStatus();
    }

    @Then("Verify dashboard status code {int}")
    public void check_status_code(int Expected) throws Exception {
        Utils.VerifyStatusCode(Expected, status);
    }


    @Given("^User is able to successfully fetch access token$")
    public static void authMethod(){
        Request request = new Request();
        String url = "https://y8dnz1n4p5.execute-api.ap-south-1.amazonaws.com/dev/users/auth";
        request.setURL(url);
        request.setMethod("POST");
        request.setRequestPayload("{\n" +
                "  \"email\": \"ananya.jain@geminisolutions.com\",\n" +
                "  \"_id\": \"\"\n" +
                "}");

        try{
            response = ApiInvocation.handleRequest(request);
            System.out.println(response);
//            authToken = response.getResponseBodyJson().getAsJsonObject().get("data").getAsJsonObject().get("token").getAsString();
//            return authToken;
        }catch(Exception e ){
            Assert.fail("Failed to generate Auth token due to exception: "+e);
//            return null;
        }
    }

    @Given("^fetch response$")
    public void printResponse(){
        System.out.println(response);
    }

}
