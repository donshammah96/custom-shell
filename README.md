# Custom Shell Implementation

A custom Unix shell implementation featuring process management, I/O redirection, piping, job control, and command history. This project builds a foundational understanding of process creation, system calls, and inter-process communication.

## Project Overview

This project is a fully-functional Unix shell implementation written in C. It provides an interactive command-line interface that mimics the behavior of popular shells like bash and zsh. The shell supports essential features including command execution, I/O redirection, pipelines, background process management, and built-in commands.

The implementation focuses on understanding low-level system programming concepts, including process management, file descriptors, inter-process communication, and signal handling. This project serves as an excellent learning tool for systems programming and operating system concepts.

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
|-------------|---------|
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

```
custom-shell/
├── src/
│   ├── main.c              # Entry point and main loop
│   ├── parser.c            # Command line parsing
│   ├── executor.c          # Command execution logic
│   ├── builtins.c          # Built-in command implementations
│   ├── redirections.c      # I/O redirection handling
│   ├── pipes.c             # Pipe implementation
│   ├── signals.c           # Signal handling
│   └── history.c           # Command history management
├── include/
│   ├── shell.h             # Main header file
│   ├── parser.h            # Parser interface
│   ├── executor.h          # Executor interface
│   └── builtins.h          # Built-in commands interface
├── tests/
│   ├── test_parser.c       # Parser unit tests
│   ├── test_executor.c     # Executor unit tests
│   └── test_builtins.c     # Built-in commands tests
├── docs/
│   ├── DESIGN.md           # Design decisions
│   ├── API.md              # API documentation
│   └── TESTING.md          # Testing guidelines
├── .gitignore
├── Makefile
└── README.md
```

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

## Usage Examples

### Basic Commands

```bash
# Simple command execution
$ ls
file1.txt  file2.txt  directory/

# Command with arguments
$ ls -la /home
total 12
drwxr-xr-x  3 root root 4096 Jan 1 12:00 .
drwxr-xr-x 20 root root 4096 Jan 1 12:00 ..
drwxr-xr-x  5 user user 4096 Jan 1 12:00 user

# Using absolute paths
$ /bin/echo "Hello, World!"
Hello, World!

# Using PATH search
$ echo "Hello from PATH"
Hello from PATH
```

### I/O Redirection Examples

```bash
# Output redirection (overwrite)
$ echo "Hello, World!" > output.txt
$ cat output.txt
Hello, World!

# Output redirection (append)
$ echo "Another line" >> output.txt
$ cat output.txt
Hello, World!
Another line

# Input redirection
$ wc -l < input.txt
42

# Error redirection
$ ls /nonexistent 2> error.log
$ cat error.log
ls: cannot access '/nonexistent': No such file or directory

# Combined redirection
$ command < input.txt > output.txt 2> error.log
```

### Piping Examples

```bash
# Simple pipe
$ ls -l | grep ".txt"
-rw-r--r-- 1 user user 1234 Jan 1 12:00 file.txt

# Multiple pipes
$ cat file.txt | grep "pattern" | sort | uniq
result1
result2
result3

# Pipe with redirection
$ cat file.txt | grep "error" > errors.txt
```

### Background Processes

```bash
# Run process in background
$ sleep 100 &
[1] 12345

# Multiple background processes
$ long_running_task &
[1] 12346
$ another_task &
[2] 12347

# Check background process status
$ jobs
[1]  Running    long_running_task &
[2]  Running    another_task &
```

### Built-in Commands

```bash
# Change directory
$ pwd
/home/user
$ cd /tmp
$ pwd
/tmp

# Go to home directory
$ cd ~
$ pwd
/home/user

# Go to previous directory
$ cd -
/tmp

# Display environment variables
$ env
PATH=/usr/local/bin:/usr/bin:/bin
HOME=/home/user
USER=user

# Set environment variable
$ setenv MY_VAR "my_value"
$ echo $MY_VAR
my_value

# Unset environment variable
$ unsetenv MY_VAR

# Exit shell
$ exit
```

## Development Roadmap

### Week 1: Foundation
- [ ] Set up project structure
- [ ] Implement basic command parsing
- [ ] Execute simple commands (no arguments)
- [ ] Implement exit built-in
- [ ] Add command loop with prompt

### Week 2: Core Features
- [ ] Add argument parsing
- [ ] Implement PATH search
- [ ] Add built-in commands (cd, pwd, env)
- [ ] Implement I/O redirection
- [ ] Add basic error handling

### Week 3: Advanced Features
- [ ] Implement piping (single pipe)
- [ ] Add signal handling
- [ ] Implement background processes
- [ ] Add command history
- [ ] Multi-pipe support

### Week 4: Polish and Testing
- [ ] Comprehensive error handling
- [ ] Memory leak detection and fixes
- [ ] Unit test coverage
- [ ] Documentation completion
- [ ] Code cleanup and optimization

## Implementation Details

### Command Parsing

The parser tokenizes user input into commands and arguments while handling special characters:

```c
// Pseudocode for command parsing
1. Read line from user input
2. Tokenize by whitespace, respecting quotes
3. Identify special operators (|, <, >, &, etc.)
4. Build command structure with:
   - Command name
   - Arguments array
   - Input/output redirection flags
   - Background execution flag
5. Return parsed command structure
```

**Key considerations:**
- Handle quoted strings (preserve spaces within quotes)
- Escape character support (`\`)
- Environment variable expansion (`$VAR`)
- Tilde expansion (`~` to home directory)

### Process Execution

Command execution follows the fork-exec pattern:

```c
// Pseudocode for process execution
1. Fork the current process
2. In child process:
   a. Set up I/O redirections (if any)
   b. Execute command using execvp()
   c. Handle exec failure
3. In parent process:
   a. Wait for child (if foreground)
   b. Store PID (if background)
   c. Handle child exit status
```

**Key system calls:**
- `fork()` - Create child process
- `execvp()` - Execute command (searches PATH)
- `waitpid()` - Wait for specific child
- `exit()` - Terminate process

### I/O Redirection

File descriptor manipulation for input/output redirection:

```c
// Pseudocode for output redirection (>)
1. Open output file with appropriate flags
2. Use dup2() to redirect stdout to file
3. Close original file descriptor
4. Execute command
5. Output goes to file instead of terminal

// Pseudocode for input redirection (<)
1. Open input file for reading
2. Use dup2() to redirect stdin from file
3. Close original file descriptor
4. Execute command
5. Input comes from file instead of keyboard
```

**File descriptor mapping:**
- STDIN_FILENO (0) - Standard input
- STDOUT_FILENO (1) - Standard output
- STDERR_FILENO (2) - Standard error

### Pipeline Implementation

Pipes connect stdout of one command to stdin of another:

```c
// Pseudocode for single pipe (cmd1 | cmd2)
1. Create pipe using pipe() system call
2. Fork first child for cmd1:
   a. Redirect stdout to pipe write end
   b. Close pipe read end
   c. Execute cmd1
3. Fork second child for cmd2:
   a. Redirect stdin to pipe read end
   b. Close pipe write end
   c. Execute cmd2
4. Parent closes both pipe ends
5. Parent waits for both children

// For multiple pipes, repeat the process in chain
```

**Important points:**
- Close unused pipe ends to prevent deadlock
- Handle SIGPIPE signal for broken pipes
- Properly wait for all processes in pipeline

## Testing

### Unit Tests

Test individual components in isolation:

```bash
# Run parser tests
$ make test_parser
Testing command parsing...
✓ Simple command
✓ Command with arguments
✓ Quoted arguments
✓ Special characters
All parser tests passed!

# Run executor tests
$ make test_executor
Testing command execution...
✓ Basic execution
✓ PATH search
✓ Error handling
All executor tests passed!

# Run built-in tests
$ make test_builtins
Testing built-in commands...
✓ cd command
✓ pwd command
✓ env command
All built-in tests passed!
```

### Integration Tests

Test complete workflows:

```bash
# Run integration tests
$ make test_integration
Testing I/O redirection...
✓ Input redirection
✓ Output redirection
✓ Append redirection
✓ Error redirection

Testing pipes...
✓ Single pipe
✓ Multiple pipes
✓ Pipe with redirection

Testing background processes...
✓ Background execution
✓ Multiple background jobs
All integration tests passed!
```

### Memory Leak Detection

Use Valgrind to detect memory leaks:

```bash
# Run shell under Valgrind
$ valgrind --leak-check=full --show-leak-kinds=all ./shell

# Expected output (no leaks)
==12345== HEAP SUMMARY:
==12345==     in use at exit: 0 bytes in 0 blocks
==12345==   total heap usage: 245 allocs, 245 frees
==12345== All heap blocks were freed -- no leaks are possible

# Run automated memory test
$ make test_memory
Running memory leak detection...
✓ No memory leaks detected
✓ All allocated memory freed
Memory test passed!
```

## Troubleshooting

### Common Issues and Solutions

#### Issue: Command not found
```
Error: command not found: mycommand
```
**Solution:**
- Verify the command exists: `which mycommand`
- Check PATH variable: `echo $PATH`
- Use absolute path: `/usr/bin/mycommand`
- Ensure execute permissions: `chmod +x mycommand`

#### Issue: Permission denied
```
Error: permission denied
```
**Solution:**
- Check file permissions: `ls -l filename`
- Add execute permission: `chmod +x filename`
- Run with appropriate user privileges
- Verify file ownership: `chown user:group filename`

#### Issue: Broken pipe
```
Error: broken pipe
```
**Solution:**
- Ensure all commands in pipeline are valid
- Check that receiving process isn't terminating early
- Verify pipe buffer isn't full
- Handle SIGPIPE signal properly

#### Issue: Background job not working
```
Error: background process not running
```
**Solution:**
- Verify syntax: `command &`
- Check process with: `jobs` or `ps`
- Ensure shell doesn't wait for background process
- Verify signal handling for SIGCHLD

#### Issue: I/O redirection fails
```
Error: cannot open file for redirection
```
**Solution:**
- Check file path is correct
- Verify write permissions for output files
- Ensure input file exists and is readable
- Check disk space for output files

#### Issue: Memory leaks
```
Valgrind reports memory leaks
```
**Solution:**
- Free all allocated memory before exit
- Close all opened file descriptors
- Use `valgrind` to identify leak location
- Implement cleanup function for graceful exit

## Contributing

We welcome contributions! Please follow these guidelines:

### Getting Started

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Run tests: `make test`
5. Commit your changes: `git commit -am 'Add feature'`
6. Push to branch: `git push origin feature-name`
7. Submit a pull request

### Code Style

Follow these coding standards:

- **Indentation:** Use 4 spaces (no tabs)
- **Naming:**
  - Functions: `snake_case`
  - Variables: `snake_case`
  - Constants: `UPPER_CASE`
  - Structs: `PascalCase`
- **Comments:**
  - Use `/* */` for multi-line comments
  - Use `//` for single-line comments
  - Document all functions with purpose, parameters, and return value
- **Line Length:** Maximum 80 characters
- **Braces:** K&R style (opening brace on same line)

### Example Code Style

```c
/*
 * Execute a command with given arguments
 * 
 * @param cmd: Command structure containing command and arguments
 * @return: Exit status of command execution
 */
int execute_command(Command *cmd) {
    pid_t pid;
    int status;
    
    if (cmd == NULL) {
        return -1;
    }
    
    pid = fork();
    if (pid == 0) {
        // Child process
        execvp(cmd->name, cmd->args);
        perror("execvp");
        exit(EXIT_FAILURE);
    } else if (pid > 0) {
        // Parent process
        waitpid(pid, &status, 0);
        return WEXITSTATUS(status);
    } else {
        perror("fork");
        return -1;
    }
}
```

### Pull Request Guidelines

- Provide clear description of changes
- Reference related issue numbers
- Include test cases for new features
- Ensure all tests pass
- Update documentation as needed
- Keep commits atomic and well-described

## Resources

### Documentation

- [GNU C Library Manual](https://www.gnu.org/software/libc/manual/)
- [POSIX System Interfaces](https://pubs.opengroup.org/onlinepubs/9699919799/)
- [Linux Man Pages](https://man7.org/linux/man-pages/)
- [Advanced Programming in the UNIX Environment](http://www.apuebook.com/)

### Tutorials

- [Beej's Guide to Unix IPC](https://beej.us/guide/bgipc/)
- [Process Management in Linux](https://www.kernel.org/doc/html/latest/process/)
- [Writing a Shell in C](https://brennan.io/2015/01/16/write-a-shell-in-c/)
- [Linux System Programming](https://www.oreilly.com/library/view/linux-system-programming/9781449341527/)

### Tools

- **GCC/Clang:** C compiler
- **GDB:** GNU Debugger
- **Valgrind:** Memory leak detector
- **Make:** Build automation
- **Git:** Version control
- **Strace:** System call tracer
- **Vim/Emacs:** Text editors

### Reference Shells

- [Bash](https://www.gnu.org/software/bash/) - GNU Bourne Again Shell
- [Zsh](https://www.zsh.org/) - Z Shell
- [Fish](https://fishshell.com/) - Friendly Interactive Shell
- [Dash](http://gondor.apana.org.au/~herbert/dash/) - Debian Almquist Shell

## License

This project is licensed under the MIT License - see below for details:

```
MIT License

Copyright (c) 2024 Don Shammah

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```

## Acknowledgments

This project was inspired by:

- The Unix shell philosophy and design principles
- Educational resources from MIT's Operating Systems Engineering course
- The open-source community's contributions to shell development
- Classic texts on systems programming and Unix development

Special thanks to:
- The creators of bash, zsh, and other shells for pioneering shell design
- The Linux kernel developers for comprehensive documentation
- The GNU Project for essential development tools
- Online communities for continuous learning and support

## Author

**Don Shammah**
- GitHub: [@donshammah96](https://github.com/donshammah96)
- Email: donshammah1@gmail.com
- Project Link: [https://github.com/donshammah96/custom-shell](https://github.com/donshammah96/custom-shell)

## Project Status

🚧 **Status: In Development**

### Version History

- **v0.1.0** (Current)
  - ✅ Initial project setup
  - ✅ README documentation complete
  - 🔄 Core features in progress
  - 📋 Planning phase for implementation

### Upcoming Milestones

- 📝 **v0.2.0** - Basic command execution
- 🔧 **v0.3.0** - Built-in commands
- 🔀 **v0.4.0** - I/O redirection
- 🔗 **v0.5.0** - Pipeline support
- ⚙️ **v0.6.0** - Job control
- 📚 **v0.7.0** - Command history
- 🎯 **v1.0.0** - First stable release

### Current Focus

The project is currently in the planning and design phase. The next steps include:
1. Setting up the development environment
2. Implementing the basic REPL (Read-Eval-Print Loop)
3. Building the command parser
4. Developing the execution engine

---

**Last Updated:** December 2025

For questions, suggestions, or contributions, please open an issue or submit a pull request!
