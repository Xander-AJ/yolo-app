# Stage 1: Build MongoDB and Backend
FROM mongo:latest AS backend-builder

WORKDIR /app

# Copy backend files
COPY backend/package*.json ./
RUN npm install
COPY backend/ ./
EXPOSE 5000

# Stage 2: Build Frontend
FROM node:alpine AS frontend-builder

WORKDIR /app

# Copy frontend files
COPY client/package*.json ./
RUN npm install
COPY client/ ./
RUN npm run build

# Stage 3: Final Image with MongoDB, Backend, and Frontend
FROM mongo:latest

# Expose MongoDB port
EXPOSE 27017

# Set the working directory
WORKDIR /app

# Copy MongoDB data and backend files from the build stages
COPY --from=backend-builder /app /app
COPY --from=frontend-builder /app /app/client

# Start the application
CMD ["pm2-runtime", "server.js"]

