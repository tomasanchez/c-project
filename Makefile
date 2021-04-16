# C Makefile using gcc, gdb and valgrind. 
# Modified version of Makefile using g++ & gdb by Roberto Nicolas Savinelli <rsavinelli@est.frba.utn.edu.ar>
# Tomas Agustin Sanchez <tosanchez@est.frba.utn.edu.ar>

CC = gcc
CFLAGS = -Wall -Wextra -g3
LIBS =
INCLUDES = -I ./include/
SOURCES = ./src/*.c

OUTPUT = build/a.exe
LEAKS = log/leaks.log
HELGRIND = log/threads.log

all : compile run

.PHONY: all

compile:
	@mkdir -p build
	$(CC) $(CFLAGS) $(SOURCES) $(INCLUDES) $(LIBS) -o $(OUTPUT)

run: compile
	./$(OUTPUT)

debug: compile 
	gdb -se $(OUTPUT)
	
leaks: compile
	@mkdir -p log
	valgrind --leak-check=yes --log-file="$(LEAKS)" --track-origins=yes ./$(OUTPUT)

threads: compile
	@mkdir -p log
	valgrind --tool=helgrind --log-file="$(HELGRIND)" ./$(OUTPUT)

clean:
	$(RM) ./$(OUTPUT)

cleanLogs:
	$(RM) -r log || true

remove: clean cleanLogs