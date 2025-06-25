import * as db from "zapatos/db";
import type * as s from "zapatos/schema";
import pg from "pg";

const pool = new pg.Pool({ connectionString: process.env.DATABASE_URL });
pool.on("error", (err) => console.error(err)); // don't let a pg restart kill your app

async function main() {
  const results = await db.sql<
    s.artists.SQL,
    s.artists.Selectable
  >`SELECT ${"name"} ${"artists"}`.run(pool);
  return results;
}

main();

//
//
//
//
//
//
//
//
//
//
//
// import { Client } from "pg";
//
// const client = new Client({
//   user: "postgres",
//   password: "password",
//   host: "localhost",
//   port: 5432,
//   database: "example",
// });
// await client.connect();
//
// interface GetArtistParams {
//   id?: number;
//   name?: string;
// }
//
// const myVar: GetArtistParams = {};
//
// interface GetArtistResult {
//   name: string;
// }
//
// async function getArtist(params: GetArtistParams): Promise<GetArtistResult> {
//   // What are the fields that are defined on params: id? or name?
//   const query = "SELECT * FROM artists WHERE id = $1::number";
//   const query2 = "SELECT * FROM artists WHERE name = $1::string";
//   const id = params.id;
//   const result = await client.query(query, [id]);
//   return result;
// }
//
// const res = await client.query("SELECT $1::text as message", ["Hello world!"]);
// console.log(res.rows[0].message); // Hello world!
// await client.end();
