view: religion {
  derived_table: {
    sql:
    SELECT
  PK,
  religionz
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(TRIM(LOWER(religion)),', ')) as religionz

GROUP BY 1,2
ORDER BY 1 DESC ;;
  }

  dimension: PK {
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: religion {
    type:  string
    sql:  ${TABLE}.religionz;;
  }

  measure: count {
    type: count
  }
}
