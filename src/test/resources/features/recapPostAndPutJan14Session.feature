@Post&Put
  Feature: Testing create and modified the user

    Background:
      Given url "http://localhost:3000"
      Given path "/api/students"
      * def emailUtility = Java.type ("utilities.GenerateRandomEmails")
      * def randomEmail = emailUtility.generateRandomEmail()
      * def studentName = "Habel"

      @post_put_1
      Scenario: post a user from https://naraiman.com
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


#        Update the email of the student
        Given url "http://localhost:3000"
        Given path "/api/students/100"
        * def newRandomEmail = emailUtility.generateRandomEmail()
        And request
        """
          {
           "name": "#(studentName)",
           "email": "#(newRandomEmail)"
           }
        """
        When method put
        Then status 200
        And match response.email == newRandomEmail

