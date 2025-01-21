@Posts
    Feature: Testing create user

      Background:
        Given url "http://localhost:3000"
        Given path "/api/students"

    @user_1
    Scenario: Validate the GET users from https://jsonplaceholder.typicode.com/users
      And request { "name": "Shakib", "email": "shakib@gmail.com" }
      When method post
      And  status 201
      And match response != null
      Then print response


      @user_2
      Scenario: Validate the GET users from https://jsonplaceholder.typicode.com/users
        * def emailUtility = Java.type('utilities.GenerateRandomEmails')
        * def randomEmail = emailUtility.generateRandomEmail()
        And request { "name": "Behnam", "email": "#(randomEmail)" }
        And print randomEmail
        When method post
        Then status 201
        And match response != null

      @user_3
      Scenario: Validate the GET users from https://jsonplaceholder.typicode.com/users
       * def emailUtility = Java.type('utilities.GenerateRandomEmails')
       * def randomEmail = emailUtility.generateRandomEmail()
       And request { "name": "Mike", "email": "#(randomEmail)" }
       And print randomEmail
       When method post
       And status 201
       And match response != null









   #utilities package and GenerateRandomEmail class
  # def variable name and name of generateRandomEmail method