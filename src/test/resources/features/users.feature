@Regression
Feature: Testing users endpoint API

  Background:
    Given url "https://jsonplaceholder.typicode.com"
    Given path "/users"

  @user_1
  Scenario: Validate the GET users from https://jsonplaceholder.typicode.com
      When method get
      Then status 200

  @user_
  Scenario: Validate the GET users endpoint and check that the response is not null
      When method get
      Then status 200
      And match response != null
#      match response is not equal to null

#    @users_3
#    Scenario: Print the result of GET users endpoint and check that the response is not null
#      When method get
#      Then status 200
#      And match response != null
#      And print response

#     I should talked about link of report of feature with one of the classmates!

