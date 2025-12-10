# Custom Shell Implementation

A custom Unix shell implementation featuring process management, I/O redirection, piping, job control, and command history. This project builds a foundational understanding of process creation, system calls, and inter-process communication.

## Project Overview

## Learning Objectives

By completing this project, I will:

- Understand process lifecycle (creation, execution, termination)
- Master fundamental system calls (fork, exec, wait, pipe)
- Implement I/O redirection and piping
- Handle signals and job control
- Manage environment variables
- Build robust error handling mechanisms

## Technical Requirements

### Core Features

1. **Command Execution**
   - Execute external programs with arguments
   - Search PATH for executable files
   - Handle absolute and relative paths

2. **Built-in Commands**
   - `cd` - Change directory with error handling
   - `exit` - Exit shell gracefully
   - `env` - Display environment variables
   - `setenv` / `unsetenv` - Modify environment
   - `pwd` - Print working directory

3. **I/O Redirection**
   - Input redirection (`<`)
   - Output redirection (`>`, `>>`)
   - Error redirection (`2>`, `2>>`)
   - Combined redirection

4. **Piping**
   - Single pipe support (`|`)
   - Multiple pipe chaining
   - Error handling for broken pipes

5. **Job Control**
   - Background processes (`&`)
   - Process status tracking
   - Signal handling (SIGINT, SIGTERM, SIGCHLD)

6. **Command History**
   - Store command history
   - Navigate history (up/down arrows)
   - History file persistence

### Advanced Features (Optional)

- Tab completion for commands and filenames
- Command aliases
- Shell scripting support
- Wildcard expansion (`*`, `?`)
- Quote handling (single, double quotes)

## System Calls Reference

| System Call | Purpose |
|-------------|---------||
| `fork()` | Create child process |
| `exec()` family | Execute program |
| `wait()` / `waitpid()` | Wait for child process |
| `pipe()` | Create pipe for IPC |
| `dup2()` | Duplicate file descriptor |
| `signal()` / `sigaction()` | Handle signals |
| `chdir()` | Change directory |
| `getcwd()` | Get current directory |
| `getenv()` / `setenv()` | Environment variables |

## Project Structure

custom-shell/ ├── src/ │ ├── main.c # Entry point and main loop │ ├── parser.c # Command line parsing │ ├── executor.c # Command execution logic │ ├── builtins.c # Built-in command implementations │ ├── redirections.c # I/O redirection handling │ ├── pipes.c # Pipe implementation │ ├── signals.c # Signal handling │ └── history.c # Command history management ├── include/ │ ├── shell.h # Main header file │ ├── parser.h # Parser interface │ ├── executor.h # Executor interface │ └── builtins.h # Built-in commands interface ├── tests/ │ ├── test_parser.c # Parser unit tests │ ├── test_executor.c # Executor unit tests │ └── test_builtins.c # Built-in commands tests ├── docs/ │ ├── DESIGN.md # Design decisions │ ├── API.md # API documentation │ └── TESTING.md # Testing guidelines ├── .gitignore ├── Makefile └── README.md


## Prerequisites

### System Requirements
- Unix-like operating system (Linux, macOS, BSD)
- GCC or Clang compiler
- Make build system
- POSIX-compliant system libraries

### Knowledge Prerequisites
- C programming fundamentals
- Understanding of pointers and memory management
- Basic Unix command line usage
- Familiarity with compilation process

## Installation & Setup

### 1. Clone the Repository
```bash
git clone https://github.com/donshammah96/custom-shell.git
cd custom-shell
```

### 2. Build the Project
```bash
make
```

### 3. Run the Shell
```bash
./shell
```

### 4. Run Tests
```bash
make test
```

### 5. Clean Build Artifacts
```bash
make clean
```

## Development Roadmap

### Week 1: Foundation

- Set up project structure
- Implement basic command parsing
- Execute simple commands (no arguments)
- Implement exit built-in
- Add command loop with prompt

### Week 2: Core Features

- Add argument parsing
- Implement PATH search
- Add built-in commands (cd, pwd, env)
- Implement I/O redirection
- Add basic error handling

### Week 3: Advanced Features

- Implement piping (single pipe)
- Add signal handling
- Implement background processes
- Add command history
- Multi-pipe support

### Week 4: Polish and Testing 

- Comprehensive error handling
- Memory leak detection and fixes
- Unit test coverage
- Documentation completion
- Code cleanup and optimization

## 
