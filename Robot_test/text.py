# import unittest
desired_caps = {}
desired_caps['platformName'] = 'Android'
desired_caps['platformVersion'] = '8.1'
desired_caps['automationName'] = 'uiautomator2'
desired_caps['deviceName'] = 'Android Emulator'
# desired_caps['app'] = PATH('../../../apps/selendroid-test-app.apk')

driver = webdriver.Remote('http://localhost:4723/wd/hub', desired_caps)