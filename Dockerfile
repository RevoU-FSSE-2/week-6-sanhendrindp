# FROM is used to create the initial build stage of the image we specify
# FROM imageName:version
FROM node:slim

# LABEL is to provide additional information on the image
# LABEL <key>=<value>
LABEL author="Sanhendrin Dwi Prasetya"
LABEL website="https://sanhendrindp.site/"

# Create app directory
WORKDIR /app

# Copying package.json to working directory
COPY package*.json ./

# Install app dependencies, this image will comes with Node.js and NPM already installed
# RUN is use to execute commands during the docker build process
RUN npm install

# Bundle the app source code
COPY . .

# Binds the app to port 3001
EXPOSE 3001

# CMD is use to run the app during the docker container process
CMD ["node", "app.js"]