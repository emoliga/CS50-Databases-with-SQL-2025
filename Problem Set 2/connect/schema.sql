CREATE TABLE "people" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "schools" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "location" TEXT NOT NULL,
    "year" INTEGER NOT NULL
);

CREATE TABLE "companies" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "industry" TEXT NOT NULL,
    "location" TEXT NOT NULL
);

CREATE TABLE "connect_people" (
    "person_id1" INTEGER NOT NULL,
    "person_id2" INTEGER NOT NULL,
    FOREIGN KEY ("person_id1") REFERENCES "people" ("id"),
    FOREIGN KEY ("person_id2") REFERENCES "people" ("id")
);

CREATE TABLE "connect_school" (
    "person_id" INTEGER NOT NULL,
    "school_id" INTEGER NOT NULL,
    FOREIGN KEY ("person_id") REFERENCES "people" ("id"),
    FOREIGN KEY ("school_id") REFERENCES "schools" ("id")
);

CREATE TABLE "connect_company" (
    "person_id" INTEGER NOT NULL,
    "company_id" INTEGER NOT NULL,
    FOREIGN KEY ("person_id") REFERENCES "people" ("id"),
    FOREIGN KEY ("company_id") REFERENCES "companies" ("id")
);
