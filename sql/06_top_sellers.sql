-- 06 · Top sellers (beste Verkäufer)
-- Frage: Welche Verkäufer machen den meisten Umsatz, und wo sitzen sie?

SELECT
    oi.seller_id,                                      -- Verkäufer-ID
    s.seller_state              AS state,                -- Bundesland des Verkäufers
    COUNT(DISTINCT oi.order_id) AS orders,               -- Anzahl Bestellungen
    ROUND(SUM(oi.price), 2)     AS revenue               -- Umsatz = Summe der Preise
FROM order_items oi
JOIN sellers s ON s.seller_id = oi.seller_id             -- Verkäufer-Daten (Bundesland) dazuholen
GROUP BY oi.seller_id                                    -- eine Zeile pro Verkäufer
ORDER BY revenue DESC                                    -- größter Umsatz zuerst
LIMIT 10;                                                -- nur die Top 10
