# ubuntumate-to-go
## 项目简介
本项目是为了本人快速配置ubuntu-mate-to-go系统而编写的脚本  
关于如何安装一个to-go系统，请参考以下两篇文章：  
[【教学】随身带着走的作业系统 ~Linux作业系统于随身碟~](http://forum.ubuntu.org.cn/viewtopic.php?f=77&t=479162)  
[安装Ubuntu到U盘的方法](http://www.jianshu.com/p/13071c315404)

本人的成品系统简介：  
OS: ubuntu-mate 16.04 64位  
安装介质： 闪迪cz80 64g u盘（推荐读写速度均大于100MB/S的安装介质，否则无法获取与硬盘系统一致的流畅度）  
  

注意事项:

1. 为防止to-go系统的grub与原本可能存在与硬盘的ubuntu系统的grub产生覆盖冲突，应采用以下两种方法之一:
    - 制作liveUSB, 在安装之前拔掉所有硬盘的排线（参考文一的第三步）
    - 创建没有硬盘的虚拟机，用虚拟光驱将要安装的系统的ISO载入，然后进行安装（参考文二）  
        本人采用的虚拟几软件为oracle virtualbox5.1，需要自行安装u盘的扩展
2. 配置后可能会移除`ubuntu-mate`系统自带的`firefox`浏览器以及其他自带软件，请用户自行修改相关的脚本代码  
    附上[google-chrome下载地址](https://www.google.cn/intl/zh-CN/chrome/browser/desktop/index.html)

## 项目功能
本项目实现以下功能
- 修改hosts文件以访问google搜索服务，hosts文件来源于<http://laod.org>
- 配置grub，以屏蔽升级内核时纳入其他系统的引导
- 将系统暂存目录及套件快取目录挂载于记忆体，减少对随身碟的读写和使用容量
- 安装以下软件
    - `vim-gnome`(GVim)
        默认配置`fcitx.vim`以增加`vim`中文编辑的体验  
        如笔者使用搜狗输入法，退出插入模式时不必再切换到英文输入法即可再命令模式使用英文命令
    - `git & git-gui`
    - `zsh`
        默认配置主题为`dieter`,并设置为默认shell
- 移除以下软件
    - `firefox`（使用`chrome`替代）
    - `pluma`（mate默认编辑器，使用`vim`替代）
    - `hexchat``pidgin`(没用过的社交软件）
    - `thunderbird`（使用`gmail`替代)

## 使用方法

1. 在项目主页下载`.zip`文件
2. 解压
3. 切换到`ubuntumate-to-go`目录下，打开终端
4. 编辑`setup.sh`,将其中的`yourusername`替换成电脑用户名并保存
5. 修改权限，让`setup.sh`可以执行，命令如下:

        chmod +x setup.sh

6. 执行`setup.sh`:

        ./setup.sh

7. 重启电脑，配置完成~

