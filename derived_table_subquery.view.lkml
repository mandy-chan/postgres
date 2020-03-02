view: derived_table_subquery {
  derived_table: {
    sql:

SELECT  c.host_id,
        c.all_time_revenue,
        MAX(c.last_date_earned) as last_date_earned,
        c.last_revenue_earned

FROM (

SELECT host_id,
       all_time_revenue,
       last_date_earned,
      -- price,
       lag(price, 1) OVER (PARTITION BY host_id ORDER BY last_date_earned) as last_revenue_earned

FROM (SELECT newyorkairbnb."host_id" as host_id,
       date_trunc('week', newyorkairbnb."last_review") as last_date_earned,
       SUM(newyorkairbnb."price") as price

       FROM newyorkairbnb
       WHERE newyorkairbnb."last_review" IS NOT NULL
       GROUP BY 1,2) a

       INNER JOIN

      (SELECT  SUM(newyorkairbnb."price") as all_time_revenue

        FROM public.newyorkairbnb
        ) b
      ON 1=1
      ) c

RIGHT JOIN

  (SELECT newyorkairbnb."host_id" as host_id,
          MAX(date_trunc('week', newyorkairbnb."last_review")) as last_date_earned

   FROM public.newyorkairbnb
   WHERE newyorkairbnb."last_review" IS NOT NULL
   GROUP BY 1 ) f

ON f.host_id = c.host_id AND f.last_date_earned = c.last_date_earned

WHERE c.last_revenue_earned IS NOT NULL
GROUP BY 1, 2, 4

;;
  }

  dimension: host_id {
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.host_id ;;
  }

  dimension: all_time_revenue {
    sql: ${TABLE}.all_time_revenue ;;
    type: number
  }

  dimension: lag {
    sql: ${TABLE}.lag_by_one ;;
    type: number
  }
#
#   dimension_group: last_review {
#     sql: ${TABLE}.last_review ;;
#   }
}
