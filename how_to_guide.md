Hey,
This is my "How to Guide" to solve the assignment.
Please note, "Prepare local computer" section was written for MacOS.
If something doesnt work for you, google it :). 

# Fork and pull from github the repository.
    Create local folder and initialize git " Git init . "
    Pull the repo, E.G: git pull https://github.com/RefaelSach/maven-hello-world.git

# Prepare local computer for java and maven
## Install java if not installed on you're computer.
    For MacOS: https://jdk.java.net/23/
    After downloading unzip and move to java folder (See how to below, disregard the file names, it could be different for you depending on version you downlaoded)
    $ tar -xvf openjdk-23.0.1_macos-x64_bin.tar.gz
    $ sudo mv jdk-23.0.1.jdk /Library/Java/JavaVirtualMachines/
    Then check java version (java -version)
    should see somthing similar to:

    penjdk version "23.0.1" 2024-10-15
    OpenJDK Runtime Environment (build 23.0.1+11-39)
    OpenJDK 64-Bit Server VM (build 23.0.1+11-39, mixed mode, sharing)

## Install maven
    Download bin file from https://maven.apache.org/download.cgi
    Since we are using MacOS, edit .zshrc file instead of bash_profile file
    Add the following commands:

    export M2_HOME="/Users/refaelsachevsky/Downloads/apache-maven-3.9.9"
    PATH="${M2_HOME}/BIN:${PATH}"
    export PATH

    check version using (mvn -verison)
    should see something similar to

    Apache Maven 3.9.9 (8e8579a9e76f7d015ee5ec7bfcdc97d260186937)
    Maven home: /Users/refaelsachevsky/Downloads/apache-maven-3.9.9
    Java version: 23.0.1, vendor: Oracle Corporation, runtime: /Library/Java/JavaVirtualMachines/jdk-23.0.1.jdk/Contents/Home
    Default locale: en_GB, platform encoding: UTF-8
    OS name: "mac os x", version: "15.1", arch: "x86_64", family: "mac"

# Section 4 (Change the code:)

## Add you're name to Hello World message
    Go to path "myapp/src/main/java/com/myapp"
    Edit 'App.java' file and append youre name to print command (System.out.println())

## Set Jar version to 1.0.0
    Edit open.xml file
    Look for the <version> tag which is located under <project> tag.
    In our case its "<version>1.0-SNAPSHOT</version>" edit the line to <version>1.0.0</version>


# Section 5 (create a pipeline)


## Compiling errors
1) I received errors when initial compiling,
Errors:
[ERROR] Source option 7 is no longer supported. Use 8 or later.
[ERROR] Target option 7 is no longer supported. Use 8 or later.

Edited both lines from 1.7 to 1.8 
Old   <maven.compiler.source>1.7</maven.compiler.source>    -----> New  <maven.compiler.source>1.8</maven.compiler.source>
Old   <maven.compiler.target>1.7</maven.compiler.target>    -----> New  <maven.compiler.source>1.8</maven.compiler.source>
