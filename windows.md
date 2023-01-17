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

---

## Commands

### Powershell

#### Compress and Extract

- Microsoft PowerShell Archive
  - [Compress-Archive](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/compress-archive?view=powershell-7.3)
  - [Expand-Archive](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.archive/expand-archive?view=powershell-7.3)

```ps1
Compress-Archive .\directory archive.zip
Expand-Archive .\archive.zip
```

