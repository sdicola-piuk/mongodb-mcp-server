FROM node:22-alpine
ARG VERSION=latest
RUN addgroup -S mcp && adduser -S mcp -G mcp
RUN npm install -g  mcp-proxy mongodb-mcp-server@${VERSION}
USER mcp
WORKDIR /home/mcp
ENV PORT=8000
CMD npx mcp-proxy --port ${PORT} mongodb-mcp-server
LABEL maintainer="MongoDB Inc <info@mongodb.com>"
LABEL description="MongoDB MCP Server"
LABEL version=${VERSION}
