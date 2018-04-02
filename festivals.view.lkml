view: festivals {
  derived_table: {
    sql:
    SELECT
  PK,
  festival
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(TRIM(What_criteria_do_you_use_in_determining_if_you_ll_go_to_a_fire_flow_festival_,', '))) as  festival
GROUP BY 1,2
ORDER BY 1 DESC ;;
  }

  dimension: PK {
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: festival {
    type:  string
    sql:  TRIM(${TABLE}.festival) ;;
    drill_fields: [PK]
  }

}
