*** Settings ***
Library    SeleniumLibrary

*** Keywords ***
Open Login Website
    Go To   https://uat-eordering.central.tech/login
Input Username 
    [Arguments]     ${username} 
    Wait Until Element Is Enabled       //input[@name='username']
    Input Text       //input[@name='username']       ${username}
Input Password
    [Arguments]     ${password}
    Wait Until Element Is Enabled       //input[@name='password']
    Input Text       //input[@name='password']       ${password}
Click Login
    Wait Until Element Is Enabled   //button[@type='submit']
    Click Element    //button[@type='submit'] 
Verify Login Success
    Wait Until Page Does Not Contain Element     //h2[@class='signIn-title-3VO' and .='Sign in to your account']
Verify Login Failed When User Login With Wrong Username And Password 
    Wait Until Element Is Enabled       //div[@class='signIn-signInError-3Fk' and contains(., "ชื่อผู้ใช้งาน และ/หรือ รหัสผ่านไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง")]    10s
    Page Should Contain Element     //div[@class='signIn-signInError-3Fk' and contains(., "ชื่อผู้ใช้งาน และ/หรือ รหัสผ่านไม่ถูกต้อง กรุณาลองใหม่อีกครั้ง")]
Verify Login Failed When Username Is Required Field
    Wait Until Page Contains Element    //div[@class='field-root-pkb' and label[.='Username'] and p[.='ต้องกรอกข้อมูล']]       10s
    Page Should Contain Element     //div[@class='field-root-pkb' and label[.='Username'] and p[.='ต้องกรอกข้อมูล']]
Verify Login Failed When Password Is Required Field
    Wait Until Page Contains Element    //div[@class='field-root-pkb' and label[.='Password'] and p[.='ต้องกรอกข้อมูล']]       10s
    Page Should Contain Element     //div[@class='field-root-pkb' and label[.='Password'] and p[.='ต้องกรอกข้อมูล']]