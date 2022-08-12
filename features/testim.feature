# features/testim.feature

Feature: Testim Scenarios

Background: 
Given User is on homepage

@smoke @regression @login
Scenario: UI: login/logout functionality
	When login with below credentials
	| username | hello    |
	| password | hello123 |
	Then validate user logged in to be "Hello, John"
	And when logout
	Then validate user is logged out

@smoke @regression @count
Scenario: UI: count travellers
	When login with below credentials
	| username | hello    |
	| password | hello123 |
	And choose travellers as below
	| adults   | 2 |
	| children | 4 |
	Then assert travellers to be 6
