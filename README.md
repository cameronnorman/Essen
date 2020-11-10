# Essen
Essen is a application that you can use to render recipes from contentful

## Getting started
In order to run this application you require the following installed
- docker
- docker-compose

Once you have the above installed you need to build the application. To build the application you can run
```
make setup
```
This command will setup the database for you and install the required dependencies

Once this command has been run you need to create a `.env` file with the following environment variables in it
```
CONTENTFUL_SPACE="space_goes_here"
CONTENTFUL_ACCESS_TOKEN="token_goes_here"
CONTENTFUL_ENVIRONMENT="environment_goes_here"
```

Once you have created the `.env` file you can start the application by running:
```
make run
```

This should start the application for development purposes.

## Production
To build a production ready image you can run the following command

```
make prod
```

This command will build a very light weight image with docker that can be deployed to any AWS server or docker hosting infrastructure
