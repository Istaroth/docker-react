# build the app
FROM node:alpine AS builder

WORKDIR /app

COPY package.json .
RUN npm install
COPY . . 
RUN npm run build

# production container
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html
