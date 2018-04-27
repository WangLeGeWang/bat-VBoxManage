@echo off & setlocal enabledelayedexpansion
title BAT - VBoxManage
mode con: cols=60 lines=20
::检测VBoxManage是否可用
:checkVirtualBoxPath
echo %path%|findstr /i "VirtualBox">nul && goto :menu
goto :addVirtualBoxPath
::将VirtualBox添加到环境变量中
:addVirtualBoxPath
cls
echo.检测到您没有将VirtualBox的安装路径添加到path变量中。
set /p yesorno=是否将其添加？(yes or no)
cls
if %yesorno% == yes (
    echo.请输入完整路径或者将VirtualBox文件夹拖入窗口
    echo.:建议直接将VirtualBox文件夹拖入窗口
    set /p VirtualBoxPath=:
    set path=%path%;!VirtualBoxPath!
    goto :checkVirtualBoxPath
)
exit

::主菜单
:menu
cls
echo. 1.查看所有虚拟机
echo. 2.查看正在运行的虚拟机
echo. 3.开启虚拟机后台运行
echo. 4.关闭虚拟机
echo. 5.强制关闭虚拟机
echo. 6.开启虚拟机并开启虚拟机的远程桌面连接
echo. 7.改变虚拟机的远程桌面连接端口
pause>nul & exit
