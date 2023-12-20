import type { Config } from 'drizzle-kit';
import * as dotenv from 'dotenv';
dotenv.config();


console.log('DB_URL',process.env.DB_URL)


if(!process.env.DB_URL) {
  throw new Error('DATABASE_URL is not set in .env file');
}

export default {
  schema: './src/schema/*',
  out: './drizzle',
  driver: "mysql2",
  dbCredentials: {
   uri: process.env.DB_URL,
  } 
} satisfies Config;
