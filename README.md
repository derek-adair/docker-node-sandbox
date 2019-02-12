# Node Sandbox

This docker image builds and runs a node app that is compatible with yarn.  I use it to easily clone and host javascript projects on my remote development environment.  I use it along side with [nginx/letsencrypt proxy](https://github.com/evertramos/docker-compose-letsencrypt-nginx-proxy-companion) to easily develop on this code in a cloud-based IDE.

## Run it

1. (optional) replace node source code in /sandbox (comes with the create-react-app stock app)
2. $docker-node-sandbox> cp .env-ui.example .env-ui
3. docker-compose up

Your app is now running on :80 of your docker host.

## Customize
This setup is very barebones and lends itself to customization.

### Change Port

Two things need to be edited in order to modify the port:
1. change `expose:80` to `expose:{your_port}` in **docker-compose.yml**
2. change PORT=80 to PORT={your_port} in **.env-ui**

### Adding/Removing Packages

0. Make sure you have [yarn installed](https://yarnpkg.com/en/docs/install#windows-stable)
1. `yarn add {package_name}
2. docker-compose up --build --force-recreate

*--build and --force-recreate ensure's you get a fresh container and build, I am looking for a better way to handle caching of node_modules, which will make adding/removing/upgrading deps more automatic*

### Using npm instead of yarn

**Spin up node-app container with bash instead of yarn start**
1. `docker-compose run node-app bash -il`

**In the container install and run the app**

2. `npm install && npm start`
