USE express_foods;

DROP TRIGGER IF EXISTS update_total_on_insert;
DROP TRIGGER IF EXISTS update_total_on_update;
DROP TRIGGER IF EXISTS update_total_on_delete;

DROP TABLE IF EXISTS Order_items;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Addresses;
DROP TABLE IF EXISTS Users;
DROP TABLE IF EXISTS Delivers;
DROP TABLE IF EXISTS Menu;



CREATE TABLE Users (
    user_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR (255) NOT NULL,
    password VARCHAR (255) NOT NULL,
    role ENUM ('customer', 'employee') DEFAULT 'customer',
    first_name VARCHAR (40) NOT NULL,
    last_name VARCHAR (40) NOT NULL,
    phone INT,
    register_date DATETIME NOT NULL
);
INSERT INTO Users VALUES (NULL, 'fake@gmail.com', 'password', 'customer', 'Thierry', 'Henry', 123456789, '2018-09-12 00:00:00');
INSERT INTO Users VALUES (NULL, 'notreal@gmail.com', 'pa55word', 'customer', 'Dennise', 'Bergkamp', 012345678, '2018-11-01 18:25:08');
INSERT INTO Users VALUES (NULL, 'dontuse@gmail.com', 'PAssWord', 'customer', 'Robert', 'Pires', 0851234567, '2018-08-23 15:31:00');
INSERT INTO Users VALUES (NULL, 'arsenalfc@hotmail.com', 'gunners', 'customer', 'Arsene', 'Wenger', 0875567892, '2018-08-20 13:00:03');
INSERT INTO Users VALUES (NULL, 'mymail@hotmail.com', 'guessit', 'customer', 'Aaron', 'Ramsey', 0895677834, '2018-08-02 12:55:26');
INSERT INTO Users VALUES (NULL, 'dontmailme@gmail.com', 'idontknow', 'customer', 'Jack', 'Wilshire', 0872341231, '2018-07-29 15:45:00');
INSERT INTO Users VALUES (NULL, 'youremail@gmail.com', 'youchoose', 'customer', 'Tony', 'Adams', 0854565324, '2018-07-22 17:10:00');
INSERT INTO Users VALUES (NULL, 'needajob@hotmail.com', 'paSSword', 'employee', 'Lee', 'Dixon', 01411235, '2018-04-12 20:15:07');
INSERT INTO Users VALUES (NULL, 'expressfood@hotmail.com', 'express', 'employee', 'Ashley', 'Cole', 01411234, '2018-04-12 20:24:56');
INSERT INTO Users VALUES (NULL, 'imaguest@gmail.com', 'noidea', 'customer', 'Peter', 'Cech', 0877312858, '2018-04-13 17:30:00');
INSERT INTO Users VALUES (NULL, 'cantthinkofone@gmail.com', 'freewifi', 'customer', 'Rob', 'Holding', 0877312858, '2018-04-13 22:04:36');



CREATE TABLE Addresses (
    address_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    address VARCHAR(50) NOT NULL,
    town VARCHAR(50) NOT NULL,
    city VARCHAR(50) NOT NULL,
    country VARCHAR(50) NOT NULL,
    eircode VARCHAR(7) NOT NULL,
    payment_method ENUM ('credit_card', 'paypal', 'cash') DEFAULT 'credit_card',
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE SET NULL
);
ALTER TABLE Addresses AUTO_INCREMENT=20;
INSERT INTO Addresses VALUES (NULL, '4 Newroad', 'Jobstown', 'Tallaght', 'Dublin', 'D24PY22', 'credit_card', 1);
INSERT INTO Addresses VALUES (NULL, '12 Glenclue', 'Brookfield', 'Blessington', 'Wicklow', 'W10SS32', 'credit_card', 2);
INSERT INTO Addresses VALUES (NULL, '80 Street', 'Brookview', 'Greenhills', 'Dublin', 'D22P22Y', 'credit_card', 3);
INSERT INTO Addresses VALUES (NULL, '123 Fakestreet', 'Christchurch', 'Clondalkin', 'Dublin', 'D23PY45', 'credit_card', 4);
INSERT INTO Addresses VALUES (NULL, '27 Brickhouse', 'Jobstown', 'Tallaght', 'Dublin', 'D24PY80', 'credit_card', 5);
INSERT INTO Addresses VALUES (NULL, '34 Greenview', 'Killtipper', 'Blessington', 'Wicklow', 'W10WW23', 'credit_card', 6);
INSERT INTO Addresses VALUES (NULL, '2 Newroad', 'Jobstown', 'Tallaght', 'Dublin', 'D24P2YY', 'credit_card', 7);
INSERT INTO Addresses VALUES (NULL, '45 Bridgeview', 'Knocklyn', 'Greenhills', 'Dublin', 'D22P2Y2', NULL, 8);
INSERT INTO Addresses VALUES (NULL, '45 Bridgeview', 'Knocklyn', 'Greenhills', 'Dublin', 'D22P2Y2', NULL, 9);
INSERT INTO Addresses VALUES (NULL, '15 Dlenview', 'Brookview', 'Clondalkin', 'Dublin', 'D23P445', 'credit_card', 10);
INSERT INTO Addresses VALUES (NULL, '1 Sundale', 'Ardmore', 'Blessington', 'Wicklow', 'W10W532', 'credit_card',11);


CREATE TABLE Delivers (
    delivery_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR (40) NOT NULL,
    last_name VARCHAR (40) NOT NULL,
    phone INT NOT NULL
);
ALTER TABLE Delivers AUTO_INCREMENT=12;
INSERT INTO Delivers VALUES (NULL, 'Robbie', 'Keane', 087123721);
INSERT INTO Delivers VALUES (NULL, 'Roy', 'Keane', 087128893);
INSERT INTO Delivers VALUES (NULL, 'David', 'Seaman', 085443721);
INSERT INTO Delivers VALUES (NULL, 'Shane', 'Long', 085997321);
INSERT INTO Delivers VALUES (NULL, 'Damien', 'Duff', 087100981);



CREATE TABLE Orders (
    order_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    delivery_id INT,
    address VARCHAR (50),
    town VARCHAR (50),
    city VARCHAR (50),
    country VARCHAR (50),
    eircode VARCHAR (7),
    total FLOAT (4,2) NOT NULL,
    status ENUM ('pending', 'processing', 'delivered') DEFAULT 'pending',
    date DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES Users (user_id) ON DELETE SET NULL,
    FOREIGN KEY (delivery_id) REFERENCES Delivers (delivery_id) ON DELETE SET NULL
);
ALTER TABLE Orders AUTO_INCREMENT=40;
INSERT INTO Orders VALUES (NULL, 1, 12, '4 Newroad', 'Jobstown', 'Tallaght', 'Dublin', 'D24PY22', 0.00, 'delivered', '2018-09-12 01:00:10');
INSERT INTO Orders VALUES (NULL, 2, 13, '12 Glenclue', 'Brookfield', 'Blessington', 'Wicklow', 'W10SS32', 0.00, 'delivered', '2018-11-01 18:27:00');
INSERT INTO Orders VALUES (NULL, 3, 14, '80 Street', 'Brookview', 'Greenhills', 'Dublin', 'D22P22Y', 0.00, 'delivered', '2018-08-23 15:36:20');
INSERT INTO Orders VALUES (NULL, 4, 15, '123 Fakestreet', 'Christchurch', 'Clondalkin', 'Dublin', 'D23PY45', 0.00, 'delivered', '2018-08-20 13:10:45');
INSERT INTO Orders VALUES (NULL, 5, 16, '27 Brickhouse', 'Jobstown', 'Tallaght', 'Dublin', 'D24PY80', 0.00, 'delivered', '2018-08-02 12:58:00');
INSERT INTO Orders VALUES (NULL, 6, 12, '34 Greenview', 'Killtipper', 'Blessington', 'Wicklow', 'W10WW23', 0.00, 'delivered', '2018-07-29 15:50:30');
INSERT INTO Orders VALUES (NULL, 7, 16, '2 Newroad', 'Jobstown', 'Tallaght', 'Dublin', 'D24P2YY', 0.00, 'delivered', '2018-07-22 17:19:36');
INSERT INTO Orders VALUES (NULL, 10, 13, '15 Dlenview', 'Brookview', 'Clondalkin', 'Dublin', 'D23P445', 0.00, 'delivered', '2018-11-22 17:34:22');
INSERT INTO Orders VALUES (NULL, 11, 12, '1 Sundale', 'Ardmore', 'Blessington', 'Wicklow', 'W10W532', 0.00, 'delivered', '2018-04-13 22:11:08');



CREATE TABLE Menu (
    item_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    price FLOAT(3,2) NOT NULL,
    description VARCHAR (50) NOT NULL
);
ALTER TABLE Menu AUTO_INCREMENT=70;
INSERT INTO Menu VALUES (NULL, 5.00, 'Pasta');
INSERT INTO Menu VALUES (NULL, 5.00, 'lasagne');
INSERT INTO Menu VALUES (NULL, 5.00, 'Mac n Cheese');
INSERT INTO Menu VALUES (NULL, 5.00, 'Honey Lime Chicken');
INSERT INTO Menu VALUES (NULL, 5.00, 'steak');
INSERT INTO Menu VALUES (NULL, 5.00, 'Chicken Burger');
INSERT INTO Menu VALUES (NULL, 5.00, 'Beef Burger');
INSERT INTO Menu VALUES (NULL, 5.00, 'Pizza');
INSERT INTO Menu VALUES (NULL, 5.00, 'Chicken Wings');
INSERT INTO Menu VALUES (NULL, 5.00, 'Strawberry Ice Cream');
INSERT INTO Menu VALUES (NULL, 5.00, 'Chocolate Ice Cream');
INSERT INTO Menu VALUES (NULL, 5.00, 'Fudge Cake');
INSERT INTO Menu VALUES (NULL, 5.00, 'Chocolate Mouse');
INSERT INTO Menu VALUES (NULL, 5.00, 'Apple Pie');
INSERT INTO Menu VALUES (NULL, 5.00, 'Chocolate Frozen Yoghurt');
INSERT INTO Menu VALUES (NULL, 5.00, 'Strawberry Frozen Yoghurt');
INSERT INTO Menu VALUES (NULL, 5.00, 'Cheese Cake');



CREATE TABLE Order_items (
    order_item_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    item_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders (order_id) ON DELETE SET NULL,
    FOREIGN KEY (item_id) REFERENCES Menu (item_id) ON DELETE SET NULL
);
ALTER TABLE Order_items AUTO_INCREMENT=90;



-- SHOW TABLES;
-- DESCRIBE order_items;

-- SELECT order_id, total FROM orders;
-- SELECT * FROM Order_items WHERE order_id = 40;

-- INSERT INTO Order_items VALUES (NULL, 40, 74, 2);
-- DELETE FROM order_items WHERE order_item_id = 114;
-- UPDATE order_items SET quantity = 1 WHERE order_item_id = 113;

DELIMITER $$
CREATE TRIGGER update_total_on_insert AFTER INSERT ON order_items FOR EACH ROW BEGIN
    DECLARE order_total FLOAT;
    
    SELECT SUM(total_per_each) total
    FROM (
        SELECT order_id, quantity * price total_per_each
        FROM (
            SELECT oi.order_id order_id, oi.quantity quantity, m.price price, m.item_id item_id
            FROM order_items AS oi
            JOIN menu AS m
            ON oi.item_id = m.item_id
        ) AS T1
    ) AS T2
    WHERE order_id = NEW.order_id
    GROUP BY order_id
    INTO order_total;
    
    UPDATE orders
    SET total = order_total
    WHERE orders.order_id = NEW.order_id;
    
END $$

CREATE TRIGGER update_total_on_update AFTER UPDATE ON order_items FOR EACH ROW BEGIN
    DECLARE order_total FLOAT;
    
    SELECT SUM(total_per_each) total
    FROM (
        SELECT order_id, quantity * price total_per_each
        FROM (
            SELECT oi.order_id order_id, oi.quantity quantity, m.price price, m.item_id item_id
            FROM order_items AS oi
            JOIN menu AS m
            ON oi.item_id = m.item_id
        ) AS T1
    ) AS T2
    WHERE order_id = NEW.order_id
    GROUP BY order_id
    INTO order_total;
    
    UPDATE orders
    SET total = order_total
    WHERE orders.order_id = NEW.order_id;
    
END $$


CREATE TRIGGER update_total_on_delete AFTER DELETE ON order_items FOR EACH ROW BEGIN
    DECLARE order_total FLOAT;
    
    SELECT SUM(total_per_each) total
    FROM (
        SELECT order_id, quantity * price total_per_each
        FROM (
            SELECT oi.order_id order_id, oi.quantity quantity, m.price price, m.item_id item_id
            FROM order_items AS oi
            JOIN menu AS m
            ON oi.item_id = m.item_id
        ) AS T1
    ) AS T2
    WHERE order_id = OLD.order_id
    GROUP BY order_id
    INTO order_total;
    
    UPDATE orders
    SET total = order_total
    WHERE orders.order_id = OLD.order_id;
    
END $$

DELIMITER ;




INSERT INTO Order_items VALUES (NULL, 40, 70, 1);
INSERT INTO Order_items VALUES (NULL, 40, 81, 1);
INSERT INTO Order_items VALUES (NULL, 41, 78, 2);
INSERT INTO Order_items VALUES (NULL, 41, 86, 2);
INSERT INTO Order_items VALUES (NULL, 42, 73, 1);
INSERT INTO Order_items VALUES (NULL, 42, 74, 1);
INSERT INTO Order_items VALUES (NULL, 43, 81, 1);
INSERT INTO Order_items VALUES (NULL, 43, 72, 1);
INSERT INTO Order_items VALUES (NULL, 44, 71, 1);
INSERT INTO Order_items VALUES (NULL, 44, 75, 1);
INSERT INTO Order_items VALUES (NULL, 44, 83, 2);
INSERT INTO Order_items VALUES (NULL, 45, 75, 1);
INSERT INTO Order_items VALUES (NULL, 45, 70, 1);
INSERT INTO Order_items VALUES (NULL, 45, 82, 1);
INSERT INTO Order_items VALUES (NULL, 46, 77, 2);
INSERT INTO Order_items VALUES (NULL, 46, 78, 1);
INSERT INTO Order_items VALUES (NULL, 46, 81, 1);
INSERT INTO Order_items VALUES (NULL, 47, 74, 1);
INSERT INTO Order_items VALUES (NULL, 47, 86, 1);
INSERT INTO Order_items VALUES (NULL, 48, 76, 2);
INSERT INTO Order_items VALUES (NULL, 48, 85, 1);



SELECT * FROM Users;
SELECT * FROM Addresses;
SELECT * FROM Orders;
SELECT * FROM Delivers;
SELECT * FROM Order_items;
SELECT * FROM Menu;

SELECT Users.user_id, Users.first_name, Users.last_name, Users.role, Addresses.address_id, Addresses.payment_method
FROM Users
JOIN Addresses
ON Users.user_id = Addresses.user_id;


SELECT Users.user_id, Users.first_name, Users.last_name, Orders.order_id, Orders.delivery_id, Orders.date
FROM Users
JOIN Orders
ON Users.user_id = Orders.user_id;

SELECT Orders.order_id, Orders.user_id, Orders.delivery_id, Order_items.item_id
FROM Orders
JOIN Order_items
ON Orders.order_id = Order_items.order_id;









