CREATE TABLE "users" (
  "id" SERIAL PRIMARY KEY,
  "email" varchar UNIQUE NOT NULL,
  "first_name" varchar NOT NULL,
  "middle_name" varchar,
  "last_name" varchar NOT NULL,
  "investment_strategy" int
);

CREATE TABLE "Strategies" (
  "investment_strategy" int PRIMARY KEY,
  "upper_bound" int NOT NULL,
  "lower_bound" int NOT NULL
);

CREATE TABLE "Portafolios" (
  "user_id" int,
  "stock_ticker" varchar UNIQUE NOT NULL,
  "num_shares" int NOT NULL
);

CREATE TABLE "stock" (
  "stock_ticker" varchar PRIMARY KEY,
  "update_date" timestamp,
  "price" float,
  "score" int
);

ALTER TABLE "Portafolios" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("id");

ALTER TABLE "Strategies" ADD FOREIGN KEY ("investment_strategy") REFERENCES "users" ("investment_strategy");

ALTER TABLE "Portafolios" ADD FOREIGN KEY ("stock_ticker") REFERENCES "stock" ("stock_ticker");
