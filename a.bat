@echo off
:: 1. 设置控制台为 UTF-8 (用于正确显示 echo 的中文日志)
chcp 65001 >nul

:: 2. 开启延迟变量扩展 (防止特殊字符干扰)
setlocal enabledelayedexpansion

:: 设置目标进程名称
set "processName=StudentMain.exe"

:: 3. 设置路径 (使用你查到的短路径)
:: 注意：PROGRA~2 对应 Program Files (x86)
:: 注意：极域课~1.0 对应 极域课堂管理系统软件v6.0
set "programPath=C:\Program Files (x86)\Mythware\极域课堂管理系统软件v6.0\StudentMain.exe"
:loop
:: 检查进程
tasklist /fi "imagename eq %processName%" 2>nul | find /i "%processName%" >nul

:: 如果未找到，则启动
if errorlevel 1 (
    echo [%date% %time%] 发现 %processName% 未运行，正在启动...
    
    :: 使用 start "" 启动，前面的空引号代表窗口标题，防止路径被误读
    start "" "%programPath%"
)

:: 等待10秒
timeout /t 10 /nobreak >nul
goto loop