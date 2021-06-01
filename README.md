# 🏛️ Cloture Backend

This is the backend for the Cloture application.

This [Apollo](https://www.apollographql.com/) server performs two functions:

1. Accepts traffic and serves the static React application.
2. Fetches data from the `MongoDB` database upon receiving GQL requests from the frontend.

## Development

1. `npm install`
2. `npm run dev:start`

## Production

You'll need to configure the `availability_zone` and `your_public_key` inside the `infrastructure/variables.tf` file. These will specify where your EC2 instance will get created, and how you'll connect over SSH.

You'll also need to ensure that you have a valid AWS credentials file that's referenced in the `main.tf` file.

1. `cd infrastructure && terraform init`
2. `terraform apply --auto-approve`

The previous command should output the IP address of your EC2 instance. Connect to it and run the Docker image:

3. `ssh -i ~/.ssh/your_public_key ubuntu@ip_address_from_apply`
4. Create the `.env.production` file with your configuration options for the server. See the "Environment" section.
5. `docker run -dit --env NODE_ENV=production --env-file .env.production -p 3005:3005 kingofcramers/cloture_backend:latest`

## Environment

This `.env.development` file is required to connect to the various services that the API depends on. Store it in the root of your project:

```
PORT=[number] # Matches the PORT for the frontend to connect to...
MONGODB_URI=[string]
MONGODB_USER=?[string]
MONGODB_PASS=?[string]
```

The `.env.production` file is similar (we're using the MongoDB managed DB):

```
PORT=3005
MONGODB_URI=mongodb+srv://username:password@unique-url.mongodb.net/database?retryWrites=true&w=majority
REACT_APP_API=https://cloture.app/
```

## Seed Database

You can seed your database with some data if you'd like for development purposes. The data should be populated in two MongoDB collections titled `houseCommittees` and `senateCommittees` which you can download [here](https://storage.googleapis.com/cloture/dump.tar.gz). You can then run [mongorestore](https://docs.mongodb.com/manual/reference/program/mongoimport/) on the `dump` folder to import it into your local/cloud DB.

## How does it work?

We're using [Type-GraphQL](https://github.com/MichalLytek/type-graphql) to build the schemas and resolvers for our Apollo server. The library lets us dynamically generate our schemas and resolvers by creating types and decorators. We're using [Typegoose](https://github.com/typegoose/typegoose) (similar to `Type-GraphQL`) to generate our resolver functions.
