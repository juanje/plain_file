Feature: Append some text to the file
  In order to have a new line in the file
  As a developer
  I want to append the line to the file

  Background:
    Given a file named "test.txt" with:
    """
    Some random text
    the second line
    something we are looking for
    The last line.
    """

  Scenario: Append a line to the end of the file
    Given a line to append:
    """
    The new line in the block
    """
    When ask to append the line to file named "test.txt"
    Then the file "test.txt" should contain "The new line in the block"
    But the line "The new line in the block" should be the last one
    And it should return true

  Scenario: Append a line in a file after some text
    Given a line to append:
    """
    The new line in the block
    """
    And the text to append after: "looking for"
    When ask to append the line the next line after that text at file named "test.txt"
    Then the file "test.txt" should contain "The new line in the block"
    But the line "The new line in the block" should be the next to the one with the text "looking for"
    And it should return true

  Scenario: Try to append a line in a file after some text that doesn't exist
    Given a line to append:
    """
    The new line in the block
    """
    And the text to append after: "not inside the file"
    When ask to append the line the next line after that text at file named "test.txt"
    Then the file "test.txt" should not contain "not inside the file"
    And it should return false

