view: learning {
  derived_table: {
    sql:
    SELECT
  PK,
  learning_method
FROM `lookerdata.SpinnerDemo.spin`  AS flow
LEFT JOIN UNNEST(SPLIT(TRIM(When_learning__what_elements_of_instruction_are_most_useful_for_you_,', '))) as  learning_method
GROUP BY 1,2
ORDER BY 1 DESC ;;
  }

  dimension: PK {
    type: number
    sql: ${TABLE}.PK ;;
  }

  dimension: learning_method {
    type:  string
    sql:  TRIM(${TABLE}.learning_method) ;;
    drill_fields: [PK]
  }

}
