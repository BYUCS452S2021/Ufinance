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


/*
Link to UML: https://dbdiagram.io/d/6094a2a4b29a09603d13c57a
The team got together and designed this database. 
users(user_id, email, password_hash, first_name, middle_name, last_name, investment_strategy)
	Foreign key: investment_strategy references strategies 
The users table will hold all the information of our clients. The user_id is an auto generated number that will work as the primary key of the table. The investment strategy is a foreing key that references the strategies table which holds the client’s investment preference. This table represents an user. 

stock_prices(stock_ticker, timestamp, price, score) 
	Foreign key: stock_ticker references holdings
The stock prices table holds the closing price of the stocks that we use in our portfolios. The ticker and timestamp act as a joint primary key. This table will be used to calculate scores for the stocks and use them in portfolios depending on the client's investment strategy. This table represents a stock. 

strategies(investment_strategy, upper_bound, lower_bound)
The strategie stable holds an upper bound and lower bound of the assets that can be included in portfolios with the given investment strategy. 

holdings(user_id, stock_ticker, number_of_shares)
	Foreign key: user_id references users
	Foreign key: stock_ticker references stock_prices
The holdings table holds the current securities that are part of the clients portafolios. This table represents portfolios. 

No columns contain more than one value. Each relationship depends on the key(s) of the table.
The names of the columns of the table are pretty descriptive. Most of the logic behind the trades will come from scripts running in the background.  
*/


