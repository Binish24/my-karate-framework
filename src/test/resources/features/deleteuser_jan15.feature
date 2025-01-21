@DeleteUser
  Feature: Testing delete user

    Background:
      Given url "http://localhost:3000"

    @delete_user
    Scenario: Validate the GET users from baseUrl

      Given path "/api/students/"
      When method get
      Then status 200
      And print response
      * def studentId = response[0].id

      Given path "/api/students/", studentId
      When method delete
      Then status 200
      And print response

      Given path "/api/students"
      When method get
      Then status 200
      And print response
      And match response [0].id != studentId