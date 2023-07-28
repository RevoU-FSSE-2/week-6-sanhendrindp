[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-24ddc0f5d75046c5622901739e7c5dd533143b0c8e959d652212380cedb1ea36.svg)](https://classroom.github.com/a/nj7iw4Wb)

# What is Docker?

Docker is a software platform that allows you to build, test, and deploy applications in a **containers** to run on the host operating system.

<p align="center">
    <img src="images/installing/docker architecture.png" width="450">
    <br>
    <em>Docker Architecture</em>
</p>

# What are Containers?

A long time ago before there was Docker, we know about Virtual Machines (like VMware for example) to run software applications, where VM run applications inside a guest Operating System, which runs on virtual hardware powered by the server's host OS.

<p align="center">
    <img src="images/installing/virtual machines diagram.png" width="450">
    <br>
    <em>Diagram of Virtual Machines</em>
</p>

The problem using VM is the slow process of creating the VM itself, it also takes time to boot into the operating system in the VM.

Different when using VM, containers use the host operating system itself (no need to install another OS like using VM). So, containers will be more resource efficient and run faster than using a VM.

<p align="center">
    <img src="images/installing/docker container diagram.png" width="400">
    <br>
    <em>Diagram of Docker Container</em>
</p>

# Installing Docker

Docker runs natively on Linux operating system. So, for Windows or Mac users, we need to install the Docker app called **Docker Desktop**.

1. To install Docker Desktop, go to <a href="https://www.docker.com/">Docker</a> website.

2. Click Download Docker Desktop (it depend on what OS you used, in this case, i used Windows).

<p align="center">
    <img src="images/installing/1.PNG" width="450">
</p>

3. After download finished, install Docker Desktop, restart your PC, then run the app.

<p align="center">
    <img src="images/installing/2.PNG" width="700">
</p>

4. If you encounter something like the image show below, it means Docker Desktop requires a newer WSL kernel version install to your PC.

<p align="center">
    <img src="images/installing/4.PNG" width="450">
</p>

5. To install newer WSL kernel version to your PC, open your powershell, then type the command **wsl.exe --install** or **wsl.exe --update**.

6. After that, set WSL 2 as your default version. Type the command **wsl --set-default-version 2**.

7. Docker Desktop is ready to use.

<p align="center">
    <img src="images/installing/9.PNG" width="450">
</p>

8. You can also verify your Docker Desktop installation using command **docker --version**.

<p align="center">
    <img src="images/installing/10.PNG" width="500">
</p>

# Dockerize Node.js Project

To dockerize project, we need to build docker image. Docker image is a file used to execute code in a docker container, which is in this case, we need Node.js image.

To build docker image, we need to create **Dockerfile** inside our code. Dockerfile is a text file that contains commands to create a docker image.

### Create package.json

Before we build our Dockerfile, the first thing we need to do is to create package.json file that decribes the app and its dependencies.

<p align="center">
    <img src="images/build/7.PNG" width="400">
</p>

### Create a Dockerfile

Now we create our Dockerfile which will assemble an Node.js image. Here is the format of the Dockerfile:

```Dockerfile
# Comment
INSTRUCTION arguments
```

Step to create Dockerfile:

1. First, we need to define what image we want to build from (in this case Node.js). I used slim version of node that available from the <a href="https://hub.docker.com/">Docker Hub</a>.

<p align="center">
    <img src="images/build/8.PNG" width="500">
</p>

2. **This is optional**, i use LABEL to provide additional information on the image we created. This LABEL information will be visible later when using the inspect command.

<p align="center">
    <img src="images/build/9.PNG" width="500">
</p>

3. Next, create a directory to hold the application code inside the image. For example, i created app as my working directory like the code below.

<p align="center">
    <img src="images/build/10.PNG" width="500">
</p>

4. Used COPY to copying all .json file. The image will comes with Node.js and NPM already installed, so we will use RUN npm install.

<p align="center">
    <img src="images/build/11.PNG" width="500">
</p>

5. Again with COPY instruction, now we bundle the app source code inside the docker image.

<p align="center">
    <img src="images/build/12.PNG" width="500">
</p>

6. The app will be bound to port 3001, so use EXPOSE instruction.

<p align="center">
    <img src="images/build/13.PNG" width="500">
</p>

7. Lastly, with CMD, define the command to run the app during the docker container process later.

<p align="center">
    <img src="images/build/14.PNG" width="500">
</p>
