FROM node:18
# Create app directory
WORKDIR /usr/src/app
# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json ./
RUN npm install pm2 -g
RUN npm install
# If you are building your code for production
# RUN npm ci --omit=dev
# Bundle app source
COPY . .
RUN npm run build
EXPOSE 1880

#CMD ["pm","pm2 start packages/node_modules/node-red/red.js"]
#CMD [ "pm2", "start", "packages/node_modules/node-red/red.js" ]
CMD ["npm", "start"]
