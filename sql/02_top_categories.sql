-- 02 · Top categories (Top-Kategorien)
-- Frage: Welche Produktkategorien bringen den meisten Umsatz?

SELECT
    t.product_category_name_english AS category,   -- Kategorie auf Englisch
    COUNT(DISTINCT oi.order_id)     AS orders,      -- Anzahl Bestellungen
    ROUND(SUM(oi.price), 2)         AS revenue      -- Umsatz = Summe der Preise
FROM order_items oi
JOIN products p ON p.product_id = oi.product_id                          -- Artikel -> Produkt
JOIN product_category_name_translation t
     ON t.product_category_name = p.product_category_name                 -- Produkt -> englischer Name
GROUP BY category                                                         -- eine Zeile pro Kategorie
ORDER BY revenue DESC                                                     -- größter Umsatz zuerst
LIMIT 10;                                                                 -- nur die Top 10

-- Hinweis: Produkte ohne Kategorie-Übersetzung fallen hier heraus (ca. 1,4 % des Umsatzes).
