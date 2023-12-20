import {
  boolean,
  int,
  mysqlEnum,
  mysqlTable,
  text,
  timestamp,
  varchar,
} from "drizzle-orm/mysql-core";

export const post = mysqlTable("users", {
  id: varchar("user_id", { length: 64 }).primaryKey(), //This is clerkId
  post: text("post"),
});
