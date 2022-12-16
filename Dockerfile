# pull base image from docker hub
FROM node:14-bullseye
# set working directory to app folder
WORKDIR /app
# copy all resources in current directory to workking direktory /app
COPY . .
# set node environment to production and set environment DB_HOST to item_db
ENV NODE_ENV=production DB_HOST=item-db
# run command while creating image for installing package and build
RUN npm install --production --unsafe-perm && npm run build
# run command when container start 
CMD ["npm", "start"]
# open port 8080 
EXPOSE 8080