IoTest
======

IoTest is a testing framework for the Io language. The current state of development allows for basic testing functionality. Though not all roadmap features are complete, the current next step is to produce documentation.  In the meanwhile, the test files in the tests directory provide a basic example of how to write tests using IoTest.

The feature set is/will be as follows:

- [ ] Configure test runner
    - [x] Current working directory
    - [x] Test file locations
    - [x] Test file extension
    - [ ] Reporting level
- [x] Run all tests via a configured test runner
- [x] Create test suites
- [x] Create test cases
- [x] Assertions (Each with an optional failure message)
    - [x] Bare assertion
    - [x] Equality
    - [x] Inequality
    - [x] True
    - [x] False
    - [x] Raises Exception (with optional message string)
    - [x] Does not raise exception
- [ ] Reporting
    - [ ] JSON output
    - [x] Detail
    - [ ] Summary
    - [ ] Failure only
- [ ] Documentation