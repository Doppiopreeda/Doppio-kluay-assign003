*** Settings ***
Library    SeleniumLibrary
Suite Setup        Open Browser    about:blank    chrome
Suite Teardown     Close All Browsers
Resource    ..//keywords/features/login_feature.robot
Resource    ..//keywords/pages/login_page.robot

*** Test Cases ***
TC001- Verify that when login with correct username and password , system can login success
    login_feature.Open website and login with username and password    preeda.p@doppiotech.com         Welcome9
    login_page.verify login success
TC002- Verify that when login with wrong username / password , system can show proper error
    login_feature.Open website and login with username and password    abcd@doppiotech.com         1234
    login_page.Verify login failed when user login with wrong username and password
TC003- verify that username is required field
    login_feature.Open website and login without username    1234
    login_page.Verify login failed when username is required field
TC004- verify that password is required field
    login_feature.Open website and login without password    abcd@doppiotech.com
    login_page.Verify login failed when password is required field