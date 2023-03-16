# FeedMe-ChatGPT
A simple bash script for feeding your entire codebase to ChatGPT in one buffer 

## Feed Me!
GPT-4, GPT-3, and GPT-3.5 are very useful tools for gaining insight into the functionality and purpose of code. A challenge however is that it is hard for ChatGPT to understand the relationship between multiple different input prompts

This script ([`FeedMe.sh`](./FeedMe.sh)) will print the filepath + filename of every code (text) file, a separator, and the contents of each text file in a given project codebase

```bash
#!/usr/env/bin/bash
find . -type f -not -path '*/\.*' -exec grep -Il '.' {} \; | xargs awk 'FNR==1{print "--------------------------------------------------------------------------------"; print FILENAME; print "--------------------------------------------------------------------------------"; print ""; }{ print; print "" }' > allcode.txt
```

## Usage

Simply `cd` into your desired project's directory, then run [`FeedMe.sh`](./FeedMe.sh):

```bash
```
