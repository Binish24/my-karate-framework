@PutUser
  Feature: Testing modification of the user

    Background:
      * def emailUtility = Java.type ("utilities.GenerateRandomEmails")
      * def randomEmail = emailUtility.generateRandomEmail()
      * def studentName = "Shakib"


   @put_user_1
   Scenario: modify the post user in localhost
      Given url "http://localhost:3000"
      Given path "/api/students"
      And request
        """
         {
            "name": "#(studentName)",
             "email": "#(randomEmail)"
          }
        """
      And print randomEmail
      When method post
      And  status 201
      And match response != null
      And match response.name == studentName
      And match response.email == randomEmail
      * def studentId = response.id
      * def studentEmail = response.email
      And print studentId
      And print studentEmail

     #    Update the email of the student
     Given url "http://localhost:3000"
     Given path "/api/students/95"
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

