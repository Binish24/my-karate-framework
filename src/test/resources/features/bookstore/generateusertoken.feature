@generateTokenForUser
Feature: Generate user Token


 Scenario: Generate a valid token for existing user
 Given url "https://bookstore.demoqa.com"
 Given path "/Account/v1/GenerateToken"
 And header Content-Type = "application/json"
 And request
 """
         {
          "userName": "Hamahang Mashaal",
          "password": "Hmashaal2015@#"
          }
 """
 When method post
 And status 200
 And print response
 And match response.token != null
 * def userToken = response.token
# * return { token: userToken }