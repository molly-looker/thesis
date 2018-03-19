view: ethnicities {
  derived_table: {
    sql:
    SELECT
  PK,
  ethnicityy
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(LOWER(TRIM(ethnicity, ', ')))) as ethnicityy
GROUP BY 1,2
ORDER BY 1 DESC ;;
  }

  dimension: PK {
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: ethnicity {
    type:  string
    sql:  TRIM(${TABLE}.ethnicityy) ;;
    drill_fields: [PK]
  }

  measure: count {
    type: count
  }
}
