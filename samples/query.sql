
--Consultas
-- 1 - Listar todos os Clientes que não tenham realizado uma compra:

SELECT c.customer_id, c.first_name
FROM customers c
LEFT JOIN orders p ON c.customer_id = p.customer_id
WHERE p.order_id IS NULL;

-- 2 - Listar os Produtos que não tenham sido comprados:

SELECT p.products_id, p.product_name
FROM products p
LEFT JOIN order_items oi ON p.order_id = oi.order_id
WHERE oi.order_id IS NULL;

-- 3 - Listar os Produtos sem Estoque:

SELECT p.products_id, p.product_name
FROM products p
INNER JOIN stocks s on s.products_id = p.products_id
WHERE p.products_id = 0;

-- 4 - Agrupar a quantidade de vendas que uma determinada Marca realizou por Loja:

SELECT l.Nome AS Loja, m.Nome AS Marca, SUM(ip.Quantidade) AS QuantidadeVendas
FROM order_items oi
JOIN products p ON oi.products_id = p.products_id
JOIN brands b ON p.brand_id = b.brand_id
JOIN orders o ON oi.order_id = o.order_id
JOIN stores s ON o.staff_id = s.staff_id
GROUP BY s.first_name, b.brand_name
ORDER BY s.first_name, b.brand_name;

-- 5 - Listar os Funcionários que não estejam relacionados a um Pedido:

SELECT f.staff_id, f.first_name
FROM staffs s
LEFT JOIN orders o ON s.staff_id = o.staff_id
WHERE o.staff_id IS NULL;
