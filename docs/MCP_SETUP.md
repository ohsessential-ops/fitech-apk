# MCP (Model Context Protocol) Configuration

## Setup

### 1. Install Dependencies
```bash
npm init -y
npm install dotenv @modelcontextprotocol/sdk
```

### 2. Create Configuration Files

**File: `~/.claude/claude_desktop_config.json`**
```json
{
  "mcpServers": {
    "fitech": {
      "type": "stdio",
      "command": "node",
      "args": ["fitech-mcp-server.js"],
      "env": {
        "GITHUB_OWNER": "ohsessential-ops",
        "GITHUB_REPO": "fitech-apk",
        "GITHUB_TOKEN": "${GITHUB_TOKEN}",
        "FLUTTER_SDK_PATH": "${FLUTTER_SDK_PATH}"
      }
    }
  }
}
```

**File: `.env.local` (DO NOT COMMIT)**
```
GITHUB_TOKEN=your_token_here
FLUTTER_SDK_PATH=/path/to/flutter
MCP_SECRET_KEY=your_secret_key
```

### 3. Available Tools

- `build_apk` - Build debug/release APK
- `flutter_analyze` - Run static analysis
- `push_to_github` - Push changes to repository
- `get_project_status` - Get current project status

## Usage

With Claude and MCP enabled:

```
"Build release APK for FiTech"
"Analyze code and report issues"
"Push my changes to main branch"
"Check project status"
```

## Security

✅ Secrets in `.env.local`
✅ Token environment variables
✅ No hardcoded credentials
✅ `.env.local` in `.gitignore`
