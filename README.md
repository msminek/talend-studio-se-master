# Alternative Talend Open Studio studio-se-master project

The alternative build project for the Talend Open Studio(s).

The original GitHub project [studio-se-master](https://github.com/Talend/studio-se-master.git) is maintained by Talend.

## Features

- Simply build Talend Open Studio(s).

- Successfully builds:
  - 7.2.1 snapshot(master) from Feb 2019 - June 2019
  - 7.3.1 snapshot(master) at Oct 2019
- Failed to builds:
  - tags/release/7.3.1 at Jan 2021
  - tags/release/7.4.1M6 at Jan 2021

## Getting started

1. Prepare git and bash environment.

    With Linux, you simply install git with your package manager.

    If you are on Windows 10, [Git for Windows](https://gitforwindows.org/) should be easy because you will maybe use git command later :). For more detail, [SDKMAN! installation page](https://sdkman.io/install) would be help you. And I also recommend [chocolatey package manager](https://chocolatey.org/) for beginners.

    ```shell-session
    @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"
    choco install -y git zip
    ```

1. Install build tool chain.

    [SDKMAN!](https://sdkman.io/) should be easy for all. Because it supports both Windows and Linux environment.

    ```shell-session
    curl -s "https://get.sdkman.io" | bash
    sdk install java 8.0.282-zulu
    export JAVA_HOME=$HOME/.sdkman/candidates/java/current
    sdk install maven
    ```

    Note: This sample use a PSU version of OpenJDK 8. Notice that Talend only support a CPU version of it.

    On your Windows 10, [chocolatey](https://chocolatey.org/) would be also better choice.

1. Clone this project with ```--recursive``` option.

    ```shell-session
    git clone --recursive https://github.com/msminek/talend-studio-se-master.git
    ```

    if you miss the ```--recursive``` option at cloning, exec below:

    ```shell-session
    cd talend-studio-se-master
    git submodule update --init
    ```

1. Checkout version.

    ```shell-session
    cd talend-studio-se-master
    ./project-init.sh release/7.3.1
    ```

1. Build Talend Open Studios.

    ```shell-session
    ./build-tos.sh
    ```

    A build logs are output at [the logs folder](logs/).

## ToDo

### Too long file names for the Windows platform

It might be cause something trouble, I doubt. I will build at a linux container for the reason.

## FAQ

### I cannot build the current milestone build(s)

The p2 repository for the milestone build is a Talend private repository. So we cannot build.

### I cannot build the old release version(s)

Sometime we cannot build the old version Talend Open Studio(s).

Especialy v5 or older versions, its source repository was on the subversion. I could not build any Talend Open Studio(s) with the subversion repository.

### Which version can I build ?

That I want to know. When the version 7.2 or 7.3, I could build snapshot version with the repositories.

### Where can I found the TOS zip file after build ?

It might be in the build floders something like these:

- studio-se-master/build/talend.studio.tos.bd.product/target/products/
- studio-se-master/build/talend.studio.tos.di.product/target/products/
- studio-se-master/build/talend.studio.tos.dq.product/target/products/
- studio-se-master/build/talend.studio.tos.esb.product/target/products/

## Author

Mineo Kasai <kasai-pb@nec.com>

## License

Copyright 2021 Mineo Kasai

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://www.apache.org/licenses/LICENSE-2.0](http://www.apache.org/licenses/LICENSE-2.0)

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
