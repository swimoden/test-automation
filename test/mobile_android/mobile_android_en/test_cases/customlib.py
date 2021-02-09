import appium
from AppiumLibrary import AppiumLibrary
from robot.libraries.BuiltIn import BuiltIn


class customlib(AppiumLibrary):

    def __init__(self):
        """
        Initializing all the Android definitions
        """
        pass

    def get_driver_instance(self):
        return self._current_application()

    # @keyword(name='Login to BGApp')
    def login_to_bgapp(self):

        appiumlib = BuiltIn().get_library_instance('AppiumLibrary')
        driver = appiumlib._current_application()
        driver.implicitly_wait(20)
        dest_path = '/sdcard/Download/file.txt'
        driver.push_file(dest_path, 'Hello World'.encode("utf-8"))
