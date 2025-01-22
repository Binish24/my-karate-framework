@BookStore
  Feature: Working with BookStore APIs


    Background:
      Given url "https://demoqa.com"
      * def userId = '3f889aff-5c94-4c9e-8386-80acb3ff4bdb'
      * def tokenResponse = call read('classpath: features/bookstore/generateusertoken.feature')
      * def userToken = tokenResponse.token

    @CreateUserUnderBookStore
    Scenario: Create a user under bookstore database
      Given path "/Account/v1/User/"
      And header Content-Type = "application/json"
      And request
      """
         {
          "userName": "Hamahang Mashaal12",
          "password": "Hmashaal2015@#"
          }
      """
      When method post
      And status 201
      And print response
      And match response != null


    @UnauthorizedRequestForUser
    Scenario: Make unauthorized request to get user endpoint
      Given path '/Account/v1/User', userId
      When method get
      And status 401
      And print response
      And match response.message == 'User not authorized!'


      @AuthorizedRequestForUser
      Scenario: Make unauthorized request to get user endpoint
      Given path '/Account/v1/User', userId
      And print userToken
      And print tokenResponse
      And header Authorization = "Bearer" + userToken
      When method get
      And status 200
      And print response
      And match response != null



