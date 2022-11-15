# How To Compile An ARM64 File Into x86 Assembly

<p align="center">
    <img src="images/apple-to-intel.jpg" height="300">
</p>

## Introduction

This short tutorial is for anyone who wants to compile to x86 assembly on an ARM64 (apple M1) machine.

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
    > **NOTE**: In this tutorial we are using **Vim editor** because it is a small program that can run in a terminal. But you can use any other editor like nano, visual studio code, or something else.
5. Perfect! We have a C file but is empty, so let's write a simple program (obviously Hello World 🧐):
    ```c
    #include <stdio.h>

    int main(void) {
        printf("Hello World!\n");
        return 0;
    }
    ```
6. After that let's move to the terminal again and write:
    ```
    gcc -S main.c -o main.s
    ```
    we need this to disassemble our C code to get ARM64 assembly code (apple M1).

7. Now we could see inside the directory a file called **main.s** let's open it with an editor:

    ```ARM64
        .section	__TEXT,__text,regular,pure_instructions
        .build_version macos, 13, 0	sdk_version 13, 0
        .globl	_main                           ; -- Begin function main
        .p2align	2
    _main:                                  ; @main
        .cfi_startproc
    ; %bb.0:
        sub	sp, sp, #32
        stp	x29, x30, [sp, #16]             ; 16-byte Folded Spill
        add	x29, sp, #16
        .cfi_def_cfa w29, 16
        .cfi_offset w30, -8
        .cfi_offset w29, -16
        mov	w8, #0
        str	w8, [sp, #8]                    ; 4-byte Folded Spill
        stur	wzr, [x29, #-4]
        adrp	x0, l_.str@PAGE
        add	x0, x0, l_.str@PAGEOFF
        bl	_printf
        ldr	w0, [sp, #8]                    ; 4-byte Folded Reload
        ldp	x29, x30, [sp, #16]             ; 16-byte Folded Reload
        add	sp, sp, #32
        ret
        .cfi_endproc
                                            ; -- End function
        .section	__TEXT,__cstring,cstring_literals
    l_.str:                                 ; @.str
        .asciz	"Hello World!\n"

    .subsections_via_symbols
    ```
8. Now let's build the x86 assembly with the following command:
    ```
    gcc -S -arch i386 main.c -o main.s
    ```
    let's see it:
    ```assembly
        .section	__TEXT,__text,regular,pure_instructions
        .build_version macos, 13, 0	sdk_version 13, 0
        .globl	_main                           ## -- Begin function main
        .p2align	4, 0x90
    _main:                                  ## @main
        .cfi_startproc
    ## %bb.0:
        pushl	%ebp
        .cfi_def_cfa_offset 8
        .cfi_offset %ebp, -8
        movl	%esp, %ebp
        .cfi_def_cfa_register %ebp
        subl	$8, %esp
        calll	L0$pb
    L0$pb:
        popl	%eax
        movl	$0, -4(%ebp)
        leal	L_.str-L0$pb(%eax), %eax
        movl	%eax, (%esp)
        calll	_printf
        xorl	%eax, %eax
        addl	$8, %esp
        popl	%ebp
        retl
        .cfi_endproc
                                            ## -- End function
        .section	__TEXT,__cstring,cstring_literals
    L_.str:                                 ## @.str
        .asciz	"Hello World!\n"

    .subsections_via_symbols
    ```
   
**That's all, easy isn't it?**

# For More Information

* [@flavioCap](https://github.com/flavioCap)
* [@AntonioBerna](https://github.com/AntonioBerna)
