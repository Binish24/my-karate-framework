@FirstVerySampleFeature
  Feature: Testing users endpoint API

    @firstVerySample_1
    Scenario: Validate the GET users from https://jsonplaceholder.typicode.com/users
      Given url "https://jsonplaceholder.typicode.com"
      Given path "/users"
      When method get
      Then status 200


    @firstVerySample_2
    Scenario: Validate the GET users endpoint and check that the response is not null
     Given url "https://jsonplaceholder.typicode.com"
     Given path "/users"
     When method get
     Then status 200
     And match response != null


    @firstVerySample_3
    Scenario: Print the result of the GET users endpoint and check that the response it not null
    Given url "https://jsonplaceholder.typicode.com"
    Given path "/users"
    When method get
    Then status 200
    And match response != null
    And print response