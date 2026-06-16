# Bygger dist/ från källan och serverar den statiskt med nginx.
FROM node:22-alpine AS build
WORKDIR /app
COPY index.html source-notice.html build.mjs ./
COPY vendor ./vendor
RUN node build.mjs

FROM nginx:alpine
COPY --from=build /app/dist/ /usr/share/nginx/html/
COPY nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
