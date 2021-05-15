# 🏛️ Cloture Backend

This is the backend for the Cloture application.

This [Apollo](https://www.apollographql.com/) server performs two functions:

1. Accepts traffic and serves the static React application.
2. Fetches data from the `MongoDB` database upon receiving GQL requests from the frontend.

## Development

1. `npm install`
2. `npm run dev:start`

## Production

1. `docker build -t cloture_backend:latest .`
2. `docker run -dit --env NODE_ENV=production --env-file -p 3005:3005 .env cloture_backend:latest`

## Environment

```
PORT=[number] # Matches the PORT for the frontend to connect to...
MONGODB_URI=[string]
MONGODB_USER=?[string]
MONGODB_PASS=?[string]
```

## Seed Database

You can seed your database with some data if you'd like for development purposes. The data should be populated in two MongoDB collections titled `houseCommittees` and `senateCommittees` which you can download [here](https://storage.googleapis.com/cloture/dump.tar.gz). You can then run [mongorestore](https://docs.mongodb.com/manual/reference/program/mongoimport/) on the `dump` folder to import it into your local/cloud DB.

## How does it work?

We're using [Type-GraphQL](https://github.com/MichalLytek/type-graphql) to build the schemas and resolvers for our Apollo server. The library lets us dynamically generate our schemas and resolvers by creating types and decorators. We're using [Typegoose](https://github.com/typegoose/typegoose) (similar to `Type-GraphQL`) to generate our resolver functions.
