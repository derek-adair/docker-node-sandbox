# base image
FROM node:10.15

# set working directory
RUN mkdir /usr/src/app
WORKDIR /usr/src/app

ENV PATH /usr/src/app/node_modules/.bin:$PATH

# install and cache app dependencies
COPY ./sandbox/ /usr/src/app/
RUN yarn install 

# start app
CMD ["yarn", "start"]
