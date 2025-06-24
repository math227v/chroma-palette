# Build stage
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY . .
RUN npm run build

# # Production stage
# FROM nginx:alpine AS production
# COPY --from=builder /app/docs /usr/share/nginx/html
# EXPOSE 80
# CMD ["nginx", "-g", "daemon off;"]