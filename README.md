# Install Docker and using (PHP 7.2, MariaDB, Centos 7)
**===========SETTING OS===========**

**STEP 1: BOS setting**
> Disable Intel virtualization (Chip set)

**STEP 2: Enable hyper v**

Windows type: Powershell

> Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All 
	
Refer link: https://docs.microsoft.com/en-us/virtualization/hyper-v-on-windows/quick-start/enable-hyper-v

**STEP 3: Install docker**

Refer link: https://docs.docker.com/docker-for-windows/

**STEP 4: Add docker group**
> - Logon to Windows as Administrator
> - Go to Windows Administrator Tools
> - Look for Windows Computer Management and click on it.
> - Or you can skip steps 1, right mouse clicking Computer Management, go to more, and select run as administrator and provide Administrator password.
> - Double click docker-users group and add your account as member.
> - Also add your account to Hyper-V Administrator. This was added when you installed docker for Windows.
> - Log off from Windows and log back on.
> - Click on Windows icon on bottom left and start Docker for Windows. This will start docker windows service.
> - 9 Start Windows Powershell and type docker --version. This is the latest version.

Refer link: https://github.com/docker/for-win/issues/868
	
**STEP 5: Re-login account**

**===========RUN DOCKER===========**

**Build docker**

`docker-compose build`


**Run server**

`docker-compose up`


**Access SSH to server**

`docker exec -it jacpa_server bash`

*Run with winpty when using gitbash*

`winpty docker exec -it jacpa_server bash`
