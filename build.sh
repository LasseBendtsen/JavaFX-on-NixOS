#!/usr/bin/env bash
set -e

# ==============================
# USER CONFIGURABLE VARIABLES
# ==============================

## How to get your project working:
# 1: Download the JavaFX SDK from https://gluonhq.com/products/javafx/
#    and place it inside your project at: PROJECTNAME./javafx-sdk-21/lib/
#
# 2: Set MODULE_NAME and MAIN_CLASS below to match your project.
#
# 3: Place this script in your project root, next to /src, /out, and /target
#    Run it using: ./build.sh
#
# Bonus:
#   You can organize your resource files like this:
#     /src/main/resources/projectpacman/tiles/pellet.png
#   And access them in code like:
#     new Image(getClass().getResourceAsStream("/projectpacman/tiles/pellet.png"));

# Path to Java source code (module-based)
SRC_DIR="src/main/java"

# Path to resource files
RES_DIR="src/main/resources"

# Output directory for compiled classes
OUT_DIR="out"

# Your module name (as in module-info.java)                 #Change
MODULE_NAME="yourmodulename"

# Fully qualified main class (e.g., yourmodulename.Main)    #Change
MAIN_CLASS="yourmodulename.Main"

# Path to JavaFX SDK lib (relative or absolute)
JAVAFX_LIB_PATH="./javafx-sdk-21/lib"

# ==============================
# BUILD & RUN
# ==============================

echo "Cleaning previous build..."
rm -rf "$OUT_DIR"
mkdir -p "$OUT_DIR"

echo "Compiling Java modules..."
javac \
  --module-source-path "$SRC_DIR" \
  -d "$OUT_DIR" \
  --module "$MODULE_NAME"

echo "Copying resources..."
cp -r "$RES_DIR"/* "$OUT_DIR/"

echo "Launching application..."
java \
  --module-path "$OUT_DIR:$JAVAFX_LIB_PATH" \
  --add-modules javafx.controls,javafx.fxml \
  --patch-module "$MODULE_NAME"="$OUT_DIR" \
  -m "$MODULE_NAME"/"$MAIN_CLASS"
