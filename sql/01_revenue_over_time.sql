-- 01 · Revenue over time (Umsatz über Zeit)
-- Frage: Wie viele Bestellungen und wie viel Umsatz gibt es pro Monat?

SELECT
    strftime('%Y-%m', o.order_purchase_timestamp) AS month,    -- Monat, z.B. "2018-05"
    COUNT(DISTINCT o.order_id)                     AS orders,   -- Anzahl Bestellungen
    ROUND(SUM(oi.price), 2)                         AS revenue   -- Umsatz = Summe der Preise
FROM orders o
JOIN order_items oi ON oi.order_id = o.order_id                -- Preise zu den Bestellungen holen
GROUP BY month                                                  -- eine Zeile pro Monat
ORDER BY month;
