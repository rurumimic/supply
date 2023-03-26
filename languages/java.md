# Java

- [jenv](https://github.com/jenv/jenv)

## Install JDK

```bash
# mac
sudo port install openjdk17

# redhat
sudo dnf install java-17-openjdk-devel

# ubuntu
sudo apt install openjdk-17-jdk
```

## jenv

### Install jenv

```bash
git clone https://github.com/jenv/jenv.git ~/.jenv
```

```bash
# ~/.zshrc
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"
```

### JAVA_HOME plugin

```bash
jenv enable-plugin export
exec $SHELL -l
```

```bash
jenv doctor

[OK]	JAVA_HOME variable probably set by jenv PROMPT
[OK]	Java binaries in path are jenv shims
[OK]	Jenv is correctly loaded
```

### Add Java version

```bash
# mac
jenv add /Library/Java/JavaVirtualMachines/openjdk17/Contents/Home

# redhat
jenv add /usr/lib/jvm/java-17-openjdk-17.0.6.0.10-3.el8_7.x86_64

# ubuntu
jenv add /usr/lib/jvm/java-17-openjdk-amd64
```

output:

```bash
openjdk64-17.0.6 added
17.0.6 added
17.0 added
17 added
```

### Select Java version

```bash
jenv global 17.0.6
```

### Check versions

```bash
jenv versions
java -version
javac -version
```

```bash
jenv versions
  system
  17
  17.0
* 17.0.6 (set by ~/.jenv/version)
  openjdk64-17.0.6

java -version
openjdk version "17.0.6" 2023-01-17 LTS
OpenJDK Runtime Environment (Red_Hat-17.0.6.0.10-3.el8_7) (build 17.0.6+10-LTS)
OpenJDK 64-Bit Server VM (Red_Hat-17.0.6.0.10-3.el8_7) (build 17.0.6+10-LTS, mixed mode, sharing)

javac -version
javac 17.0.6
```

