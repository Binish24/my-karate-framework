@Get_Post_Put
  Feature: Testing get,create and modification of the users

    Background:
      Given url "http://localhost:3000"
      Given path "/api/students"
      * def emailUtility = Java.type('utilities.GenerateRandomEmails')
      * def randomEmail = emailUtility.generateRandomEmail()
      * def studentName = "Eman"


      @get_instance_1
      Scenario: Validate the GET users from https://jsonplaceholder.typicode.com/users
        When method get
        Then status 200
        And match response != null


      @post_instance_1
      Scenario: post user from https://jsonplaceholder.typicode.com/users
        And request
            """
            {
               "name": "Haroon",
               "email": "haroon@gmail.com"
            }
            """
        When method post
        Then status 201
        And match response != null
        And print response

      @post_instance_2
      Scenario: post user from https://jsonplaceholder.typicode.com/users
        And request
            """
            {
                "name": "Eman",
                "email": "#(randomEmail)"
            }
            """
        When method post
        Then status 201
        And match response != null
        And print response


#        Update the name and email of student
        @put_instance_1
        Scenario: modify a user from https://jsonplaceholder.typicode.com/users
        Given url "http://localhost:3000"
        Given path "/api/students/120"
        * def newRandomEmail = emailUtility.generateRandomEmail()
        * def newStudentName = "Kalbi"
        And request
        """
          {
           "name": "#(newStudentName)",
           "email": "#(newRandomEmail)"
           }
        """
        When method put
        Then status 200
        And match response.email == newRandomEmail
        And match response.name == newStudentName


