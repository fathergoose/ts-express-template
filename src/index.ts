/**
 * Copied from express-generator by A. Ilseman 2025-06-27
 *
 * This file is incharge of "running" our app and lives outside
 * typescript's perview. And that makes sense; typesciprt is all about
 * static analysis (code analysis without code execution) and this file
 * is all about runtime configuration.
 */

/**
 * Module dependencies.
 */

import app from "./app";
import dbg from "debug";
const debug = dbg("listening-list:server");
import { createServer } from "http";

/**
 * Get port from environment and store in Express.
 */

const port = normalizePort(process.env.PORT || "3003");
app.set("port", port);

/**
 * Create HTTP server.
 */

const server = createServer(app);

/**
 * Listen on provided port, on all network interfaces.
 */

server.listen(port);
server.on("error", onError);
server.on("listening", onListening);

/**
 * Normalize a port into a number, string, or false.
 */

function normalizePort(val: string) {
  const port = parseInt(val, 10);

  if (isNaN(port)) {
    // named pipe
    return val;
  }

  if (port >= 0) {
    // port number
    return port;
  }

  return false;
}

/**
 * Event listener for HTTP server "error" event.
 */

function onError(error: NodeJS.ErrnoException) {
  if (error.syscall !== "listen") {
    throw error;
  }

  const bind = typeof port === "string" ? "Pipe " + port : "Port " + port;

  // handle specific listen errors with friendly messages
  switch (error.code) {
    case "EACCES":
      console.error(bind + " requires elevated privileges");
      process.exit(1);
      break;
    case "EADDRINUSE":
      console.error(bind + " is already in use");
      process.exit(1);
      break;
    default:
      throw error;
  }
}

/**
 * Event listener for HTTP server "listening" event.
 */

function onListening() {
  const addr = server.address();
  const bind = typeof addr === "string" ? "pipe " + addr : "port " + addr?.port;
  debug("Listening on " + bind);
}
