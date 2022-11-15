# How To Compile An ARM64 File Into x86 Assembly

- [Introduction](#introduction)
- [Steps](#steps)

<p align="center">
    <img src="images/apple-to-intel.jpg" height="300">
</p>

## Introduction

This short tutorial is for anyone who wants to compile to x86 assembly on an ARM64 machine.

## Steps

1. First of all launch **Terminal.app**
2. Move to the **Desktop** with:
    ```
    cd Desktop
    ```
    > **NOTE**: **cd** means an easy change directory.
3. Now create a working directory with the name you prefer in this tutorial we are going to use **arm64-x86-assembly** and move to it: 
    ```
    mkdir arm64-x86-assembly
    cd arm64-x86-assembly
    ```
    > **NOTE**: **mkdir** means an easy make directory.
4. Then  create a new C file, called **main.c**, with **Vim editor**:
   ```
   vim main.c
   ```
    > **NOTE**: In this tutorial we are using **Vim editor** because ...
4. Nice. 












```
gcc -S -arch i386 main.c -o main.s
```

# For More Information

* [@flavioCap](https://github.com/flavioCap)
* [@AntonioBerna](https://github.com/AntonioBerna)