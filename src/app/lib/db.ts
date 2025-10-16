import Database from "better-sqlite3";
import path from "path";

const dbPath = path.join(process.cwd(), "database", "EloCare_DB");
let db: Database.Database | null = null;

export function getDb(): Database.Database {
  if (!db) {
    db = new Database(dbPath);
    db.pragma("foreign_keys = ON");
  }

  return db;
}

export default getDb;
