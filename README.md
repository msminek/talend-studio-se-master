# Alternative Talend Open Studio studio-se-master project

The alternative build project for the Talend Open Studio(s).

The original GitHub project [studio-se-master](https://github.com/Talend/studio-se-master.git) is maintained by Talend.

## Features

- Simply build Talend Open Studio(s).
  - A current stable version is release/7.3.1

## Getting started

1. Prepare git and bash environment.

    On your Windows 10, [Git for Windows](https://gitforwindows.org/) should be easy because you will maybe use git command later :). For more detail, [SDKMAN! installation page](https://sdkman.io/install) would be help you.

1. Install build tool chain.

    [SDKMAN!](https://sdkman.io/) should be easy for all.

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
