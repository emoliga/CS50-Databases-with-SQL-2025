CREATE TABLE "passengers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "age" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "check_ins" (
    "id" INTEGER,
    "date" NOT NULL,
    "passenger_id" INTEGER NOT NULL,
    "flight_id" INTEGER NOT NULL,
    FOREIGN KEY ("passenger_id") REFERENCES "passengers" ("id"),
    FOREIGN KEY ("flight_id") REFERENCES "flights" ("id")
);

CREATE TABLE "airlines" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "concourse" INTEGER NOT NULL
);

CREATE TABLE "flights" (
    "id" INTEGER,
    "number" INTEGER NOT NULL,
    "airline_id" INTEGER NOT NULL,
    "from_airport" TEXT NOT NULL,
    "to_airport" TEXT NOT NULL,
    "departure_time" NOT NULL,
    "arrival_time" NOT NULL,
    FOREIGN KEY ("airline_id") REFERENCES "airlines" ("id")
);
