@coveredAllAspectsOfUsers
  Feature: create till delete activity

    Background:
      Given url "http://localhost:3000"
      * def emailUtility = Java.type ('utilities.GenerateRandomEmails')
      * def randomEmail = emailUtility.generateRandomEmail()
      * def studentName = "Karim"

    # Read and assign random email to user

      * def requestData = karate.read('classpath:data/user.json')
      * requestData.email = randomEmail


      @post_validation_1
      Scenario: Validate that a single record is being created, updated and deleted
        Given path "/api/students/"
        And request requestData
        When method post
        Then status 201
        And match response.email == randomEmail
        * def studentId = response.id
        And print response

        Given path "/api/students/", studentId
        * def newRandomEmail = emailUtility.generateRandomEmail()
        * requestData.email = newRandomEmail
        And request requestData
        When method put
        Then status 200
        And match response != null
        And match response.email == newRandomEmail
        And print response


        Given path "/api/students/", studentId
        When method delete
        Then status 200
        And print response

        Given path "/api/students/"
        When method get
        Then status 200
        And print response
        And match response != null









