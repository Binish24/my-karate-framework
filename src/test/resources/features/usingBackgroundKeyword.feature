@usingBackground
Feature: Testing users endpoint API

  Background:
    Given url "https://jsonplaceholder.typicode.com"
#    Given url  baseUrl // sometimes we can take name of this baseUrl from karate-config and use it instead direct link of the url
    Given path "/users"

  @using_1
  Scenario: Validate the GET users from https://jsonplaceholder.typicode.com/users
    When method get
    Then status 200


  @using_2
  Scenario: Validate the GET users endpoint and check that the response is not null
    When method get
    Then status 200
    And match response != null


  @using_3
  Scenario: Print the result of the GET users endpoint and check that the response it not null
    When method get
    Then status 200
    And match response != null
    And print response