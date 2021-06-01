import { resolve } from "path";
import dotenv from "dotenv";

// Set environment...
const envi = process.env.NODE_ENV;
const isDev = envi === "development";
dotenv.config({ path: `./.env.${envi}` });

import "reflect-metadata";
import { connect } from "./mongodb/connect";
import { buildSchema } from "type-graphql";
import { ApolloServer } from "apollo-server";
import { SenateCommitteeResolver, HouseCommitteeResolver } from "./resolvers";

(async () => {
  await connect();
  console.log(`📊 Databases connected`);
  const schema = await buildSchema({
    resolvers: [HouseCommitteeResolver, SenateCommitteeResolver],
    emitSchemaFile: resolve(__dirname, "schema.gql"),
  });

  // Initialize ApolloServer options
  const server = new ApolloServer({
    schema,
    introspection: isDev,
    playground: isDev,
    cors: true,
  });

  server.listen({ port: 3005 }, () => {
    console.log(`🚀 Server listening on port 3005`);
  });
})();
