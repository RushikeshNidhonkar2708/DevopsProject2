# ---------- Stage 1: Build the React App ----------
FROM node:18-alpine AS builder

WORKDIR /app

# Copy only package files first (better cache)
COPY package.json package-lock.json ./

RUN npm install --legacy-peer-deps

# Copy the rest of the project
COPY . .

# Build optimized production files
RUN npm run build


# ---------- Stage 2: NGINX For Serving Built App ----------
FROM nginx:alpine

WORKDIR /usr/share/nginx/html

# Remove default nginx files
RUN rm -rf ./*

# Copy build output from builder stage
COPY --from=builder /app/build .

# Expose port
EXPOSE 3000

# Start nginx
CMD ["nginx", "-g", "daemon off;"]
