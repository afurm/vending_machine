# vending_machine

How to use:
 - Clone repo
 - In project directory run  ```ruby ./start init ```
 - You will see following:
    ```
    "Name   price   count"
    "Fanta => 2.7 => 3"
    "CocaCola => 2.0 => 2"
    "OrangeJuice => 3.0 => 1"
    "Sprite => 2.5 => 2"
    "Water => 3.25 => 0"
    ```
    This means you all done and file machine.json is created. This file is for store data about products/coins. You can you use this file to check how many products/coins are left.
    
  - Now you are ready to buy. Run this: ```ruby ./start buy Fanta 2.70``` if you want to buy a Fanta
  
  Some Examples: 
   - Buy Fanta:
     ```
     ruby ./start buy Fanta 3.70        
      >> "Found product Fanta"
      >> "Here you go Fanta (change -> 1.0)! Enjoy"
     ```
   - Buy Sprite:
      ```
      ruby ./start buy Sprite 333.70
      >> "Found product Sprite"
      >> "Here you go Sprite (change -> 57.75)! Enjoy"
      ```
