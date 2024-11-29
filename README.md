# Command-line Interface (CLI)

## Description

This project implements a command interpreter in MIPS assembly language. The interpreter allows the user to enter commands through the MARS simulator terminal, execute various operations, and display results in the terminal. The available commands include basic operations such as help, file concatenation, song generation, string reversal, matrix determinant calculation, and more.

## Implemented Commands

### 1. `help`
Displays information about the available commands and their options. If called without arguments, it prints a list of the available commands.

**Synopsis:** `help [arg]`

**Arguments:**
- `arg`: Prints the description and options for the specified command `arg`.

### 2. `cat`
Concatenates two files and displays the content on the screen.

**Synopsis:** `cat file1 file2`

**Arguments:**
- `file1`: The first file to concatenate.
- `file2`: The second file to concatenate.

### 3. `exit`
Asks the user if they want to terminate the program execution. If the user confirms, it exits the command interpreter.

**Synopsis:** `exit`

### 4. `mix`
It shows a random song recommendation

**Synopsis:** `mix`

### 5. `rev`
Prints the reverse of a string. If no file is specified, the standard input is used (only one line).

**Synopsis:** `rev [file]`

**Arguments:**
- `file`: The text file to reverse.

### 6. `song`
It plays some notes of the song Sarà perché ti amo by Ricchi e Poveri

**Synopsis:** `song`

### 7. `det`
Calculates the determinant of a matrix of size `n x n` (with `n` between 1 and 3).

**Synopsis:** `det`

### 8. `log`
It allows the user to add a message with the exact time the operation was executed to the specified file. If no file is provided, the message will be saved by default in a file called `log.txt`

**Synopsis:** `log [file]`

**Arguments:**
- `file`: he file where the message should be added.

---

## Example Usage

```asm
Introduce un comando: help
Los comandos disponibles son:
- help
- cat
- exit
- mix
- rev
- song
- det
- log 
Introduce un comando: mix
Bon Jovi - Livin' on a Prayer

Introduce un comando: rev
Introduce una cadena: hello world

dlrow olleh

Introduce un comando: 
```

---



## Project Requirements

### Necessary Software

- **MARS Simulator**: The project is designed to run on the MARS (MIPS Assembler and Runtime Simulator) simulator.
