FROM --platform=$BUILDPLATFORM node:22.2.0 AS build
WORKDIR /app
COPY frontend/package*.json ./frontend/
WORKDIR /app/frontend
RUN npm install 
COPY frontend/ . 
RUN npm run build 
FROM --platform=$BUILDPLATFORM node:22.2.0
WORKDIR /app
COPY package*.json .
RUN npm install
WORKDIR /app/backend
COPY backend/ .
WORKDIR /app/backend/dist
COPY --from=build /app/frontend/dist .
WORKDIR /app/backend
EXPOSE 80
CMD ["node", "server.js"]

# FROM node:22.2.0
# WORKDIR /app/frontend
# COPY frontend/  .
# RUN npm install 

# WORKDIR /app
# COPY package*.json .
# RUN npm install
# WORKDIR /app/backend
# COPY backend/ . 
# WORKDIR /app
# EXPOSE 5000 3000

# CMD ["npm", "run", "dev"]


# FROM node:22.2.0 AS build
# WORKDIR /app
# COPY frontend/package*.json ./frontend/
# WORKDIR /app/frontend
# RUN npm install 
# COPY frontend/ . 
# RUN npm run build 

# FROM node:22.2.0
# WORKDIR /app
# COPY package*.json .
# RUN npm install
# COPY backend/ .

# WORKDIR /app/dist
# COPY --from=build /app/frontend/dist .

# WORKDIR /app
# EXPOSE 5000

# CMD ["node", "server"]



# COPY frontend/package*.json ./

# RUN npm install 

# COPY frontend ./

# RUN npm run build 

# FROM nginx:alpine

# COPY --from=build /app/dist /usr/share/nginx/html

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]





# # Stage 1
# FROM node:22.2.0

# WORKDIR /app

# COPY frontend/package*.json ./

# RUN npm install

# RUN npm run build

# COPY ./frontend .

# RUN npm run build

# RUN: ls | echo

# # Stage 2
# FROM nginx:alpine

# COPY --from=build ./dist /usr/share/nginx/html

# EXPOSE 80

# CMD ["nginx", "-g", "daemon off"]  # Corrected typo here

# # Stage 1 sadf

# # This is the version I built on this machine 
# FROM node:22.2.0

# WORKDIR /app

# COPY frontend/package*.json ./

# RUN npm install 

# # RUN npm run build 

# COPY ./frontend .

# EXPOSE 3000

# CMD ["npm", "run", "dev"]

# # RUN npm run build 

# # RUN ls | echo

# # FROM nginx:alpine

# # COPY --from=build /dist /usr/share/nginx/html

# # EXPOSE 80

# # CMD ["nginx", "-g", "deamon off"]





# # # Stage 1
# # FROM node:22.2.0

# # WORKDIR /app

# # COPY frontend/package*.json ./

# # RUN npm install

# # RUN npm run build

# # COPY ./frontend .

# # RUN npm run build

# # RUN: ls | echo

# # # Stage 2
# # FROM nginx:alpine

# # COPY --from=build ./dist /usr/share/nginx/html

# # EXPOSE 80

# # CMD ["nginx", "-g", "daemon off"]  # Corrected typo here


