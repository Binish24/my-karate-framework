@Common
  Feature: Creating a common endpoint API

  Background:
    Given url "https://jsonplaceholder.typicode.com"
    Given path "/user'

    @GetUser
    Scenario: Validate the GET users from https://jsonplaceholder.typicode.com
      When method get
      Then status 200


    @PostUser
    Scenario: Validate the post users from https://jsonplaceholder.typicode.com/user
      And request { "name": "Sam", "email": "sam@gmail.com"}
      When method post
      Then status 201
      And match response != null
      And print response

   @PutUser
    Scenario: update the put users from https://jsonplaceholder.typicode.com/user
      And request { "name": "nigar", "email": "nigar@gmail.com"}
      When method post
      Then status 200
      And match response != null