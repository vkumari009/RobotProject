*** Settings ***
Library    SeleniumLibrary    

Suite Setup    Log        i am inside test suite set up
Suite Teardown    Log    i am inside test suite tear down
Test Setup    Log    i am inside test setup 
Test Teardown    Log    i am inside test teardown       
 


*** Test Cases ***
FirstTestCase
    [Documentation]    First test
    Open Browser    ${URL}    chrome
    Set Browser Implicit Wait    5
      LoginKW 
    Click Element    id=account-job
    Click Element    link=Logout     
    Log    This test was executed by %{username} on %{os}    
    Close Browser

SecondTestCase
    Log    second test case

*** Variables ***
${URL}      https://orangehrm-demo-6x.orangehrmlive.com/auth/login   
@{CREDENTIAL}    admin    admin123  
&{Logincred}    username=admin    password=admin123

*** Keywords ***
LoginKW
    Input Text    id=txtUsername    @{CREDENTIAL}[0]
    Input Password    id=txtPassword    &{Logincred}[password]
    Click Button    id=btnLogin 