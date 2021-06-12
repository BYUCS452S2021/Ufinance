CREATE TABLE strategies (
    investment_strategy_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    investment_strategy_name VARCHAR NOT NULL,
    risk_lower_bound INT NOT NULL,
    risk_upper_bound INT NOT NULL,
    strategy_description VARCHAR NOT NULL,
    UNIQUE (risk_lower_bound, risk_upper_bound)
);

CREATE TABLE users (
    user_id INT GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    email_address VARCHAR UNIQUE NOT NULL,
    password_hash VARCHAR NOT NULL,
    first_name VARCHAR NOT NULL,
    middle_name VARCHAR,
    last_name VARCHAR NOT NULL,
	investment_strategy INT REFERENCES strategies ON DELETE SET NULL
);

CREATE TABLE tokens (
    token VARCHAR PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users ON DELETE CASCADE,
    expiration_timestamp INT NOT NULL
);

CREATE TABLE holdings (
    user_id INT NOT NULL REFERENCES users ON DELETE CASCADE,
    stock_ticker VARCHAR NOT NULL,
    number_of_shares INT NOT NULL,
    PRIMARY KEY (user_id, stock_ticker)
);

CREATE TABLE stock_prices (
    stock_ticker VARCHAR,
    timestamp TIMESTAMP NOT NULL,
    price MONEY NOT NULL CHECK (price > '0'),
    PRIMARY KEY (stock_ticker, timestamp)
);

INSERT INTO strategies VALUES
    (DEFAULT, 'Safe', 0, 25, 'Only the most consistent stocks will be recommended. Low-risk, low-reward.'),
    (DEFAULT, 'Conservative', 25, 50, 'Investing in lower-risk securities such as blue-chip stocks'),
    (DEFAULT, 'Moderate', 50, 75, 'Designed to balance protection against potential capital losses with meaningful investment growth and balance higher expected growth with more variation in potential returns.'),
    (DEFAULT, 'Aggressive', 75, 100, 'Seeks outsized gains and accepts the outsized risks that go with them. High-risk, high-reward');

INSERT INTO stock_prices VALUES
    ('GME', '2021-05-10 10:00:00', 9000),
    ('GME', '2021-05-10 11:00:00', 9100),
    ('GME', '2021-05-10 12:00:00', 9200),
    ('GME', '2021-05-10 13:00:00', 9300),
    ('AMC', '2021-05-10 10:00:00', 50),
    ('AMC', '2021-05-10 11:00:00', 100),
    ('AMC', '2021-05-10 12:00:00', 200),
    ('AMC', '2021-05-10 13:00:00', 25),
    ('BORING', '2021-05-10 10:00:00', 101),
    ('BORING', '2021-05-10 11:00:00', 102),
    ('BORING', '2021-05-10 12:00:00', 102.5),
    ('BORING', '2021-05-10 13:00:00', 102),
    ('AWH', '2021-05-10 13:00:00', 45),
    ('BTW', '2021-05-10 13:00:00', 82.5),
    ('AAPL', '2021-05-10 13:00:00', 970),
    ('DOGE', '2021-05-10 13:00:00', .40),
    ('BHU', '2021-05-10 13:00:00', 12),
    ('SAP', '2021-05-10 13:00:00', 500);

INSERT INTO users VALUES
    (DEFAULT, 'john@example.com', 'some hash', 'John', NULL, 'Adams', 1),
    (DEFAULT, 'sam@example.com', 'some hash', 'Samantha', NULL, 'McGrady', 2),
    (DEFAULT, 'greg@example.com', 'some hash', 'Greg', NULL, 'Wild', 3),
    (DEFAULT, 'steve@example.com', 'some hash', 'Steve', NULL, 'Bobby', 3),
    (DEFAULT, 'stacy@example.com', 'some hash', 'Stacy', NULL, 'Jeffries', 4),
    (DEFAULT, 'gwen@example.com', 'some hash', 'Gwen', NULL, 'Small', 1);

INSERT INTO holdings VALUES
    ((select user_id from users where email_address = 'sam@example.com'), 'GME', 1),
    ((select user_id from users where email_address = 'sam@example.com'), 'AMC', 3),
    ((select user_id from users where email_address = 'sam@example.com'), 'AWH', 4),
    ((select user_id from users where email_address = 'sam@example.com'), 'BTW', 80),
    ((select user_id from users where email_address = 'sam@example.com'), 'AAPL', 1),
    ((select user_id from users where email_address = 'sam@example.com'), 'DOGE', 300),
    ((select user_id from users where email_address = 'sam@example.com'), 'BHU', 4),
    ((select user_id from users where email_address = 'sam@example.com'), 'SAP', 6),
    ((select user_id from users where email_address = 'greg@example.com'), 'GME', 5);

INSERT INTO tokens VALUES
    ('john', (select user_id from users where email_address = 'john@example.com'), 10),
    ('sam', (select user_id from users where email_address = 'sam@example.com'), 10),
    ('greg', (select user_id from users where email_address = 'greg@example.com'), 10);

CREATE MATERIALIZED VIEW stock_statistics AS
    SELECT
        stock_prices.stock_ticker,
        current.price AS current_price,
        MAX(stock_prices.price) AS max_price,
        MIN(stock_prices.price) AS min_price,
        STDDEV(CAST (stock_prices.price as numeric)) AS standard_deviation
    FROM stock_prices, (
        select distinct on (stock_ticker)
            stock_ticker,
            price,
            timestamp
        from stock_prices
        order by stock_ticker, timestamp desc
    ) current
    WHERE stock_prices.stock_ticker = current.stock_ticker
    GROUP BY stock_prices.stock_ticker, current.price;

-- select * from stock_statistics;
--  stock_ticker | current_price | max_price | min_price |   standard_deviation
-- --------------+---------------+-----------+-----------+------------------------
--  AMC          |        $25.00 |   $200.00 |    $25.00 |    77.3923984208612915
--  BORING       |       $102.00 |   $102.50 |   $101.00 | 0.62915286960589580810
--  GME          |     $9,300.00 | $9,300.00 | $9,000.00 |       129.099444873581
