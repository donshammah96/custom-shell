
# Shell C API Reference

This document outlines the core C interfaces used in `ksh`. These functions form the internal API that connects the parser, executor, and built-in systems.

## 1. Data Structures

### `Command`
Represents a single parsed command or a link in a pipeline chain.
```c
// Located in include/shell.h
typedef struct Command {
    char **args;          // Array of string arguments
    int argc;             // Argument count
    char *input_file;     // Filename for < redirection (or NULL)
    char *output_file;    // Filename for > redirection (or NULL)
    int append_mode;      // 1 if >> used, 0 otherwise
    int background;       // 1 if & present
    struct Command *next; // Pointer to next command in pipeline (or NULL)
} Command;
```

## 2. Parsing Interface (`include/parser.h`)

### `parse_line`
Converts a raw input string into a structured `Command` chain.
```c
Command *parse_line(char *input);
```
- **Input**: `input` (Mutable string from `stdin`)
- **Returns**: Head of the linked list of `Command` structs, or `NULL` on error.
- **Notes**: Modifies the input string during tokenization (strtok behavior).

### `free_command`
Recursively frees memory associated with a command chain.
```c
void free_command(Command *cmd);
```

## 3. Execution Interface (`include/executor.h`)

### `execute_line`
Orchestrate the execution of a full command line (pipeline).
```c
int execute_line(Command *cmd);
```
- **Input**: Head of the command chain.
- **Returns**: Last command's exit status code.

### `launch_process`
Low-level wrapper for `fork()` and `exec()`.
```c
int launch_process(Command *cmd, int in_fd, int out_fd);
```
- **Input**:
    - `cmd`: Command to execute.
    - `in_fd`: File descriptor to map to STDIN (or -1 for default).
    - `out_fd`: File descriptor to map to STDOUT (or -1 for default).
- **Returns**: PID of the new process.

## 4. Built-in Interface (`include/builtins.h`)

### `is_builtin`
Checks if a command name corresponds to an internal shell command.
```c
int is_builtin(const char *name);
```
- **Returns**: 1 if builtin, 0 otherwise.

### `exec_builtin`
Executes the builtin function associated with the command.
```c
int exec_builtin(Command *cmd);
```
- **Returns**: Exit status of the builtin (0 for success, non-zero for error).

## 5. Signals (`include/signals.h`)

### `setup_signals`
Initializes signal handlers for the shell (ignoring SIGINT in parent, handling SIGCHLD).
```c
void setup_signals(void);
```
