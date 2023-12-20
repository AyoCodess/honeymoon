// for planetscale

// import { drizzle } from "drizzle-orm/planetscale-serverless";
// import { connect } from "@planetscale/database";
// import "dotenv/config";

// const connection = connect({
//   url: process.env.DB_URL,
// });

// const db = drizzle(connection);

// export { db };

import { drizzle } from "drizzle-orm/mysql2";
import mysql from "mysql2/promise";

if (!process.env.DB_URL) {
  throw new Error("DATABASE_URL is not set in .env file");
}

const connection = await mysql.createConnection({
  uri: process.env.DB_URL,
});

export const db = drizzle(connection);
