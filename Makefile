# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Default target executed when no arguments are given to make.
default_target: all

.PHONY : default_target

# Allow only one "make -f Makefile2" at a time, but pass parallelism.
.NOTPARALLEL:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /mnt/c/mistminerJT/fastmine

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /mnt/c/mistminerJT/fastmine

#=============================================================================
# Targets provided globally by CMake.

# Special rule for the target rebuild_cache
rebuild_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "Running CMake to regenerate build system..."
	/usr/bin/cmake -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR)
.PHONY : rebuild_cache

# Special rule for the target rebuild_cache
rebuild_cache/fast: rebuild_cache

.PHONY : rebuild_cache/fast

# Special rule for the target edit_cache
edit_cache:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --cyan "No interactive CMake dialog available..."
	/usr/bin/cmake -E echo No\ interactive\ CMake\ dialog\ available.
.PHONY : edit_cache

# Special rule for the target edit_cache
edit_cache/fast: edit_cache

.PHONY : edit_cache/fast

# The main all target
all: cmake_check_build_system
	$(CMAKE_COMMAND) -E cmake_progress_start /mnt/c/mistminerJT/fastmine/CMakeFiles /mnt/c/mistminerJT/fastmine/CMakeFiles/progress.marks
	$(MAKE) -f CMakeFiles/Makefile2 all
	$(CMAKE_COMMAND) -E cmake_progress_start /mnt/c/mistminerJT/fastmine/CMakeFiles 0
.PHONY : all

# The main clean target
clean:
	$(MAKE) -f CMakeFiles/Makefile2 clean
.PHONY : clean

# The main clean target
clean/fast: clean

.PHONY : clean/fast

# Prepare targets for installation.
preinstall: all
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall

# Prepare targets for installation.
preinstall/fast:
	$(MAKE) -f CMakeFiles/Makefile2 preinstall
.PHONY : preinstall/fast

# clear depends
depend:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 1
.PHONY : depend

#=============================================================================
# Target rules for targets named fastmine

# Build rule for target.
fastmine: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 fastmine
.PHONY : fastmine

# fast build rule for target.
fastmine/fast:
	$(MAKE) -f CMakeFiles/fastmine.dir/build.make CMakeFiles/fastmine.dir/build
.PHONY : fastmine/fast

#=============================================================================
# Target rules for targets named crypto_shani

# Build rule for target.
crypto_shani: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 crypto_shani
.PHONY : crypto_shani

# fast build rule for target.
crypto_shani/fast:
	$(MAKE) -f crypto/CMakeFiles/crypto_shani.dir/build.make crypto/CMakeFiles/crypto_shani.dir/build
.PHONY : crypto_shani/fast

#=============================================================================
# Target rules for targets named crypto_avx2

# Build rule for target.
crypto_avx2: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 crypto_avx2
.PHONY : crypto_avx2

# fast build rule for target.
crypto_avx2/fast:
	$(MAKE) -f crypto/CMakeFiles/crypto_avx2.dir/build.make crypto/CMakeFiles/crypto_avx2.dir/build
.PHONY : crypto_avx2/fast

#=============================================================================
# Target rules for targets named crypto_sse4.1

# Build rule for target.
crypto_sse4.1: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 crypto_sse4.1
.PHONY : crypto_sse4.1

# fast build rule for target.
crypto_sse4.1/fast:
	$(MAKE) -f crypto/CMakeFiles/crypto_sse4.1.dir/build.make crypto/CMakeFiles/crypto_sse4.1.dir/build
.PHONY : crypto_sse4.1/fast

#=============================================================================
# Target rules for targets named crypto

# Build rule for target.
crypto: cmake_check_build_system
	$(MAKE) -f CMakeFiles/Makefile2 crypto
.PHONY : crypto

# fast build rule for target.
crypto/fast:
	$(MAKE) -f crypto/CMakeFiles/crypto.dir/build.make crypto/CMakeFiles/crypto.dir/build
.PHONY : crypto/fast

fastmine.o: fastmine.cpp.o

.PHONY : fastmine.o

# target to build an object file
fastmine.cpp.o:
	$(MAKE) -f CMakeFiles/fastmine.dir/build.make CMakeFiles/fastmine.dir/fastmine.cpp.o
.PHONY : fastmine.cpp.o

fastmine.i: fastmine.cpp.i

.PHONY : fastmine.i

# target to preprocess a source file
fastmine.cpp.i:
	$(MAKE) -f CMakeFiles/fastmine.dir/build.make CMakeFiles/fastmine.dir/fastmine.cpp.i
.PHONY : fastmine.cpp.i

fastmine.s: fastmine.cpp.s

.PHONY : fastmine.s

# target to generate assembly for a file
fastmine.cpp.s:
	$(MAKE) -f CMakeFiles/fastmine.dir/build.make CMakeFiles/fastmine.dir/fastmine.cpp.s
.PHONY : fastmine.cpp.s

# Help Target
help:
	@echo "The following are some of the valid targets for this Makefile:"
	@echo "... all (the default if no target is provided)"
	@echo "... clean"
	@echo "... depend"
	@echo "... rebuild_cache"
	@echo "... edit_cache"
	@echo "... fastmine"
	@echo "... crypto_shani"
	@echo "... crypto_avx2"
	@echo "... crypto_sse4.1"
	@echo "... crypto"
	@echo "... fastmine.o"
	@echo "... fastmine.i"
	@echo "... fastmine.s"
.PHONY : help



#=============================================================================
# Special targets to cleanup operation of make.

# Special rule to run CMake to check the build system integrity.
# No rule that depends on this can have commands that come from listfiles
# because they might be regenerated.
cmake_check_build_system:
	$(CMAKE_COMMAND) -S$(CMAKE_SOURCE_DIR) -B$(CMAKE_BINARY_DIR) --check-build-system CMakeFiles/Makefile.cmake 0
.PHONY : cmake_check_build_system
