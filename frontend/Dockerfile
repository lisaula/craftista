# Build stage
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci

# Runtime stage
FROM gcr.io/distroless/nodejs18-debian12

WORKDIR /app

# Copy node_modules from builder
COPY --from=builder /app/node_modules ./node_modules

# Copy application code
COPY app.js .
COPY config.json .
COPY routes/ routes/
COPY views/ views/
COPY public/ public/

# Expose port
EXPOSE 3000

# Run the application
CMD ["app.js"]
