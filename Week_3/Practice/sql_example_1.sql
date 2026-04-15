-- 1. Create a temporary table for testing
CREATE TABLE coffee_inventory (
    id INTEGER PRIMARY KEY,
    bean_name TEXT NOT NULL,
    roast_level TEXT,
    stock_kg DECIMAL(5,2),
    last_restocked DATE
);

-- 2. Insert some dummy data
INSERT INTO coffee_inventory (id, bean_name, roast_level, stock_kg, last_restocked)
VALUES 
(1, 'Ethiopian Yirgacheffe', 'Light', 12.50, '2024-03-15'),
(2, 'Sumatra Mandheling', 'Dark', 8.00, '2024-04-01'),
(3, 'Colombian Supremo', 'Medium', 25.40, '2024-04-10'),
(4, 'Guatemala Antigua', 'Medium', 5.20, '2024-03-20');

-- 3. Run a query to verify everything is working
-- This selects beans with low stock (less than 10kg)
SELECT 
    bean_name, 
    stock_kg, 
    last_restocked
FROM coffee_inventory
WHERE stock_kg < 10
ORDER BY stock_kg ASC;

-- 4. Optional: Clean up (Uncomment the line below if you want to delete the table after testing)
-- DROP TABLE coffee_inventory;