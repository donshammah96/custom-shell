
# Versioning & Release Workflow

This project acts as a learning journey, where each version corresponds to a major milestone in your understanding of systems programming.

## Version Roadmap
As defined in `README.md`:

| Version | Milestone | Key Features |
|---------|-----------|--------------|
| `v0.1.0` | **Setup** | Repo structure, Makefile, Documentation |
| `v0.2.0` | **Execution** | `UNIX REPL`, `fork()`, `exec()`, `wait()` |
| `v0.3.0` | **Builtins** | `cd`, `exit`, `env`, `pwd` |
| `v0.4.0` | **Redirection** | `<`, `>`, `>>` support |
| `v0.5.0` | **Pipes** | Single pipe `|` support |
| `v0.6.0` | **Job Control** | Background `&`, Signals |
| `v1.0.0` | **Stable** | All features + Polish |

## Git Workflow

### 1. Feature Branches
Never commit directly to `main` for new features. Create a branch for the milestone you are working on.

```bash
# Example: Starting work on command execution (v0.2.0)
git checkout -b feature/execution
```

### 2. Atomic Commits
Make small, logical commits with clear messages.

```bash
# Good Commit Messages
git commit -m "feat: implement basic REPL loop"
git commit -m "fix(parser): handle trailing whitespace"
git commit -m "docs: update API documentation for executor"
```

### 3. Merging & Releasing
When a milestone is complete:

1.  **Run Tests**: Ensure `make test` passes.
2.  **Merge**: Pull request or merge into `main`.
3.  **Tag**: Create a version tag.

```bash
# Switch to main and merge
git checkout main
git merge feature/execution

# Create the version tag
git tag -a v0.2.0 -m "Release v0.2.0: Basic Command Execution"

# Push everything
git push origin main --tags
```

## Checklist for v0.2.0 (Next Release)
- [ ] Implement `main.c` loop (read input).
- [ ] Implement `parser.c` (simple tokenization).
- [ ] Implement `executor.c` (execvp).
- [ ] Verify `ls`, `date`, `whoami` work.
- [ ] Run `valgrind` to check for leaks.
