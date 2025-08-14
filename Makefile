# Define the source and output files
SRC = src/hello.c
APP = app

# The default target runs the build command
.PHONY: all build clean

all: build

# 'build' target: Compiles the C application with the -static flag
# The -static flag ensures all libraries are included in the executable,
# making it runnable in a minimal container without needing to install glibc, etc.
build: $(SRC)
	gcc -static -o $(APP) $(SRC)

# 'clean' target: Removes the compiled executable
clean:
	rm -f $(APP)
