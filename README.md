# JavaFX on NixOS

A short guide to getting **JavaFX** projects running on **NixOS** using a development shell.  
Ideal for the project in Object Oriented Programming. If you use JavaFX

## Requirements

- Nix package manager
- JDK (version 17 or later)
- JavaFX SDK (downloaded manually from GluonHQ)
- A modular Java project (with `module-info.java`)

## 1. Download JavaFX

Download the JavaFX SDK for your platform from [GluonHQ](https://gluonhq.com/products/javafx/), and extract it into your project:

<pre> ``` project-root/ 
    my-javafx-project/
    ├── javafx-sdk-21/
    │ └── lib/ ``` </pre>

## 2. Place the nix-shell provided `shell.nix`

Place it somewhere you like, such as /home/user/nix-shells/javafx/ \n
Run it as "nix-shell", first time it will download resources

you can replace the pkgs.jdk21 with something else if you use another version, and add additional libraries if you need

## 3 Place the module-info.java

Enter your project name in it, and place under /main/java/"projectname"

Example of where it should be placed:
/Java_Project-Pacman/pacman/src/main/java/projectpacman

Read the file to see the info there too

the final file could look like :
module projectpacman {
    requires javafx.controls;
    requires javafx.graphics;
    exports projectpacman;
}


## 4. Modify the build.sh for your project

You mainly need to change 

MODULE_NAME="yourmodulename"

&

MAIN_CLASS="yourmodulename.Main"

Place it in your project alongside your /src, /out, and /target

## 5. Run the shell script "build.sh"

Assuming you are in the live nix-shell java environment, and you are in the correct folder where you placed the script
run it as "./build.sh" and it will compile and run your project

If you have questions, write to me on Discord


