FROM node:alpine
WORKDIR /home/ec2-user/git/react-simple-app/
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD ["npm", "start"]



