import psutil
import subprocess
import time
import os

TARGET_NAME = "StudentMain.exe"
TARGET_PATH = r"C:\Program Files (x86)\Mythware\极域课堂管理系统软件v6.0\StudentMain.exe"

def is_running():
    for proc in psutil.process_iter(['name']):
        try:
            if proc.info['name'] == TARGET_NAME:
                return True
        except:
            pass
    return False

def start_program():
    if os.path.exists(TARGET_PATH):
        subprocess.Popen(TARGET_PATH)
    else:
        print("路径不存在")

def main():
    while True:
        if not is_running():
            start_program()
        time.sleep(5)  # 每5秒检测一次

if __name__ == "__main__":
    main()