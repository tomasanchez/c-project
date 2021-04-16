# C Project Template

This folder contains a [`makefile`](./Makefile) which by defaults builds a `C` project using `GCC` which has the following structure

```
project
│   README.md
│   Makefile
│
└───src
│   *.c
│
└───include
|    *.h
|
└───log
|   *.log
|
└───build
    *.exe
```

## Commands

- **all**: `make` rule runs `comipile` and `run`
- **compile**: `make compile` compiles source files
- **run**: `make run` executes the program
- **leaks**: `make leaks` runs `compile` and runs the program in Valgrind, loggin the result in `log/leaks.log`
- **thbreads**: `make threads` runs `compile` and runs the program in Valgrind with the tool `Hellgrind`
- **clean**: deletes executable
- **cleanLogs**: deletes `log/` folder
- **remove**: runs `clean` and `cleanLogs`
