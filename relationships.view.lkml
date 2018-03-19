view: relationships {
  derived_table: {
    sql:
    SELECT
  PK,
  relationship
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(LOWER(TRIM(relationship_status,', ')))) as relationship
GROUP BY 1,2
ORDER BY 1 DESC ;;
  }

  dimension: PK {
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: relationship {
    type:  string
    sql:  case when (${TABLE}.relationship like "%poly%") then "polyamorous"
              when (${TABLE}.relationship like "%open%") then "open relationship"
              else ${TABLE}.relationship end ;;
    drill_fields: [PK]
  }


  measure: count {
    type: count
  }
}
