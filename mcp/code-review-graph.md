# code-review-graph

- github: [tirth8205/code-review-graph](https://github.com/tirth8205/code-review-graph)

## settings

```bash
uvx code-review-graph install claude
```

### .mcp.json

```json
{
  "mcpServers": {
    "code-review-graph": {
      "command": "uvx",
      "args": [
        "code-review-graph",
        "serve"
      ],
      "cwd": "/home/user/myproject",
      "type": "stdio"
    }
  }
}
```

### .claude

```bash
.claude
├── settings.json
└── skills
    ├── debug-issue
    │   └── skill.md
    ├── explore-codebase
    │   └── skill.md
    ├── refactor-safely
    │   └── skill.md
    └── review-changes
        └── skill.md
```

