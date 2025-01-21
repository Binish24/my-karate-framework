@AdvancePostUser
  Feature: Testing create user

    Background:
      Given url "http://localhost:3000"
      Given path "/api/students"
      * def emailUtility  = Java.type("utilities.GenerateRandomEmails")
      * def randomEmail = emailUtility.generateRandomEmail()
      * def studentName = "Tom"

      @advance_1
      Scenario: Validate the GET users from https://jsonplaceholder.typicode.com/users
        And request
      """
         {
         "name": "Mesam",
          "email": "#(randomEmail)"
         }
      """
        And print randomEmail
        When method post
        Then status 201
        And match response != null


       @advance_2
       Scenario: Validate the GET users from https://jsonplaceholder.typicode.com/users
       And request
       """
          {
             "name": "Sima",
             "email": "#(randomEmail)"
             }
       """
       And print randomEmail
       When method post
       Then status 201
      And match response != null


    @advance_3
    Scenario: Validate the GET users from https://jsonplaceholder.typicode.com/users
      And request
       """
          {
             "name": "#(studentName)",
             "email": "#(randomEmail)"
             }
       """
      And print randomEmail
      When method post
      Then status 201
      And match response != null
#      And match response.name == "Sima"
      And match response.name == studentName
      And match response.email == randomEmail


    @advance_4
    Scenario: Validate the GET users from https://jsonplaceholder.typicode.com.users
      And request
       """
          {
              "name": "#(studentName)",
               "email": "#(randomEmail)"
          }
       """
      When method post
      Then status 201
      And match response != null
#      And match response.name == studentName
#      And match response.email == randomEmail








# * def emailUtility  = Java.type ("utilities.GenerateRandomEmails"); this one is coming from utilities folder, name of fol...& class
#   * def randomEmail =emailUtility.generateRandomEmail(); this Variable comes from GenerateRandomClass,generateRandomEmail(), method!