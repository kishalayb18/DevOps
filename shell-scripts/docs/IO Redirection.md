# I/O Redirection in Linux

## Introduction
I/O (Input/Output) redirection in Linux allows you to control how data flows into and out of commands. This guide covers input redirection, output redirection, and piping, along with best practices.

---

## Types of I/O Redirection
### Standard Streams
Linux treats input and output as streams:
- **stdin (0)** → Standard input (keyboard by default)
- **stdout (1)** → Standard output (screen by default)
- **stderr (2)** → Standard error output (screen by default)

---

## Input Redirection (`<`)
Redirects input from a file instead of the keyboard.
```sh
command < file.txt
```
Example:
```sh
sort < names.txt  # Reads input from names.txt
```

---

## Output Redirection (`>` and `>>`)
Redirects standard output to a file.
### Overwrite (`>`)
```sh
command > file.txt
```
Example:
```sh
echo "Hello World" > output.txt  # Writes "Hello World" to output.txt (overwrites if exists)
```

### Append (`>>`)
```sh
command >> file.txt
```
Example:
```sh
echo "Another line" >> output.txt  # Appends to output.txt without overwriting
```

---

## Error Redirection (`2>`, `2>>`)
Redirects standard error output to a file.
### Overwrite error output
```sh
command 2> error.log
```
### Append error output
```sh
command 2>> error.log
```
Example:
```sh
ls nonexistentfile 2> error.log  # Saves error message to error.log
```

---

## Redirecting Both stdout and stderr
### Save stdout and stderr to separate files
```sh
command > output.log 2> error.log
```
### Save both stdout and stderr to the same file
```sh
command > file 2>&1
```
OR (modern syntax in Bash)
```sh
command &> file
```
Example:
```sh
ls validfile invalidfile &> results.log  # Saves both output and errors to results.log
```

---

## Piping (`|`)
Pipes take the output of one command and pass it as input to another.
```sh
command1 | command2
```
Example:
```sh
ls -l | grep ".txt"  # Filters output of ls to show only .txt files
```

---

## Best Practices
1. **Use append (`>>`) when preserving data** to avoid accidental overwrites.
2. **Redirect errors separately (`2> error.log`)** to troubleshoot command failures.
3. **Combine stdout and stderr (`&> file`)** for a complete log.
4. **Use `/dev/null` (`>/dev/null 2>&1`)** to discard unnecessary output.
5. **Use pipes (`|`) for efficient processing** instead of temporary files.
6. **Check exit status (`$?`) after redirection** to ensure command success.

---


