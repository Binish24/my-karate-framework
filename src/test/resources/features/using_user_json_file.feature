@User_json
  Feature: Testing post users

  Background:
    Given url "http://localhost:3000"
    Given path "/api/students/"
  * def emailUtility = Java.type('utilities.GenerateRandomEmails')
  * def randomEmail = emailUtility.generateRandomEmail()
  * def studentName = "Killy Alexander12"

#    Read the information from user.json // clsspath is going to target the SRC test resources
    * def requestData = karate.read('classpath:data/user.json')
    * requestData.email = randomEmail

    @users_1
    Scenario: Validate the GET users from https://jsonplaceholder.typicode.com/users
    And request requestData
    And print randomEmail
    When method post
    Then status 201
    And match response != null
    And match response.name == studentName
    And print response