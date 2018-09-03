DROP DATABASE if EXISTS bamazon;

CREATE DATABASE `bamazon` ;
use bamazon;

CREATE TABLE `products` (
  `item_id` INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(200) NULL,
  `department_name` VARCHAR(200) NULL,
  `price` DECIMAL(10,2) NULL,
  `stock_quantity` INT NULL,
  PRIMARY KEY (`item_id`),
UNIQUE INDEX `item_id_UNIQUE` (`item_id` ASC)
);

  INSERT INTO `products` (`product_name`,`department_name`,`price`,`stock_quantity`) VALUES ('FoodSaver T03-0023-01 Wide-Mouth Jar Sealer','Home & Kitchen',6.64,500);
INSERT INTO `products` (`product_name`,`department_name`,`price`,`stock_quantity`) VALUES ('DHP Emily Linen Chaise Lounger, Stylish Design with Chrome Legs, Grey','Home & Kitchen',129.99,50);
INSERT INTO `products` (`product_name`,`department_name`,`price`,`stock_quantity`) VALUES ('Gatorade Thirst Quencher, Green Apple, 12 Ounce Bottles (Pack of 24)','Grocery & Gourmet Food',11.65,515);
INSERT INTO `products` (`product_name`,`department_name`,`price`,`stock_quantity`) VALUES ('Sharpie 75847 Permanent Markers, Ultra Fine Point, Assorted Colors, 24-Count','Office Products',16.12,9);
INSERT INTO `products` (`product_name`,`department_name`,`price`,`stock_quantity`) VALUES ('Elmer\'s Liquid School Glue, Washable, Pack of 12','Office Products',6.00,400);
INSERT INTO `products` (`product_name`,`department_name`,`price`,`stock_quantity`) VALUES ('Dixon Ticonderoga Wood-Cased #2 HB Pencils, Box of 96, Yellow (13872)','Office Products',9.96,600);
INSERT INTO `products` (`product_name`,`department_name`,`price`,`stock_quantity`) VALUES ('EXPO 86601 Low-Odor Dry Erase Markers, Fine Tip, Assorted Colors, 8-Count','Office Products',6.39,100);
INSERT INTO `products` (`product_name`,`department_name`,`price`,`stock_quantity`) VALUES ('Pepperidge Farm, Goldfish, Crackers, Classic Mix, 29 oz, Variety Pack, Box, Snack Packs, Pack Of 30','Grocery & Gourmet Food',9.48,1000);
INSERT INTO `products` (`product_name`,`department_name`,`price`,`stock_quantity`) VALUES ('WELCH\'S Mixed Fruit Snacks, 0.9 Ounce, 40 Count','Grocery & Gourmet Food',6.63,300);
INSERT INTO `products` (`product_name`,`department_name`,`price`,`stock_quantity`) VALUES ('Spiderman for Playstation 4','Video Games',59.99,100);
