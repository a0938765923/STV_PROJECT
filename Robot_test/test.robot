*** Settings ***
Library    AppiumLibrary
*** Test Cases ***
TC-16
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0    deviceName=HT4C8WM01683    appPackage=jp.united.app.kanahei.money    appActivity=jp.united.app.kanahei.money.controller.TopActivity    noReset=true
    ${iniTialExpenseValue} =    Get Text    xpath=//*[@resource-id='jp.united.app.kanahei.money:id/expense']
    Click Element Until It Is Visible    xpath=//*[@text='輸入！']
    Click Element Until It Is Visible    xpath=//*[@resource-id='jp.united.app.kanahei.money:id/num5']
    Click Element Until It Is Visible    xpath=//*[@resource-id='jp.united.app.kanahei.money:id/num0']
    Click Element Until It Is Visible    xpath=//*[@resource-id='jp.united.app.kanahei.money:id/decide']
    Click Element Until It Is Visible    xpath=//*[@resource-id='jp.united.app.kanahei.money:id/complete']
    # Wait Until Element Is Visible    xpath=//*[contains(@text,'50')] 
    ${result} =    Get Text    xpath=//*[@resource-id='jp.united.app.kanahei.money:id/expense']
    
    ${spiltValue} =    Evaluate    '${iniTialExpenseValue}'.split("￥",1)[1]
    ${afterAddValue} =    Evaluate    ${spiltValue}+50
    ${afterValueStr} =    Evaluate    "￥"+'${afterAddValue}'
    Should Be Equal    ${result}    ${afterValueStr}
    [Teardown]    Close Application
    # [Teardown]    Run Keywords    name    
    # ...    AND    Close Application
TC-23
    Open Application    http://localhost:4723/wd/hub    platformName=Android    platformVersion=6.0    deviceName=HT4C8WM01683    appPackage=jp.united.app.kanahei.money    appActivity=jp.united.app.kanahei.money.controller.TopActivity    noReset=true
    Click Element    xpath=//*[@text='履歷']
    # @{elements}    Get WebElements    xpath=//*[@resource-id='jp.united.app.kanahei.money:id/expense']
    # Click Element    @{elements}[1]
    # Click Element Until It Is Visible    xpath=//*[@resource-id='jp.united.app.kanahei.money:id/imageView']
    Click Element Until It Is Visible    xpath=//android.widget.ImageView[@resource-id='jp.united.app.kanahei.money:id/imageView']
    # Wait Until Page Contains Element    xpath=//android.widget.ImageView[@resource-id='jp.united.app.kanahei.money:id/imageView']
    # Click Element Until It Is Visible    xpath=//android.widget.ImageView[@resource-id='jp.united.app.kanahei.money:id/edit']
    
    # [Teardown]    Close Application

*** Keywords ***
Click Element Until It Is Visible
    [Arguments]    ${locator}
    Page Should Contain Element    ${locator}
    Wait Until Element Is Visible    ${locator}
    Click Element    ${locator}