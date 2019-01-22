# Multi step process
FROM node:alpine as builder
WORKDIR '/app'
COPY ./package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
# Copying the files from build folder into the nginx recommended path for serving static files
COPY --from=builder /app/build /usr/share/nginx/html
