
# Testing Guide

This document defines the testing strategy for ensuring the reliability and correctness of `ksh`.

## 1. Unit Testing
We test individual components (parser, builtins) in isolation to verify their logic.

### Running Unit Tests
```bash
make test_parser    # Validate tokenization and command structuring
make test_builtins  # Validate cd, env, exit logic
```

### Test Cases
- **Parser**:
    - Empty strings
    - Strings with multiple spaces
    - Quoted strings with spaces (`"ls -la"`)
    - Escape characters
- **Executor**:
    - Command not found handling
    - Permission denied handling

## 2. Integration Testing
We test the shell as a complete system by feeding it scripts and checking output.

### Running Integration Tests
```bash
make test_integration
```

### Scenarios
1.  **Redirection**:
    - `echo hello > out.txt` -> Check file content.
    - `sort < out.txt` -> Check command output.
2.  **Piping**:
    - `ls | grep c` -> Verify filtering works.
    - `cat huge_file | less` -> Verify pipe buffer handling.
3.  **Job Control**:
    - `sleep 1 &` -> Verify immediate return to prompt.

## 3. Memory Analysis
We use **Valgrind** to ensure there are no memory leaks, especially since we do manual string manipulation and dynamic allocation (`malloc`/`free`).

### Running Valgrind
```bash
make test_memory
# OR manually:
valgrind --leak-check=full --show-leak-kinds=all ./shell
```

### Common League Sources
- Not freeing the `args` array in `Command` struct.
- Not freeing the linked list nodes (`next` pointers) in a pipeline.
- `getline()` buffer not being freed on exit.
