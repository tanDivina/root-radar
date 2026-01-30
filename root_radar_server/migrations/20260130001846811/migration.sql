BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "fermentation" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "harvestId" bigint,
    "startedAt" timestamp without time zone NOT NULL,
    "status" text NOT NULL,
    "instructions" text,
    "lastTurnedAt" timestamp without time zone,
    "nextTurnAt" timestamp without time zone,
    "notes" text,
    "userInfoId" bigint
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "harvest" (
    "id" bigserial PRIMARY KEY,
    "name" text NOT NULL,
    "plantId" bigint,
    "harvestedAt" timestamp without time zone NOT NULL,
    "weight" double precision,
    "quality" text,
    "notes" text,
    "userInfoId" bigint
);


--
-- MIGRATION VERSION FOR root_radar
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('root_radar', '20260130001846811', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20260130001846811', "timestamp" = now();

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
