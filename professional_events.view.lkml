view: professional_events {
  derived_table: {
    sql:
    SELECT
  PK,
  prof_events
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(TRIM(Have_you_in_the_past_year_,', '))) as prof_events
GROUP BY 1,2
ORDER BY 1 DESC ;;
  }

  dimension: PK {
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: prof_events {
    type:  string
    sql:  TRIM(${TABLE}.prof_events) ;;
    drill_fields: [PK]
  }

}
