# Use Bun official image
FROM oven/bun:1

# Set working directory
WORKDIR /app

# Copy package files first (better caching)
COPY package.json bun.lock ./

# Install dependencies
RUN bun install

# Copy the rest of the app
COPY . .

# Build the Vite app
RUN bun run build

# Install a simple static server (serve)
RUN bun add -g serve

# Expose port 3000
EXPOSE 3000

# Run the app on port 3000
CMD ["serve", "-s", "dist", "-l", "3000"]