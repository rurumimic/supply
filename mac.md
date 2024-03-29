# mac

## Dog Tag

### Computer Name

**System Preferences** -> **Share**

Change my Computer Name

### Finder

#### Preferneces

1. Open Finder
2. Go to `Preferences`
3. Settings in `General` Tab
4. Settings in `Sidebar` Tab
5. Settings in `Advanced` Tab
    - [x] Show all filename extensions

### Trackpad

**System Preferences** -> **Trackpad**

Check all

### Keyboard

**System Preferences** -> **Keyboard**

#### (option) Function Keys

1. `Keyboard` Tab
   - [x] Use F1, F2, etc. keys as standard function keys

#### Modifiers Keys

1. `Keyboard` Tab → `Modifiers Keys...`
2. `Caps Lock ⬆️` Key to `^ Control`

#### Turn off auto

1. `Text` Tab
2. Uncheck all

#### (option) Input Sources

1. `Shortcuts` Tab
2. `Input Sources`
   - `Control + Space` → `Command + Space`: Select the previous input source
   - `Control + Option + Space` → `Command + Option + Space`: Select next source in Input menu
3. `Spotlight`
   - `Commnad + Space` → `Option + Space`: Show spotlight search
   - `Commnad + Option + Space` → `Option + Control + Space`: Show Finder search window

---

## Terminal

### MacPorts

Install [port](https://www.macports.org) with `pkg` installer

```bash
ls -al /opt/local/bin
```

Update:

```bash
sudo port selfupdate
```

#### using Git

- [git install](https://guide.macports.org/#installing.macports.git)

Update port:

```bash
sudo port -vd sync
```

Upgrade oudated pacakges:

```bash
sudo port outdated
sudo port upgrade outdated
```

---

## Commands

### Compress

without `.DS_Store` and `__MACOSX`

```bash
zip -r archive.zip . -x ".*" -x "__MACOSX" -q
```

---

## XCode

### Themes

[codetheme.net](https://www.codethemes.net/themes/popular/dark)

- save: `/Users/${USER}/Library/Developer/Xcode/UserData/FontAndColorThemes`
- [Ego 2](https://www.codethemes.net/theme/ego_2)
- [Mangold](https://www.codethemes.net/theme/mangold)
