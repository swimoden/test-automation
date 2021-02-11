import appium
import io
from AppiumLibrary import AppiumLibrary
from robot.libraries.BuiltIn import BuiltIn
from base64 import b64encode
from json import dumps
from pathlib import Path
import os
from io import BytesIO
import PIL
from PIL import Image, ImageDraw


def __init__(self):
    """
    Initializing all the Android definitions
    """
    pass


def get_driver_instance(self):
    return self._current_application()

# @keyword(name='Login to BGApp')


def send_image_to_device():

    appiumlib = BuiltIn().get_library_instance('AppiumLibrary')
    driver = appiumlib._current_application()
    driver.implicitly_wait(20)
    dest_path2 = '/sdcard/Download/file.png'
    dest_path1 = '/sdcard/DCIM/Camera/file.png'
    dest_path = '/sdcard/Pictures/file.png'
    image = Image.new("RGB", (300, 50))
    draw = ImageDraw.Draw(image)
    draw.text((0, 0), "Automation test Android")

    byte_io = BytesIO()
    image.save(byte_io, 'PNG')

    imgByteArr = io.BytesIO()
    image.save(imgByteArr, 'PNG')
    imgByteArr = imgByteArr.getvalue()
    base64_bytes = b64encode(imgByteArr)

    base64_string = base64_bytes.decode('utf-8')
    driver.push_file(dest_path, base64_string)
    driver.push_file(dest_path1, base64_string)
    driver.push_file(dest_path2, base64_string)
