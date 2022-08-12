# features/testim.feature

Feature: Testim Scenarios

Background: 
Given User is on homepage

@login
Scenario: UI: login/logout
	When login with below credentials
	| username | hello    |
	| password | hello123 |
	Then validate user logged in to be "Hello, John"
	And when logout
	Then validate user is logged out

@count_travellers
Scenario: UI: count travellers
	When login with below credentials
	| username | hello    |
	| password | hello123 |
	And choose travellers as below
	| adults   | 2 |
	| children | 4 |
	Then assert travellers to be 6

@validate_dates
Scenario: UI: validate dates
	When login with below credentials
	| username | hello    |
	| password | hello123 |
	And clicks select destination with default values
	And book planet by name 'Madan'
	Then assert page with valid dates