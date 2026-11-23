-- 05 · Payment methods (Zahlungsarten)
-- Frage: Wie bezahlen Kunden, und wie oft nutzen sie Ratenzahlung?

SELECT
    payment_type,                                          -- Zahlungsart, z.B. credit_card, boleto
    COUNT(DISTINCT order_id)            AS orders,           -- Anzahl Bestellungen
    ROUND(SUM(payment_value), 2)        AS total_value,      -- gezahlte Summe
    ROUND(AVG(payment_installments), 1) AS avg_installments  -- Ø Anzahl Raten
FROM order_payments                                          -- hier reicht eine Tabelle, kein JOIN nötig
GROUP BY payment_type                                        -- eine Zeile pro Zahlungsart
ORDER BY orders DESC;                                        -- häufigste Zahlungsart zuerst

-- Hinweis: payment_value enthält auch die Versandkosten, deshalb ist die
-- Summe höher als der Umsatz aus Abfrage 1 (nur Artikelpreise).
