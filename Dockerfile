#Builder
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#Run
FROM nginx
# Expose will have no use on local, but AWS EBS will host on the listed port
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html