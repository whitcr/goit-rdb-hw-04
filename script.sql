SELECT 
    order_details.*, 
    orders.*, 
    customers.*, 
    products.*, 
    categories.*, 
    employees.*, 
    shippers.*, 
    suppliers.*
FROM 
    order_details
INNER JOIN 
    orders ON order_details.order_id = orders.id
INNER JOIN 
    customers ON orders.customer_id = customers.id
INNER JOIN 
    products ON order_details.product_id = products.id
INNER JOIN 
    categories ON products.category_id = categories.id
INNER JOIN 
    employees ON orders.employee_id = employees.employee_id
INNER JOIN 
    shippers ON orders.shipper_id = shippers.id
INNER JOIN 
    suppliers ON products.supplier_id = suppliers.id;
    
-- -----------

SELECT COUNT(*)
FROM 
    order_details
INNER JOIN 
    orders ON order_details.order_id = orders.id
INNER JOIN 
    customers ON orders.customer_id = customers.id
INNER JOIN 
    products ON order_details.product_id = products.id
INNER JOIN 
    categories ON products.category_id = categories.id
INNER JOIN 
    employees ON orders.employee_id = employees.employee_id
INNER JOIN 
    shippers ON orders.shipper_id = shippers.id
INNER JOIN 
    suppliers ON products.supplier_id = suppliers.id;
    
-- -----------

SELECT COUNT(*)
FROM 
    order_details
LEFT JOIN 
    orders ON order_details.order_id = orders.id
LEFT JOIN 
    customers ON orders.customer_id = customers.id
LEFT JOIN 
    products ON order_details.product_id = products.id
RIGHT JOIN 
    categories ON products.category_id = categories.id
RIGHT JOIN 
    employees ON orders.employee_id = employees.employee_id
RIGHT JOIN 
    shippers ON orders.shipper_id = shippers.id
INNER JOIN 
    suppliers ON products.supplier_id = suppliers.id;

-- Кількість рядків не змінюється, тому що всі записи в таблицях, що об`єднуються,
-- мають відповідні записи в звязаних таблицях
    
-- -----------

SELECT *
FROM 
    order_details
INNER JOIN 
    orders ON order_details.order_id = orders.id
INNER JOIN 
    customers ON orders.customer_id = customers.id
INNER JOIN 
    products ON order_details.product_id = products.id
INNER JOIN 
    categories ON products.category_id = categories.id
INNER JOIN 
    employees ON orders.employee_id = employees.employee_id
INNER JOIN 
    shippers ON orders.shipper_id = shippers.id
INNER JOIN 
    suppliers ON products.supplier_id = suppliers.id
WHERE 
    employees.employee_id > 3 AND employees.employee_id <= 10;
    
-- -----------

SELECT 
    categories.name, 
    COUNT(*) AS count, 
    AVG(order_details.quantity) AS avg_quantity
FROM 
    order_details
INNER JOIN 
    orders ON order_details.order_id = orders.id
INNER JOIN 
    customers ON orders.customer_id = customers.id
INNER JOIN 
    products ON order_details.product_id = products.id
INNER JOIN 
    categories ON products.category_id = categories.id
INNER JOIN 
    employees ON orders.employee_id = employees.employee_id
INNER JOIN 
    shippers ON orders.shipper_id = shippers.id
INNER JOIN 
    suppliers ON products.supplier_id = suppliers.id
GROUP BY 
    categories.name;
        
-- -----------
    
SELECT 
    categories.name, 
    COUNT(*) AS count, 
    AVG(order_details.quantity) AS avg_quantity
FROM 
    order_details
INNER JOIN 
    orders ON order_details.order_id = orders.id
INNER JOIN 
    customers ON orders.customer_id = customers.id
INNER JOIN 
    products ON order_details.product_id = products.id
INNER JOIN 
    categories ON products.category_id = categories.id
INNER JOIN 
    employees ON orders.employee_id = employees.employee_id
INNER JOIN 
    shippers ON orders.shipper_id = shippers.id
INNER JOIN 
    suppliers ON products.supplier_id = suppliers.id
GROUP BY 
    categories.name
HAVING 
    AVG(order_details.quantity) > 21;
    
-- -----------

SELECT 
    categories.name, 
    COUNT(*) AS count, 
    AVG(order_details.quantity) AS avg_quantity
FROM 
    order_details
INNER JOIN 
    orders ON order_details.order_id = orders.id
INNER JOIN 
    customers ON orders.customer_id = customers.id
INNER JOIN 
    products ON order_details.product_id = products.id
INNER JOIN 
    categories ON products.category_id = categories.id
INNER JOIN 
    employees ON orders.employee_id = employees.employee_id
INNER JOIN 
    shippers ON orders.shipper_id = shippers.id
INNER JOIN 
    suppliers ON products.supplier_id = suppliers.id
GROUP BY 
    categories.name
HAVING 
    AVG(order_details.quantity) > 21
ORDER BY 
    count DESC;
    
-- -----------

SELECT *
FROM (
    SELECT 
        categories.name, 
        COUNT(*) AS count, 
        AVG(order_details.quantity) AS avg_quantity
    FROM 
        order_details
    INNER JOIN 
        orders ON order_details.order_id = orders.id
    INNER JOIN 
        customers ON orders.customer_id = customers.id
    INNER JOIN 
        products ON order_details.product_id = products.id
    INNER JOIN 
        categories ON products.category_id = categories.id
    INNER JOIN 
        employees ON orders.employee_id = employees.employee_id
    INNER JOIN 
        shippers ON orders.shipper_id = shippers.id
    INNER JOIN 
        suppliers ON products.supplier_id = suppliers.id
    GROUP BY 
        categories.name
    HAVING 
        AVG(order_details.quantity) > 21
    ORDER BY 
        count DESC
    LIMIT 5 OFFSET 1
) AS filtered
LIMIT 4;
