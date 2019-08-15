---
layout: post
title:  "powershell_tips"
categories: powershell
---
# Ctrl-R | Reverse History Search
You can search backwards through all the commands you've ever executed with Ctrl-R

```
ctrl-r
bck-i-search: ping
```
Enter to select an entry and run it
Ctrl-R for the next match
Ctrl-Shift-R for the last match 

# $$ | Previous Argument
In Shell, you can use `!$` to refer to the final argument of the last command in your history, you can use `$$` in Powershell to do the same
## Example
```
ping server-name-that-is-too-long
ctrl-c
mstsc /v:$$
```



