*** Settings ***
Suite Setup       Open Page
Suite Teardown    Close Browser
Resource          ../../settings/Settings.robot

*** Variables ***
${URL Application}     http://examples.sencha.com/extjs/6.5.0/examples/classic/ticket-app/index.html
${login}                 extJsButton=button[text='Login']
${inputfield password}    extJsTextfield=textfield[name='password']

*** Keywords ***
Open Page
    Add Location Strategy    extJs               return window.document.getElementById((Ext.ComponentQuery.query(arguments[0])[0]).getId());
    Add Location Strategy    extJsButton         return window.document.getElementById((Ext.ComponentQuery.query(arguments[0])[0]).btnEl.id);
    Add Location Strategy    extJsTextfield      return window.document.getElementById((Ext.ComponentQuery.query(arguments[0])[0]).getInputId());
    Open Browser    ${URL Application}    ${browser}    mainbrowser
    Log System Info
    Log Remote Session Id
    Log Remote Capabilities

*** Test Cases ***
Buy Ticket
    Wait Until Page Contains Element    ${inputfield password}
    Input Text    ${inputfield password}    password
    Capture Page Screenshot    images${/}screenshot1.png
    Click Element    ${login}
    Capture Page Screenshot    images${/}screenshot2.png
