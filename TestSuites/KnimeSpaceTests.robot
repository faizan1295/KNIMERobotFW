*** Settings ***
Library     SeleniumLibrary
Library     DateTime
Library     BuiltIn

*** Variables ***
${username}  FaizanAbbas
${password}  XYZxyz123$
*** Test Cases ***
LoginTest
    Set Global Variable     ${URL}    https://hub.knime.com/
    Set Global Variable     ${BROWSER}      Google Chrome
    Open Browser To Login Page
    Wait Until Element Is Visible    css=.primary.accept-button    3s
    Click Button    css=.primary.accept-button
    Wait Until Element Is Visible    css=.button.primary.compact    3s
    Click Button    css=.button.primary.compact
    Wait Until Element Is Visible    id=edit-name    3s
    Wait Until Element Is Visible    id=edit-pass    1s
    Wait Until Element Is Visible    id=edit-submit    1s
    Input Text   id=edit-name   ${username}
    Input Text   id=edit-pass   ${password}
    Click Button    id=edit-submit
    Element Should Be Visible    identifier=q    1s
AccessingSpace
    ${current_datetime}    Get Current Date    result_format=%Y-%m-%d--%H%M%S
    Set Global Variable    ${CURRENT_DATETIME}    ${current_datetime}
    ${space_name} =     Set Variable    SPACE-${current_datetime}
    Set Global Variable    ${SPACE_NAME}    ${space_name}
    Log    Space name: ${SPACE_NAME}
    Wait Until Element Is Visible    css=.avatar-frame     15s
    Click Element    css=.avatar-frame
    Wait Until Element Is Visible    id=menu-item--0     15s
    Click Element    id=menu-item--0
CreateSpace
    Wait Until Page Contains         Your spaces     15s
    ${result}=    Run Keyword And Ignore Error    Click Button    class=button.primary.plus-button
    Run Keyword If    '${result[0]}' == 'FAIL'    Click Button    class=button.primary
    Wait Until Element Is Visible   xpath=//button[@title='Save']      15s
    Input Text      //textarea[@placeholder='Enter private space name']    ${SPACE_NAME}
    Click Button    xpath=//button[@title='Save']
    Wait Until Page Contains    Space renamed   15s
    Log    Space rename to: ${SPACE_NAME}
    Wait Until Location Contains    ${SPACE_NAME}
    Click Button    css=.function-button.single.toggle
    Wait Until Element Is Visible   xpath=//button[text()=' Make public']  15s
    Click Button    xpath=//button[text()=' Make public']
    Wait Until Element Is Visible  xpath://input[@placeholder='space name']     15s
    Input Text      xpath://input[@placeholder='space name']    ${SPACE_NAME}
    Wait Until Element Is Visible  xpath=//button[text()='I am sure, make this space public']      15s
    Click Button    xpath=//button[text()='I am sure, make this space public']
    Wait Until Page Contains    Space made public   15s
DeleteSpace
    Wait Until Page Contains    Public space    15s
    Click Button    css=.function-button.single.toggle
    Wait Until Element Is Visible   xpath=//button[text()=' Delete space']  15s
    Click Button    xpath=//button[text()=' Delete space']
    Wait Until Element Is Visible  xpath://input[@placeholder='space name']     15s
    Input Text      xpath://input[@placeholder='space name']    ${SPACE_NAME}
    Wait Until Element Is Visible  xpath=//button[text()='I understand the consequences, delete space permanently']      15s
    Click Button    xpath=//button[text()='I understand the consequences, delete space permanently']
VerifyDelete
    Wait Until Page Contains    Space deleted   15s
    Page Should Not Contain     ${SPACE_NAME}

*** Keywords ***
Open Browser To Login Page
    Open Browser  ${URL}  ${BROWSER}
    Maximize Browser Window

