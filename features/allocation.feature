Feature: Allocation
  Allocation funds based on planned and actual expenditure
  
  Scenario: On track
    Given the planned expenditure is $80
    And the actual expenditure is $80
    And the planned savings is $80
    And actual savings is $80
    Then the new allocation should be $80
