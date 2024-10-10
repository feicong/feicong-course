# 安卓动态分析沙箱技能宇宙

<details>
 
 <summary>技能宇宙</summary>
 
<img width="1433" alt="安卓动态分析沙箱技能宇宙" src="https://github.com/user-attachments/assets/ca27f8bd-a9be-44db-92b9-cc015adf191f">

</details>


## eBPF安全开发与攻防对抗系列课程


eBPF系列课程尽可能全面的探索eBPF功能与特性。

<details>
 
 <summary>eBPF课程简介</summary>
 
### eBPF课程简介

本课程由简到难，循序渐进，目前设定正式课程共三季内容，84节课程内容，课程根据难度，每集时长约**15**分钟到**120**分钟不等。

课程分为Linux eBPF开发篇，安卓eBPF开发篇，安卓安全对抗篇。具体参见下面课程大纲的思维导图。

本课将带领学员重点学习Linux平台上的eBPF软件开发技术，安卓平台上的eBPF开发与安全对抗。

包含不限于：

- 1. eBPF功能特性
- 2. eBPF MAP数据结构
- 3. eBPF内核helpers方法的使用
- 4. eBPF的程序类型
- 5. bcc/bpftrace/libbpf的API接口与实例
- 6. eBPF功能实战

</details>

<details>
 
 <summary>eBPF特性与课程索引对应表</summary>
 
### eBPF特性与课程索引对应表

<a href="./eBPF特性与课程索引对应表.md"><img width="1527" alt="image" src="https://user-images.githubusercontent.com/1672927/216501444-9a9d2325-bb8d-4d44-8f50-b7a7051aa378.png"></a>


[点击查看完整eBPF特性与课程索引对应表](./eBPF特性与课程索引对应表.md)

</details>

<details>
 
 <summary>eBPF课程目标</summary>

### eBPF课程目标

完成本课的学习后，您将具备以下能力：

- Linux平台eBPF工具的技术原理与开发能力
- Linux平台上eBPF恶意软件分析能力
- 安卓内核的修改与定制能力
- 安卓平台抓包软件开发
- 自己动手完成eBPF的安全分析环境构建
- 使用eBPF完成安卓App hook
- 使用eBPF完成沙箱环境改机安全对抗

</details>

### eBPF课程目录

<details>
 
<summary>eBPF基础入门课</summary>

<img width="1128" alt="eBPF基础入门课" src="https://github.com/feicong/ebpf-course/assets/1672927/ab55c12c-6fad-4a36-8fa8-b491a943e036">

</details>

<summary>eBPF全季课程</summary>

<img width="2007" alt="eBPF安全开发与攻防对抗系列课程- 非虫" src="https://github.com/user-attachments/assets/877916c1-5893-45b0-bc36-e0f7f6b65a67">


<details>
 
<summary>eBPF课程试看</summary>


### eBPF课程试看

[环境搭建](https://mp.weixin.qq.com/s/wGAwcg8VnB4PLREzdNPWng)

<a href="https://mp.weixin.qq.com/s/wGAwcg8VnB4PLREzdNPWng"><img height="400" width="600" alt="环境搭建" src="https://user-images.githubusercontent.com/1672927/216503861-7a02f13f-6410-4cca-a555-0f190f8ed1fa.png"></a>

eBPF程序类型之Socket过滤器

<a href="https://mp.weixin.qq.com/s/mNUxNAmHS-FyF_geK8WlEg"><img height="400" width="600" alt="eBPF程序类型之Socket过滤器" src="https://user-images.githubusercontent.com/1672927/216871910-e83e9903-720a-47e5-b3bb-41b4657edfe0.png"></a>

</details>

<details>
 
 <summary>eBPF课程答疑</summary>

### eBPF课程答疑

1、授课方式，更新进度，多久可以学完?

课程采用录播授课，每位学员单独的本地学习环境。为保证课程质量，更新频率初步定为一周两节，大型节假日每周多更新一到两节。eBPF前三季正式课已经更新完成，第四季往后会不定时更新福利课。更新完课程后，学员可以继续学习，直到学会为止。

2、我需要准备什么学习环境与设备吗?

课程会提供Ubuntu22.04的虚拟机镜像，供学员快速搭建开箱即用的学习环境。

学习环境需要**一台Windows操作系统电脑**，课程实验环境可以选择安装Ubuntu22.04系统的虚拟机，或者另外准备好一台安装好Ubuntu22.04系统的电脑也可。

对于第二季与第三季的学员，课程会安卓eBPF的学习环境的镜像环境。可以选择**模拟器/ARM64开发板/ARM云主机**等环境安装部署。。如果你手上有安卓设备（Pixel 6）或以上设备在手，也可以作为学习辅助设备。

3、学习需要什么必备的编程基础与知识储备?

学习课程中的内容，需要使用到C、Python、Golang等编程语言，课程基本不涉及C++语言。

课程中大量使用C语言来实现课程内容中讲解的功能。学员需要对C语言熟悉。课程涉及到的Python与Golang语言的内容，不熟悉可以使用C语言版本的程序代替，但掌握这两门语言可以让您学习更加轻松。

除此外，学员还需要对Linux/安卓的软件基本开发流程熟悉，对Linux内核有基本的认识。这些知识课程中也有提供参考资料指导。

4. 我主要学手机端，这个课程需要单独买个学习手机不？

课程提供了虚拟机与模拟器环境，全部代码测试保证可以运行的安卓内核环境为5.10版本。安卓5.4的内核需要编译修改内核来支持代码运行，不保证所有代码可以低版本内核运行。如果不想购买开发板或新版本手机，可以在模拟器环境中学习。

**注意：Pixel6手机可跑全部代码，其它gki2.0内核手机与模拟器环境，第四季部分代码需要自己适配。**

</details>

---


## App隐私合规与安全分析探针实战课程


### 课程目录


<details>
 
<summary>App隐私合规与代码分析探针实战课程</summary>

<img width="1352" alt="App隐私合规与代码分析探针实战课程" src="https://github.com/feicong/ebpf-course/assets/1672927/b52390df-9bf2-4a23-b164-a163d58f1fea">


</details>


<details>
 
 <summary>课程试看</summary>
 

### 课程试看

课程目录设计

<a href="https://mp.weixin.qq.com/s/s_t3hgfVGJcpxWFUHzkSfQ"><img height="400" width="600" alt="App隐私合规与安全分析探针实战课程" src="https://user-images.githubusercontent.com/1672927/218050607-72aed515-a33a-4217-aa4c-658fcb970acb.png"></a>

</details>

<details>
 
 <summary>课程受众人员</summary>
 
### 课程受众人员

- 隐私合规从业人员
- App逆向分析人员
- 安全沙箱开发人员
- 安全爱好者
- 爬虫与反爬相关从业人员
- 业务风控从业人员

</details>

<details>
 
 <summary>课程目标</summary>

### 课程目标

完成本课的学习后，您将具备以下能力：

- Frida一些高级功能的使用
- 使用Frida快速调试API的技巧
- 网络安全相关的法律法规
- 安卓设备指纹API接口的认识
- 安卓设备指纹API接口数据的获取
- 自己动手打造隐私合规数据采集工具
- 不同版本中敏感API差异
- 安卓敏感行为的分析

</details>


---


## 安卓系统定制实战课程（安卓12/13）


### 课程目录

<img width="1449" alt="安卓系统定制实战课程- 非虫" src="https://github.com/user-attachments/assets/0687e9ab-3579-46e8-9f21-bfe92368c138">


### 课程目标

完成本课的学习后，您将具备以下能力：

- 安卓系统源码下载编译修改的技能
- 安卓内核源码开发调试的能力
- 安卓内核模块开发调试的能力
- 安卓系统源码的规范管理
- 构建自己专属的安卓系统能力
- 改造安卓框架添加分析功能的能力
- 云手机的了解与制作基础
- 改造安卓集成安全分析工具的能力

</details>


---


## 购买课程

**目前开学季课程活，限直接联系本人微信feicongcn购买的学员，课程的播放需要微信绑定设备授权与签署保密协议**

<details>
 
 <summary>课程价格</summary>
 
### 课程目前价格

eBPF课程全季（含第1、2、3、4、5**季），个人价格**3799**元，企业价格**4699**元。

App隐私合规与安全分析探针实战课程全季（含第1、2、3季），价格**1499**元。

安卓系统定制实战课程全季（含第1、2、3季），全季价格**1499**元。

</details>


### 课程发布与更新

eBPF系列课程全季已完结。

App探针实战课程全季已完结。

安卓系统定制实战课程全季已完结。


### 课程配套学习设备购买

**学习过程中用到eBPF开发与系统定制的运行环境，可以选择课程中提供的虚拟机与模拟器环境完成多数的基础学习，我这里也提供配置好的完整特性开箱即用的设备，新手与懒人建议购买。**

<details>
 
 <summary>设备购买</summary>
 
全新开发板orangepi 3b 8g+512g ssd+5v3a电源+外壳风扇+网线与螺丝工具，以及配套的配置文档。价格**795**元。

全新开发板orangepi 5plus 32g+512g ssd+5v4a电源+外壳风扇+wifi6网卡+网线与螺丝工具，以及配套的配置文档。价格**2165**元。

全新开发板orangepi 5plus 16g+512g ssd+5v4a电源+外壳风扇+wifi6网卡+网线与螺丝工具，以及配套的配置文档。价格**1665**元。

全新开发板orangepi 5plus 16g+64g tf+5v4a电源+外壳风扇+wifi6网卡+网线与螺丝工具，以及配套的配置文档。价格**1450**元。

全新开发板orangepi 5max 16g+512g ssd+5v4a电源+外壳风扇+网线与螺丝工具，以及配套的配置文档。价格**1565**元。

全新开发板orangepi 5max 16g+64g tf+5v4a电源+外壳风扇+网线与螺丝工具，以及配套的配置文档。价格**1350**元。

全新开发板rock 5b+ 24g+512g ssd+pd电源+外壳风扇+网线与螺丝工具，以及配套的配置文档。价格**1965**元。

全新开发板rock 5b+ 24g+64g tf+pd电源+外壳风扇+网线与螺丝工具，以及配套的配置文档。价格**1750**元。

Pixel6 128g刷好自定义eBPF内核开发环境的设备。价格**1150**元。

</details>


## 说明

eBPF系列课程学习过程中涉及的安卓环境搭建：

使用Pixel6设备，环境搭建可参考eBPF第3季7集与第6季3集。

使用CuttleFish模拟器，环境搭建可以参考eBPF第2季1集。

使用arm开发板，环境搭建可以参考eBPF第2季2集与第4季6集。


## 注意

**视频课程由于性质原因，代码与课程一旦发放，不支持任何理由的退款，购买前请知晓！**

所有签署保密协议的eBPF学员，可学完前3季后，免费观看第4季以及后面的内容，没有所有签署保密协议的朋友需要签署后才可以观看，否则视为放弃福利。


## 微信公众号/星球

<details>
 
 <summary>关注微信公众号</summary>

<img width="166" alt="image" src="https://github.com/feicong/ebpf-course/assets/1672927/a3f4468c-3532-41fe-9474-eb0f2bb97dc6">

![518455128484T4](https://github.com/feicong/ebpf-course/assets/1672927/1a47f3f4-b9b2-43fb-82f6-d82bc38b623b)

</details>

