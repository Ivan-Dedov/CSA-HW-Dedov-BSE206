# CMAKE generated file: DO NOT EDIT!
# Generated by "NMake Makefiles" Generator, CMake Version 3.20

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE
NULL=nul
!ENDIF
SHELL = cmd.exe

# The CMake executable.
CMAKE_COMMAND = "C:\Program Files\JetBrains\CLion 2021.1.3\bin\cmake\win\bin\cmake.exe"

# The command to remove a file.
RM = "C:\Program Files\JetBrains\CLion 2021.1.3\bin\cmake\win\bin\cmake.exe" -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = C:\Studies\CSA\HW1

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = C:\Studies\CSA\HW1\cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles\HW1.dir\depend.make
# Include the progress variables for this target.
include CMakeFiles\HW1.dir\progress.make

# Include the compile flags for this target's objects.
include CMakeFiles\HW1.dir\flags.make

CMakeFiles\HW1.dir\main.c.obj: CMakeFiles\HW1.dir\flags.make
CMakeFiles\HW1.dir\main.c.obj: ..\main.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Studies\CSA\HW1\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/HW1.dir/main.c.obj"
	C:\PROGRA~2\MICROS~2\2019\ENTERP~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoCMakeFiles\HW1.dir\main.c.obj /FdCMakeFiles\HW1.dir\ /FS -c C:\Studies\CSA\HW1\main.c
<<

CMakeFiles\HW1.dir\main.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/HW1.dir/main.c.i"
	C:\PROGRA~2\MICROS~2\2019\ENTERP~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe > CMakeFiles\HW1.dir\main.c.i @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Studies\CSA\HW1\main.c
<<

CMakeFiles\HW1.dir\main.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/HW1.dir/main.c.s"
	C:\PROGRA~2\MICROS~2\2019\ENTERP~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoNUL /FAs /FaCMakeFiles\HW1.dir\main.c.s /c C:\Studies\CSA\HW1\main.c
<<

CMakeFiles\HW1.dir\creature.c.obj: CMakeFiles\HW1.dir\flags.make
CMakeFiles\HW1.dir\creature.c.obj: ..\creature.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Studies\CSA\HW1\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/HW1.dir/creature.c.obj"
	C:\PROGRA~2\MICROS~2\2019\ENTERP~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoCMakeFiles\HW1.dir\creature.c.obj /FdCMakeFiles\HW1.dir\ /FS -c C:\Studies\CSA\HW1\creature.c
<<

CMakeFiles\HW1.dir\creature.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/HW1.dir/creature.c.i"
	C:\PROGRA~2\MICROS~2\2019\ENTERP~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe > CMakeFiles\HW1.dir\creature.c.i @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Studies\CSA\HW1\creature.c
<<

CMakeFiles\HW1.dir\creature.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/HW1.dir/creature.c.s"
	C:\PROGRA~2\MICROS~2\2019\ENTERP~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoNUL /FAs /FaCMakeFiles\HW1.dir\creature.c.s /c C:\Studies\CSA\HW1\creature.c
<<

CMakeFiles\HW1.dir\data_loader.c.obj: CMakeFiles\HW1.dir\flags.make
CMakeFiles\HW1.dir\data_loader.c.obj: ..\data_loader.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Studies\CSA\HW1\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/HW1.dir/data_loader.c.obj"
	C:\PROGRA~2\MICROS~2\2019\ENTERP~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoCMakeFiles\HW1.dir\data_loader.c.obj /FdCMakeFiles\HW1.dir\ /FS -c C:\Studies\CSA\HW1\data_loader.c
<<

CMakeFiles\HW1.dir\data_loader.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/HW1.dir/data_loader.c.i"
	C:\PROGRA~2\MICROS~2\2019\ENTERP~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe > CMakeFiles\HW1.dir\data_loader.c.i @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Studies\CSA\HW1\data_loader.c
<<

CMakeFiles\HW1.dir\data_loader.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/HW1.dir/data_loader.c.s"
	C:\PROGRA~2\MICROS~2\2019\ENTERP~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoNUL /FAs /FaCMakeFiles\HW1.dir\data_loader.c.s /c C:\Studies\CSA\HW1\data_loader.c
<<

CMakeFiles\HW1.dir\heap_sort.c.obj: CMakeFiles\HW1.dir\flags.make
CMakeFiles\HW1.dir\heap_sort.c.obj: ..\heap_sort.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=C:\Studies\CSA\HW1\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building C object CMakeFiles/HW1.dir/heap_sort.c.obj"
	C:\PROGRA~2\MICROS~2\2019\ENTERP~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoCMakeFiles\HW1.dir\heap_sort.c.obj /FdCMakeFiles\HW1.dir\ /FS -c C:\Studies\CSA\HW1\heap_sort.c
<<

CMakeFiles\HW1.dir\heap_sort.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/HW1.dir/heap_sort.c.i"
	C:\PROGRA~2\MICROS~2\2019\ENTERP~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe > CMakeFiles\HW1.dir\heap_sort.c.i @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E C:\Studies\CSA\HW1\heap_sort.c
<<

CMakeFiles\HW1.dir\heap_sort.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/HW1.dir/heap_sort.c.s"
	C:\PROGRA~2\MICROS~2\2019\ENTERP~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\cl.exe @<<
 /nologo $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) /FoNUL /FAs /FaCMakeFiles\HW1.dir\heap_sort.c.s /c C:\Studies\CSA\HW1\heap_sort.c
<<

# Object files for target HW1
HW1_OBJECTS = \
"CMakeFiles\HW1.dir\main.c.obj" \
"CMakeFiles\HW1.dir\creature.c.obj" \
"CMakeFiles\HW1.dir\data_loader.c.obj" \
"CMakeFiles\HW1.dir\heap_sort.c.obj"

# External object files for target HW1
HW1_EXTERNAL_OBJECTS =

HW1.exe: CMakeFiles\HW1.dir\main.c.obj
HW1.exe: CMakeFiles\HW1.dir\creature.c.obj
HW1.exe: CMakeFiles\HW1.dir\data_loader.c.obj
HW1.exe: CMakeFiles\HW1.dir\heap_sort.c.obj
HW1.exe: CMakeFiles\HW1.dir\build.make
HW1.exe: CMakeFiles\HW1.dir\objects1.rsp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=C:\Studies\CSA\HW1\cmake-build-debug\CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking C executable HW1.exe"
	"C:\Program Files\JetBrains\CLion 2021.1.3\bin\cmake\win\bin\cmake.exe" -E vs_link_exe --intdir=CMakeFiles\HW1.dir --rc=C:\PROGRA~2\WI3CF2~1\10\bin\100190~1.0\x86\rc.exe --mt=C:\PROGRA~2\WI3CF2~1\10\bin\100190~1.0\x86\mt.exe --manifests -- C:\PROGRA~2\MICROS~2\2019\ENTERP~1\VC\Tools\MSVC\1429~1.301\bin\Hostx86\x86\link.exe /nologo @CMakeFiles\HW1.dir\objects1.rsp @<<
 /out:HW1.exe /implib:HW1.lib /pdb:C:\Studies\CSA\HW1\cmake-build-debug\HW1.pdb /version:0.0 /machine:X86 /debug /INCREMENTAL /subsystem:console  kernel32.lib user32.lib gdi32.lib winspool.lib shell32.lib ole32.lib oleaut32.lib uuid.lib comdlg32.lib advapi32.lib 
<<

# Rule to build all files generated by this target.
CMakeFiles\HW1.dir\build: HW1.exe
.PHONY : CMakeFiles\HW1.dir\build

CMakeFiles\HW1.dir\clean:
	$(CMAKE_COMMAND) -P CMakeFiles\HW1.dir\cmake_clean.cmake
.PHONY : CMakeFiles\HW1.dir\clean

CMakeFiles\HW1.dir\depend:
	$(CMAKE_COMMAND) -E cmake_depends "NMake Makefiles" C:\Studies\CSA\HW1 C:\Studies\CSA\HW1 C:\Studies\CSA\HW1\cmake-build-debug C:\Studies\CSA\HW1\cmake-build-debug C:\Studies\CSA\HW1\cmake-build-debug\CMakeFiles\HW1.dir\DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles\HW1.dir\depend

