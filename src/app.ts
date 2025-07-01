import pg from "pg";
import express from "express";
import albumRouter from "./routes/albums.ts";

const app = express();
const pool = new pg.Pool({ connectionString: process.env.DATABASE_URL });

pool.on("error", (err) => console.error(err)); // don't let a pg restart kill your app

app.use("/albums", albumRouter(pool));
app.get("/", (_req, res) => {
  res.send("Welcome to your listening list\r\n\tEndpoints:\r\n\t\t/albums");
});

export default app;
