BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "cacao_batch" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "status" text NOT NULL,
    "stage" text NOT NULL,
    "startedAt" timestamp without time zone NOT NULL,
    "lastStirredAt" timestamp without time zone,
    "weight" double precision,
    "userInfoId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "maintenance_log" (
    "id" bigserial PRIMARY KEY,
    "plantId" bigint NOT NULL,
    "type" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "notes" text,
    "userInfoId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "plant_photo" (
    "id" bigserial PRIMARY KEY,
    "plantId" bigint NOT NULL,
    "imageUrl" text NOT NULL,
    "timestamp" timestamp without time zone NOT NULL,
    "notes" text,
    "userInfoId" bigint
);


--
-- MIGRATION VERSION FOR root_radar
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_radar', '20260128204331251', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260128204331251', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20251208110333922-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110333922-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_idp
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_idp', '20260109031533194', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260109031533194', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth', '20250825102351908-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250825102351908-v3-0-0', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod_auth_core
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod_auth_core', '20251208110412389-v3-0-0', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20251208110412389-v3-0-0', "timestamp" = now();


COMMIT;
