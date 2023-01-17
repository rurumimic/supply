# Windows

## Terminal

### Speed Up: git-bash

Copy `path`:

```bash
git --exec-path

.../mingw64/libexec/git-core
```

Edit `git-prompt.sh`:

```bash
vi /etc/profile.d/git-prompt.sh
```

Paste `path` on line 30:

```bash
GIT_EXEC_PATH="$(git --exec-path 2>/dev/null)"
GIT_EXEC_PATH=.../mingw64/libexec/git-core
```

Comment out line 39:

```bash
# PS1="$PS1"'`__git_ps1`' # bash function
```

