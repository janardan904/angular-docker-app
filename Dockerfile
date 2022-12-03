
FROM node:16.17.0-alpine as builder

COPY  ./ app
WORKDIR /app
RUN npm install
RUN npm build


FROM  nginx:1.7.10-alpine
EXPOSE 80
COPY --from=builder /app/dist/angular-docker-app/  user/share/nginx/html


