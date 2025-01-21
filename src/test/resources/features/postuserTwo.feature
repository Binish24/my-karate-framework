@PostUser
  Feature: Testing create user

    Background:
         Given url"http://localhost:3000"
         Given path "/api/students"

      @PostUser_1
      Scenario: Validate the GET users from https://jsonplaceholder.typicode.com/user
        And request
         """
          {
          "name": "Sam",
          "email": "sam@gmail.com"
          }
         """
        When method post
        Then status 201
        And match response != null