*** Settings ***
Library    SeleniumLibrary
Resource    ..//keywords/pages/login_page.robot

*** Keywords ***
Open Website And Login With Username And Password
    [Arguments]     ${username}     ${password}
    login_page.Open login website     
    login_page.Input username      ${username}
    login_page.Input password      ${password}
    login_page.Click login
Open Website And Login Without Password
    [Arguments]     ${username}
    login_page.Open login website     
    login_page.Input username      ${username}
    login_page.Click login
Open Website And Login Without Username
    [Arguments]     ${password}
    login_page.Open login website     
    login_page.Input password      ${password}
    login_page.Click login