Feature: Replace some text in a file
  In order to have the text I want in a file's line
  As a developer
  I want to replace some text with another text. But if the text already exist,
  it must leave it as is.

  Background:
    Given a file named "test.txt" with:
    """
    Some random text
    the second line
    something to be replaced
    The last line.
    """

  Scenario: Replace a line in a file
    Given a line to be replaced:
    """
    something to be replaced
    """
    And a line to replace with:
    """
    something else
    """
    When ask to replace one line with the other at file named "test.txt"
    Then the file "test.txt" should contain "something else"
    And it should return true

  Scenario: The line to be replaced is not at the file
    Given a line to be replaced:
    """
    something that is not at the file
    """
    And a line to replace with:
    """
    something else
    """
    When ask to replace one line with the other at file named "test.txt"
    Then the file "test.txt" should not contain "something else"
    And it should return false

