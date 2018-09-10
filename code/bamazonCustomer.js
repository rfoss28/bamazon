var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "1234",
  database: "bamazon"
});

connection.connect(function(err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId);
  displayProducts();
});

function displayProducts() {
  console.log("***** Items Available for Purchase*****\n");
  var query = "SELECT * FROM products";
  connection.query(query, function(err, res) {
    if (err) throw err;
    for (i = 0; i < res.length; i++) {
      console.log(
        "Item ID: " +
          res[i].item_id +
          "\nName: " +
          res[i].product_name +
          "\nPrice: " +
          res[i].price +
          "\n"
      );
    }
    orderPrompt();
  });
}

function orderPrompt() {
  inquirer
    .prompt([
      {
        name: "itemID",
        type: "input",
        message: "Please enter the ID# of the item you wish to purchase"
      },

      {
        name: "itemQuantity",
        type: "input",
        message: "How many would you like to order?"
      }
    ])
    .then(function(answer) {
      console.log(answer.itemID);

      connection.query(
        "SELECT * FROM products WHERE item_id=?",
        answer.itemID,
        function(err, res) {
          for (var i = 0; i < res.length; i++) {
            if (answer.itemQuantity <= res[i].stock_quantity) {
              console.log(
                "We have " +
                  res[i].stock_quantity +
                  " " +
                  res[i].product_name +
                  " in stock."
              );
              console.log(
                "You have ordered  " +
                  answer.itemQuantity +
                  " " +
                  res[i].product_name 
              );
              var newQuantity=res[i].stock_quantity - answer.itemQuantity;
              console.log(newQuantity);

              connection.query("UPDATE products SET ? Where ?", [{

                stock_quantity: newQuantity
              },{
                item_id: answer.itemID

              }], function(err,res){
                
              }
            )


              var purchaseTotal = answer.itemQuantity * res[i].price;
              console.log(" Your total is $" + purchaseTotal);
            } else {
              console.log("Insufficient Quantity!");
            }
          }
          displayProducts();
        }
      );
    });
}
