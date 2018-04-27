@echo off & setlocal enabledelayedexpansion
title BAT - VBoxManage 吾爱破解 www.52pojie.cn
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
title BAT - VBoxManage 吾爱破解 www.52pojie.cn
cls
echo.------------------------------------------------------------
echo. 1.查看所有虚拟机
echo. 2.查看正在运行的虚拟机
echo. 3.启动虚拟机
echo. 4.开启虚拟机后台运行
echo. 5.关闭虚拟机
echo. 6.强制关闭虚拟机
echo. 7.开启虚拟机并开启虚拟机的远程桌面连接
echo. 8.改变虚拟机的远程桌面连接端口
echo. 9.更多...
echo. 0.退出
echo.------------------------------------------------------------

::等待输入
:inputNum
::if exist "%SystemRoot%\System32\choice.exe" goto :choice
set /p num=请输入数字并按回车键确认:
if %num%==1 goto :lsAll
if %num%==2 goto :lsRuning
if %num%==3 goto :startVms
if %num%==4 goto :startVmsTypeHeadless
if %num%==5 goto :stopVms
if %num%==6 goto :vmsPoweroff
if %num%==7 goto :vrdp
if %num%==8 goto :changeVmsVrapPort
if %num%==9 goto :more
if %num%==0 goto :end
cls
echo 您输入有误，请重新选择。
ping 127.0.1 -n "2">nul
goto :menu
:choice
choice /c 12345678 /n /m "请输入相应数字："
if errorlevel 1 goto :lsAll
if errorlevel 2 goto :lsRuning
if errorlevel 3 goto :startVms
if errorlevel 4 goto :startVmsTypeHeadless
if errorlevel 5 goto :stopVms
if errorlevel 6 goto :vmsPoweroff
if errorlevel 7 goto :vrdp
if errorlevel 8 goto :changeVmsVrapPort
if errorlevel 9 goto :more
if errorlevel 0 goto :end
goto :menu
pause>nul & exit

::查看所有虚拟机
:lsAll
title 查看所有虚拟机
cls
echo.------------------------------------------------------------
VBoxManage list vms
echo.------------------------------------------------------------
goto :back

::查看正在运行的虚拟机
:lsRuning
title 查看正在运行的虚拟机
cls
echo.------------------------------------------------------------
VBoxManage list runningvms
echo.------------------------------------------------------------
goto :back

::开启虚拟机
:startVms
title 开启虚拟机
cls
set /p name=请输入虚拟机名称: 
echo.------------------------------------------------------------
VBoxManage startvm %name%
echo.------------------------------------------------------------
goto :back

::开启虚拟机后台运行
:startVmsTypeHeadless
title 开启虚拟机后台运行
cls
set /p name=请输入虚拟机名称: 
echo.------------------------------------------------------------
VBoxManage startvm %name% --type headless
echo.------------------------------------------------------------
goto :back

::关闭虚拟机
:stopVms
title 关闭虚拟机
cls
set /p name=请输入虚拟机名称: 
echo.------------------------------------------------------------
VBoxManage controlvm %name% acpipowerbutton
echo.------------------------------------------------------------
goto :back

::强制关闭虚拟机
:vmsPoweroff
title 强制关闭虚拟机
cls
set /p name=请输入虚拟机名称: 
echo.------------------------------------------------------------
VBoxManage controlvm %name% poweroff
echo.------------------------------------------------------------
goto :back

::开启虚拟机并开启虚拟机的远程桌面连接
:vrdp
title 开启虚拟机并开启虚拟机的远程桌面连接
cls
set /p name=请输入虚拟机名称(默认端口:3389): 
echo.------------------------------------------------------------
VBoxManage startvm %name% --type vrdp
echo.------------------------------------------------------------
goto :back

::改变虚拟机的远程桌面连接端口
:changeVmsVrapPort
title 改变虚拟机的远程桌面连接端口
cls
set /p name=请输入虚拟机名称: 
set /p port=请输入端口:: 
echo.------------------------------------------------------------
VBoxManage controlvm %name% vrdpprot %port%
echo.------------------------------------------------------------
goto :back

::更多
:more
title 更多
cls
echo.------------------------------------------------------------
echo. 自行网上搜索或者在控制台输入 VBoxManage -h
echo.------------------------------------------------------------
goto :back

::返回菜单
:back
echo.
echo.按任意键返回菜单 & pause>nul
goto :menu

::exit
:end
cls & echo 谢谢使用！
ping 127.0.1 -n "2">nul
exit

::出自 吾爱破解 www.52pojie.cn 52P
