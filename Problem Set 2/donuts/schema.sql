CREATE TABLE "ingredients" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "price" INTEGER NOT NULL,
    PRIMARY KEY ("id")
);

CREATE TABLE "donuts" (
    "id" INTEGER,
    "name" TEXT NOT NULL,
    "gluten_free" INTEGER CHECK ("gluten_free" IN (0,1)),
    "price" INTEGER NOT NULL,
    "ingredient" TEXT NOT NULL,
    FOREIGN KEY ("ingredient") REFERENCES "ingredients" ("id")
);

CREATE TABLE "orders" (
    "id" INTEGER,
    "number" INTEGER NOT NULL,
    "donut_id" INTEGER NOT NULL,
    "costumer_id" INTEGER NOT NULL,
    FOREIGN KEY ("costumer_id") REFERENCES "costumers" ("id"),
    FOREIGN KEY ("donut_id") REFERENCES "donuts" ("id")
);

CREATE TABLE "costumers" (
    "id" INTEGER,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "order_id" INTEGER NOT NULL,
    FOREIGN KEY ("order_id") REFERENCES "orders" ("id")
);
