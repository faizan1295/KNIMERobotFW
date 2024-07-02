# KNIME Hub Space Management Testing

## Description

This project demonstrates both manual QA and automated functional testing of a web page using Robot Framework with Selenium. The goal is to test the creation and deletion of spaces on the KNIME Hub for logged-in users. 

## Prerequisites

Before running the project, ensure you have the following installed:

- [Python](https://www.python.org/downloads/)
- [Robot Framework](https://robotframework.org/)
- [SeleniumLibrary for Robot Framework](https://github.com/robotframework/SeleniumLibrary)
- [WebDriver for your browser](https://www.selenium.dev/documentation/webdriver/getting_started/install_drivers/)
- [Git](https://git-scm.com/downloads)
- A KNIME Hub account (create one [here](https://hub.knime.com/))

## Installation

1. Clone the repository from GitHub:

    ```cmd
    git clone https://github.com/your-username/knime-space-management-testing.git
    cd knime-space-management-testing
    ```

2. Create and activate a virtual environment:

    ```cmd
    python -m venv venv
    venv\Scripts\activate
    ```

3. Install the required packages:

    ```cmd
    pip install -r requirements.txt
    ```

4. Download the appropriate WebDriver for your browser and add it to your system PATH.

## Manual Test Case

### Test Steps

1. Open the KNIME Hub website.
2. Log in with valid credentials.
3. Navigate to your spaces.
4. Create a new space.
5. Verify that the space was created successfully.
6. Make the space public.
7. Verify that the space was made public.
8. Delete the space.
9. Verify that the space was deleted successfully.

## Automated Test Case

The automated test case follows the manual steps described above. It uses the Robot Framework with SeleniumLibrary to interact with the web page.

### Test Cases

- **LoginTest**: Logs in to the KNIME Hub.
- **AccessingSpace**: Navigates to the user's spaces.
- **CreateSpace**: Creates a new space.
- **DeleteSpace**: Deletes the created space.
- **VerifyDelete**: Verifies that the space was deleted.

### Running the Tests

To run the automated tests, execute the following command in the PyCharm terminal:

```cmd
robot .\TestSuites\KnimeSpaceTests.robot
```
## Configuration
Update the variables section in the test file with your KNIME Hub account credentials:

*** Variables ***
${username}  YourUsername
${password}  YourPassword


## Contact
If you have any questions, feel free to contact us at your-email@example.com.
