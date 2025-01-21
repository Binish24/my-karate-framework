@post&PutUsers
  Feature: Testing create user

    Background:
      * def emailUtility = Java.type ('utilities.GenerateRandomEmails')
      * def randomEmail = emailUtility.generateRandomEmail()
      * def studentName = "Kamal"


      @get_post_put_users_1
      Scenario: Validate the GET users from https://jsonplaceholder.typicode.com/users
        Given url "http://localhost:3000"
        Given path "/api/students/"
        When method get
        Then status 200
        And match response != null



      @post_put_users_2
      Scenario: POST users from https://jsonplaceholder.typicode.com/users
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
        Then status 201
        And match response != null
        And match response.name == studentName
        And match response.email == randomEmail
        * def studentId = response.id
        * def studentEmail = response.email
        And print studentId


        #   Update the email of the student
        #   Separate a string from an integer!

         Given url "http://localhost:3000"
         Given path "/api/students", studentId
         And request
         """
            { "name": "#(studentName)",
              "email": "#(randomEmail)"
            }
         """
         When method put
         Then status 200
         And match response != null
         And match response.email == randomEmail
         And match response.name == studentName


