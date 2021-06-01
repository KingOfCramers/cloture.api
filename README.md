# 🏛️ Cloture Backend

This is the backend for Cloture. It's a GraphQL API that serves up content for consumption by a frontend about congressional committee websites.

## Development

1. ```
    cat << EOF > .development.env
    MONGODB_URI=[your_local_mongodb_uri]
    MONGODB_USER=[your_user]
    MONGODB_PASS=[your_password]
    EOF
   ```

2. `npm install`
3. `npm run dev:start`

## Production

#### Build Docker Image

1. `docker build -t your_docker_name/cloture_backend:latest .`
2. `docker push your_docker_name/cloture_backend:latest`

#### Configure Terraform

1. Configure the `availability_zone` and `your_public_key` inside the `infrastructure/variables.tf` file.
2. Configure valid AWS credentials file at `~/.aws/credentials` for local deployment.

#### Deploy the infrastructure to AWS

1. `cd infrastructure && terraform init`
2. `terraform apply --auto-approve`

#### Connect to EC2 + Run Docker Container (port 3005 will be exposed)

1. `ssh -i ~/.ssh/your_public_key ubuntu@ip_address_from_terraform_apply_step`
2. `echo "MONGODB_URI=yourconnectionstring" > .env.production`
3. `docker run -dit --env NODE_ENV=production --env-file .env.production -p 3005:3005 your_docker_name/cloture_backend:latest`\*\*

You may have to whitelist the IP address of the EC2 instance within your MongoDB managed server.

## Environment

This `.env.development` file is required to connect to the various services that the API depends on. Store it in the root of your project:

```
MONGODB_URI=[string]
MONGODB_USER=?[string]
MONGODB_PASS=?[string]
```

The `.env.production` file is similar except we're using the MongoDB managed DB, and there's just one string:

```
MONGODB_URI=mongodb+srv://username:password@unique-url.mongodb.net/database?retryWrites=true&w=majority
```

## Seed Database

You can seed your database with some data if you'd like for development purposes. The data should be populated in two MongoDB collections titled `houseCommittees` and `senateCommittees` which you can download [here](https://storage.googleapis.com/cloture/dump.tar.gz). You can then run [mongorestore](https://docs.mongodb.com/manual/reference/program/mongoimport/) on the `dump` folder to import it into your local/cloud DB.

## How does it work?

We're using [Type-GraphQL](https://github.com/MichalLytek/type-graphql) to build the schemas and resolvers for our Apollo server. The library lets us dynamically generate our schemas and resolvers by creating types and decorators. We're using [Typegoose](https://github.com/typegoose/typegoose) (similar to `Type-GraphQL`) to generate our resolver functions.
