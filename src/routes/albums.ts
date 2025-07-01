import express from "express";
import * as db from "zapatos/db";
import type * as s from "zapatos/schema";
import pg from "pg";
import * as z from "zod/v4";

const router = express.Router();

async function getAlbumById(pool: pg.Pool, id: number) {
  const result = await db.sql<s.albums.SQL, s.albums.Selectable[]>`
  SELECT * FROM ${"albums"} WHERE ${{ id }}`.run(pool);
  return result[0];
}

async function getAllAlbums(pool: pg.Pool) {
  const albums = await db.sql<
    s.albums.SQL,
    s.albums.Selectable[]
  >`SELECT * FROM ${"albums"}`.run(pool);
  return albums;
}

async function createAlbum(pool: pg.Pool, album: s.albums.Insertable) {
  // Using zapatos helper method `.insert()` to add the record without handwriting the SQL
  const newAlbum = await db.insert("albums", album).run(pool);
  return newAlbum.id;
}

/*
 * Creating a function so we can pass in our instance of pg.Pool
 * This will allow for a single instance of our connection pool
 * to be shared across all endpoints.
 */
export default function albumRouter(pool: pg.Pool) {
  return (
    router
      .get("/", async (_req, res) => {
        const albums = await getAllAlbums(pool);
        res.json(albums);
      })
      .get("/:id", async (req, res) => {
        let id;
        try {
          id = Number.parseInt(req.params.id);
        } catch (e) {
          console.log("catching error");
          console.error(e);
          res.send(400);
          return;
        }
        const album = await getAlbumById(pool, id);
        if (album === undefined) {
          res.sendStatus(404).send("Invalid album id");
        }
        res.json(album);
      })
      /*
       * The request validation got a little out of control for this one (post).
       * No doubt it could be accomplished more elagently
       */
      .post("/", async (req, res) => {
        let validBody;
        const { body } = req;
        /*
         * Validator to perform runtime type checking. We genuinely don't know
         * what the user will submit so typescript can't help us here
         */
        const CreateAlbumValidator = z.object({
          name: z.string(),
        });
        try {
          validBody = CreateAlbumValidator.parse(body);
        } catch (error) {
          if (error instanceof z.ZodError) {
            console.error(error.issues);
            res.sendStatus(400).send(error.issues);
          } else {
            res.sendStatus(400).send("Invalid request body");
          }
        }
        if (validBody) {
          const newRecord = await createAlbum(pool, validBody);
          res.json(newRecord);
        } else {
          res.sendStatus(400).send("Request body required");
        }
      })
  );
}
