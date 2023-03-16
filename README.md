# FeedMe-ChatGPT
A simple bash script for feeding your entire codebase to ChatGPT in just one prompt! 

## Feed Me!
GPT-4, GPT-3, and GPT-3.5 are very useful tools for gaining insight into the functionality and purpose of code. A challenge however is that it is hard for ChatGPT to understand the context of code that spans across multiple files. While the maximum number of tokens (like words) OpenAI's GPT-3.5 could use for context was only 4096, GPT-4.0 supports 8192 at launch, and up to 32768 tokens through the API, which is large enough to contain the code of some entire codebase(s)!

This script ([`FeedMe.sh`](./FeedMe.sh)) will print the filepath + filename of every code (text) file, a line separator, and the contents of each text file in a given project codebase. It saves this to a file named `allcode.txt`. You can then paste it as a single buffer as a prompt for ChatGPT so it can understand every part of your code and in which file it is located.

```bash
#!/usr/env/bin/bash
find . -type f -not -path '*/\.*' -exec grep -Il '.' {} \; | xargs awk 'FNR==1{print "--------------------------------------------------------------------------------"; print FILENAME; print "--------------------------------------------------------------------------------"; print ""; }{ print; print "" }' > allcode.txt
```

## Usage

Simply `cd` into your desired project's directory, then run [`FeedMe.sh`](./FeedMe.sh):

(abbreviated below for readability)
```bash
bobjoe@mighty-m1 Projects % pwd
/Users/bobjoe/Projects
bobjoe@mighty-m1 Projects % cd MotionParallax
bobjoe@mighty-m1 MotionParallax % pwd
/Users/bobjoe/Projects/MotionParallax
bobjoe@mighty-m1 MotionParallax % ../FeedMe-ChatGPT/FeedMe.sh
bobjoe@mighty-m1 MotionParallax % cat allcode.txt
--------------------------------------------------------------------------------
./CMakeLists.txt
--------------------------------------------------------------------------------

cmake_minimum_required(VERSION 3.5)
project(motion_parallax)
set(CMAKE_CXX_STANDARD 17)
...
--------------------------------------------------------------------------------
./package.xml
--------------------------------------------------------------------------------
<?xml version="1.0"?>
<?xml-model href="http://download.ros.org/schema/package_format3.xsd" schematypens="http://www.w3.org/2001/XMLSchema"?>
...
--------------------------------------------------------------------------------
./src/point.cpp
--------------------------------------------------------------------------------

#include "point.hpp"
namespace motion_parallax {
Point::Point(double x, double y) : x(x), y(y) {}
}
...
```

# Demonstration:

<img width="711" alt="Screenshot 2023-03-16 at 5 04 46 PM" src="https://user-images.githubusercontent.com/25494111/225752541-69e22a23-8508-4ac2-895f-23057e2c4a13.png">

### **...**

<img width="729" alt="Screenshot 2023-03-15 at 5 08 31 PM" src="https://user-images.githubusercontent.com/25494111/225752731-59df9db3-4966-468a-a817-486b19ed4059.png">

<img width="633" alt="Screenshot 2023-03-15 at 5 08 46 PM" src="https://user-images.githubusercontent.com/25494111/225752770-de209c7e-88f6-4bb8-a8b9-d06a09573e27.png">

