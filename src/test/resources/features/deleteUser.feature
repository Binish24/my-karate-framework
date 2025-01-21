@Delete_student
Feature: Testing create user


Background:
Given url baseUrl


Scenario: Validate the get users
#get students
Given path "/api/students"
When method get
Then status 200
And print response
* def studentId = response[0].id
#delete students
Given path "/api/students", studentId
When method delete
Then status 200
And print response
#response students
Given path "/api/students"
When method get
Then status 200
And print response
And match response[0].id != studentId