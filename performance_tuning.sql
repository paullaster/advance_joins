SELECT 
COALESCE(orders.date, web_event.date) AS date,
orders.active_sales_reps AS sales_rep,
orders.order_id AS orders,
web_event.web_visits AS web_visits
FROM
(SELECT DATE_TRUNC('month', o.occurred_at) AS date,
 COUNT(a.sales_rep_id) AS active_sales_reps,
       COUNT(o.id) AS order_id
   FROM accounts a
	JOIN   orders o
	ON     o.account_id = a.id
    GROUP BY 1)orders
FULL JOIN   
(
  SELECT
  DATE_TRUNC('day', we.occurred_at) AS date,
  COUNT(we.id) AS web_visits
  FROM web_events we
  GROUP BY 1
  )web_event
 ON orders.date = web_event.date
 ORDER BY 1 DESC