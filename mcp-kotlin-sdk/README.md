TODO. See https://github.com/JetBrains/mcp-kotlin-sdk

## Overview

The Model Context Protocol allows applications to provide context for LLMs in a standardized way, separating the
concerns of providing context from the actual LLM interaction. This Kotlin SDK implements the full MCP specification,
making it easy to:

- Build MCP clients that can connect to any MCP server
- Create MCP servers that expose resources, prompts and tools
- Use standard transports like stdio, SSE, and WebSocket
- Handle all MCP protocol messages and lifecycle events
