-- 03 · Orders by state (Bestellungen nach Bundesland)
-- Frage: Aus welchen Bundesländern kommen die meisten Bestellungen?

SELECT
    c.customer_state           AS state,     -- Bundesland, z.B. SP = São Paulo
    COUNT(DISTINCT o.order_id) AS orders,    -- Anzahl Bestellungen
    ROUND(SUM(oi.price), 2)    AS revenue    -- Umsatz = Summe der Preise
FROM orders o
JOIN customers c    ON c.customer_id = o.customer_id    -- das Bundesland steht beim Kunden
JOIN order_items oi ON oi.order_id   = o.order_id       -- der Preis steht bei den Artikeln
GROUP BY state                                           -- eine Zeile pro Bundesland
ORDER BY orders DESC                                     -- meiste Bestellungen zuerst
LIMIT 10;                                                -- nur die Top 10
