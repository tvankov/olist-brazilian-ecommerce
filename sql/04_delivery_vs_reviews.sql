-- 04 · Delivery performance vs. reviews (Lieferung und Bewertung)
-- Frage: Bewerten Kunden schlechter, wenn die Lieferung zu spät kommt?

SELECT
    -- pünktlich = geliefert am oder vor dem versprochenen Termin, sonst verspätet
    CASE WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date
         THEN 'on time' ELSE 'late' END                      AS delivery,
    COUNT(DISTINCT o.order_id)                               AS orders,            -- Anzahl Bestellungen
    ROUND(AVG(r.review_score), 2)                            AS avg_review_score,  -- Ø Sterne (1 bis 5)
    ROUND(AVG(julianday(o.order_delivered_customer_date)
            - julianday(o.order_purchase_timestamp)), 1)     AS avg_delivery_days  -- Ø Tage von Kauf bis Lieferung
FROM orders o
JOIN order_reviews r ON r.order_id = o.order_id              -- Bewertung zur Bestellung holen
WHERE o.order_status = 'delivered'                           -- nur tatsächlich gelieferte Bestellungen
  AND o.order_delivered_customer_date IS NOT NULL            -- mit bekanntem Lieferdatum
GROUP BY delivery                                            -- eine Zeile für 'on time', eine für 'late'
ORDER BY delivery DESC;
