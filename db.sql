CREATE TABLE "user" (
    user_id SERIAL PRIMARY KEY,
    full_name VARCHAR(255),
    email VARCHAR(255),
    password VARCHAR(255)
);

CREATE TABLE restaurant (
    res_id SERIAL PRIMARY KEY,
    res_name VARCHAR(255),
    image VARCHAR(255),
    "desc" VARCHAR(255)
);

CREATE TABLE food_type (
    type_id SERIAL PRIMARY KEY,
    type_name VARCHAR(255)
);

CREATE TABLE food (
    food_id SERIAL PRIMARY KEY,
    food_name VARCHAR(255),
    image VARCHAR(255),
    price DOUBLE PRECISION,
    "desc" VARCHAR(255),
    type_id INT,
    CONSTRAINT fk_food_type FOREIGN KEY (type_id) REFERENCES food_type(type_id)
);

CREATE TABLE sub_food (
    sub_id SERIAL PRIMARY KEY,
    sub_name VARCHAR(255),
    sub_price DOUBLE PRECISION,
    food_id INT,
    CONSTRAINT fk_sub_food FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE "order" (
    user_id INT,
    food_id INT,
    amount INT,
    code VARCHAR(255),
    arr_sub_id VARCHAR(255),
    PRIMARY KEY (user_id, food_id),
    CONSTRAINT fk_order_user FOREIGN KEY (user_id) REFERENCES "user"(user_id),
    CONSTRAINT fk_order_food FOREIGN KEY (food_id) REFERENCES food(food_id)
);

CREATE TABLE rate_res (
    user_id INT,
    res_id INT,
    amount INT,
    date_rate TIMESTAMP,
    PRIMARY KEY (user_id, res_id),
    CONSTRAINT fk_rate_user FOREIGN KEY (user_id) REFERENCES "user"(user_id),
    CONSTRAINT fk_rate_res FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);

CREATE TABLE like_res (
    user_id INT,
    res_id INT,
    date_like TIMESTAMP,
    PRIMARY KEY (user_id, res_id),
    CONSTRAINT fk_like_user FOREIGN KEY (user_id) REFERENCES "user"(user_id),
    CONSTRAINT fk_like_res FOREIGN KEY (res_id) REFERENCES restaurant(res_id)
);