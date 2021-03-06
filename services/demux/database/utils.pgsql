DELETE FROM "pets"."_index_state";
INSERT INTO "pets"."_index_state" (id, block_number, block_hash, is_replay) VALUES (1, 1200000, '', false); -- bubble at 1293913
SELECT * FROM "pets"."_index_state" LIMIT 1000;
SELECT * FROM "pets"."elements" LIMIT 1000;
SELECT * FROM "pets"."types" LIMIT 1000;
SELECT * FROM "pets"."pets" ORDER BY id LIMIT 1000;
SELECT * FROM "pets"."pet_actions" LIMIT 1000;

-- -- DELETE FROM "pets"."_index_state";
-- -- SELECT last_value FROM "pets".elements_id_seq;
-- -- SELECT c.relname FROM pg_class c WHERE c.relkind = 'S';

-- DELETE FROM pets.pet_actions; --WHERE id >= 21;
-- DELETE FROM pets.pets; -- WHERE id >= 12;

DROP SCHEMA "pets" CASCADE;

CREATE SCHEMA IF NOT EXISTS "pets";

CREATE TABLE IF NOT EXISTS "pets"."_index_state" (
  id INTEGER PRIMARY KEY,
  block_number integer NOT NULL,
  block_hash text NOT NULL,
  is_replay boolean NOT NULL
);

CREATE TABLE IF NOT EXISTS "pets"."elements" (
  "id" SERIAL PRIMARY KEY,
  "ratios" INTEGER[] NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_block" BIGINT NOT NULL,
  "created_trx" TEXT NOT NULL,
  "created_eosacc" TEXT NOT NULL,
  "_dmx_created_at" TIMESTAMP DEFAULT current_timestamp NOT NULL
);

CREATE TABLE IF NOT EXISTS "pets"."types" (
  "id" SERIAL PRIMARY KEY,
  "elements" INTEGER[] NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_block" BIGINT NOT NULL,
  "created_trx" TEXT NOT NULL,
  "created_eosacc" TEXT NOT NULL,
  "_dmx_created_at" TIMESTAMP DEFAULT current_timestamp NOT NULL
);

CREATE TABLE IF NOT EXISTS "pets"."pets" (
  "id" SERIAL PRIMARY KEY,
  "pet_name" TEXT NOT NULL,
  "type_id" INTEGER DEFAULT -1 NOT NULL,
  "owner" TEXT NOT NULL,
  "death_at" TIMESTAMP DEFAULT '1970-01-01T00:00:00' NOT NULL,
  "destroyed_at" TIMESTAMP DEFAULT '1970-01-01T00:00:00' NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_block" BIGINT NOT NULL,
  "created_trx" TEXT NOT NULL,
  "created_eosacc" TEXT NOT NULL,
  "_dmx_created_at" TIMESTAMP DEFAULT current_timestamp NOT NULL
);

CREATE TABLE IF NOT EXISTS "pets"."pet_actions" (
  "id" SERIAL PRIMARY KEY,
  "pet_id" INTEGER NOT NULL REFERENCES "pets"."pets",
  "action" TEXT NOT NULL,
  "is_invalid" BOOLEAN NOT NULL,
  "created_at" TIMESTAMP NOT NULL,
  "created_block" BIGINT NOT NULL,
  "created_trx" TEXT NOT NULL,
  "created_eosacc" TEXT NOT NULL,
  "_dmx_created_at" TIMESTAMP DEFAULT current_timestamp NOT NULL
);

DELETE FROM "pets"."types";
ALTER SEQUENCE "pets".types_id_seq MINVALUE 0;
ALTER SEQUENCE "pets".types_id_seq RESTART WITH 0;

DELETE FROM "pets"."elements";
ALTER SEQUENCE "pets".elements_id_seq MINVALUE 0;
ALTER SEQUENCE "pets".elements_id_seq RESTART WITH 0;

-- DELETE FROM "pets"."pets";
-- DELETE FROM "pets"."pet_actions";
-- ALTER SEQUENCE "pets".pets_id_seq RESTART WITH 1;
-- ALTER SEQUENCE "pets".pet_actions_id_seq RESTART WITH 1;
