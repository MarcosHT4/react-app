FROM node:18 

WORKDIR /app

COPY . .

RUN ["npm", "install"]

RUN ["npm", "run", "build"]

FROM nginx:1.15

COPY --from=0 /app/build /usr/share/nginx/html

COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]

