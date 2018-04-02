view: purchasing {
  derived_table: {
    sql:
    SELECT
  PK,
  purchase_criteria
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(TRIM(What_criteria_do_you_use_to_determine_whether_you_ll_purchase_a_given_tool_,', '))) as  purchase_criteria
GROUP BY 1,2
ORDER BY 1 DESC ;;
  }

  dimension: PK {
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: purchase_criteria {
    type:  string
    sql:  TRIM(${TABLE}.purchase_criteria) ;;
    drill_fields: [PK]
  }

}
