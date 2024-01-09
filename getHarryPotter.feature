@getMovie
Feature: Get

  Background:
    * url baseUrl

  Scenario: within by Search -Search HarryPotter movies
    # Given param apiKey = 'cd1fb303'
    Given param s = 'harry potter'
    When method get
    Then status 200
    And print response
    * def movie = karate.jsonPath(response, "$.Search[?(@.Year=='2001')]")
    * print movie[0].imdbID

  Scenario: within by IMDBiD -Search HarryPotter movies
    #Given param apiKey = 'cd1fb303'
    Given param i = 'tt0241527'
    When method get
    Then status 200
    And print response
    And match response.Title == "Harry Potter and the Sorcerer's Stone"
    And match response.Year == "2001"
    And match response.Released == "16 Nov 2001"
    And print response.Title
    And print response.Year
    And print response.Release