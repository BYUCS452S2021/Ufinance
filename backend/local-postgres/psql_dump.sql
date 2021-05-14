CREATE TABLE "users" (
  "user_id" SERIAL PRIMARY KEY,
  "email" VARCHAR UNIQUE NOT NULL,
  "password_has" VARCHAR NOT NULL,
  "first_name" VARCHAR NOT NULL,
  "middle_name" VARCHAR,
  "last_name" VARCHAR NOT NULL,
  "investment_strategy" int
);

CREATE TABLE "strategies" (
  "investment_strategy" INT PRIMARY KEY,
  "upper_bound" INT NOT NULL,
  "lower_bound" INT NOT NULL
);

CREATE TABLE "holdings" (
  "user_id" INT NOT NULL,
  "stock_ticker" VARCHAR UNIQUE NOT NULL,
  "number_of_shares" INT NOT NULL,
  PRIMARY KEY ("user_id", "stock_ticker")
);

CREATE TABLE "stock_prices" (
  "stock_ticker" VARCHAR NOT NULL,
  "timestamp" timestamp NOT NULL,
  "price" MONEY NOT NULL,
  "score" INT,
  PRIMARY KEY ("stock_ticker", "timestamp")
);

ALTER TABLE "holdings" ADD FOREIGN KEY ("user_id") REFERENCES "users" ("user_id");

ALTER TABLE "strategies" ADD FOREIGN KEY ("investment_strategy") REFERENCES "users" ("investment_strategy");

ALTER TABLE "stock_prices" ADD FOREIGN KEY ("stock_ticker") REFERENCES "holdings" ("stock_ticker");

