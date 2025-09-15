#locating dependencies
CFLAGS +=-Ideps 
#linux dependencies
DEFS +=-D_GNU_SOURCE
CFLAGS +=-pthread
LIBS +=-lX11 -lXi -lXcursor -lGL -ldl -lm
#backend
DEFS+=-DSOKOL_GLCORE 

#so that compile_flags adds de defs
CFLAGS += ${DEFS}

ifeq ($(backend), gles3)
	LIBS+=-lEGL
endif 

main: src/main.c
	clang -o main ${CFLAGS} ${LIBS} src/main.c 

run: main
	@./main

compile_flags.txt: 	
	@echo "Generating compile_flags.txt"
	@echo ${CFLAGS} | tr ' ' '\n' > $@