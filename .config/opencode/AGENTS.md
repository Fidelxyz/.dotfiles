# Instructions

- Before editing files, check if a Git repository is initialized. If not, initialize one and commit the current state of the project first.
- If you get an unexpected error while running a command, **PAUSE** and **ASK FOR INSTRUCTIONS**. Do **NOT** try to fix it by yourself without guidance.
- If you do not have the tools for your tasks, **PAUSE** and **ASK FOR INSTRUCTIONS**. Do **NOT** install new packages.
- **NEVER** install system packages on the host unless explicitly instructed.

# Dev environment tips

- To list, read or search for files, consider the `list`, `read`, `grep` or `glob` tools first rather than command line.
- To remove files, always use `trash`. **NEVER** use `rm`.

## NodeJS
- Use `pnpm` as the package manager.
- Do **NOT** install packages for temporary use. Use `pnpx` to run tools.

## Python
- Use `uv` as the package manager.
- Do **NOT** create new virtual environments or install packages for temporary use. Use `uvx` to run tools.
